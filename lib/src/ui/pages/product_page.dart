import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:forest_logger/forest_logger.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:viragvarazs/src/models/category/category_model.dart';
import 'package:viragvarazs/src/models/option/option_model.dart';
import 'package:viragvarazs/src/models/product/product_model.dart';
import 'package:viragvarazs/src/providers/product_provider.dart';
import 'package:viragvarazs/src/resources/extensions/string_extension.dart';
import 'package:viragvarazs/src/resources/helpers/image_helper.dart';
import 'package:viragvarazs/src/resources/helpers/message_helper.dart';
import 'package:viragvarazs/src/resources/helpers/popup_helper.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/custom_loader.dart';
import 'package:viragvarazs/src/ui/sheets/createProductOptionSheet.dart';
import 'package:viragvarazs/src/ui/sheets/editProductOptionSheet.dart';
import 'package:viragvarazs/src/ui/widgets/custom_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viragvarazs/src/ui/widgets/custom_drawer.dart';
import 'package:viragvarazs/src/ui/widgets/custom_outlined_button.dart';
import 'package:viragvarazs/src/ui/widgets/custom_small_elevated_button.dart';
import 'package:viragvarazs/src/ui/widgets/custom_small_outlined_button.dart';
import 'package:viragvarazs/src/ui/widgets/custom_text_form_field.dart';
import 'package:viragvarazs/src/ui/widgets/product_option_widget.dart';

@RoutePage()
class ProductPage extends StatefulWidget {
  final ProductModel product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ProductModel _product;
  late List<CategoryModel> _categories;
  late List<String> _generatedNames;
  ImageProvider productImageProvider =
      Image.network("https://placehold.co/400x400").image;

  final _formKey = GlobalKey<FormState>();

  final _nameFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _emptyFocus = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool hasSelectedPhoto = false;
  XFile? picture;

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).generatedDescription =
        "";
    Provider.of<ProductProvider>(context, listen: false).generatedNames = [];
    Provider.of<ProductProvider>(context, listen: false).selectedName = "";
    super.initState();
    _product = widget.product;
    Forest.success(_product.toString());

    productImageProvider = CachedNetworkImageProvider(_product.imageUrl);
    _descriptionController.text =
        _product.description.replaceAll(RegExp(r'<br\s*/?>'), '\n');
    _nameController.text = _product.name;
  }

  void toggleCategorySelection(CategoryModel category) {
    if (_product.categories!.any((c) => c.id == category.id)) {
      _product = _product.copyWith(
        categories:
            _product.categories!.where((c) => c.id != category.id).toList(),
      );
    } else {
      _product = _product.copyWith(
        categories: [..._product.categories!, category],
      );
    }

    Forest.success(_product.categories.toString());
  }

  @override
  Widget build(BuildContext context) {
    _categories =
        Provider.of<ProductProvider>(context, listen: true).categories;
    _generatedNames =
        Provider.of<ProductProvider>(context, listen: true).generatedNames;
    Forest.debug(_categories.toString());
    return Scaffold(
      appBar: CustomAppbar(
        scaffoldKey: scaffoldKey,
        title: _product.name,
        isSaveLoading: Provider.of<ProductProvider>(context, listen: true)
            .isSaveProductLoading,
        onSaveTap: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            if (_product.categories!.isEmpty) {
              MessageHelper.showToast("Válasszon legalább egy kategóriát");
              return;
            }
            if (_product.options!.isEmpty) {
              MessageHelper.showToast("Adjon hozzá legalább egy opciót");
              return;
            }
            if (_product.name.length > 24) {
              MessageHelper.showToast(
                  "A termék neve maximum 24 karakter lehet");
              return;
            }
            if (_product.description.length > 460) {
              MessageHelper.showToast(
                  "A termék leírása maximum 460 karakter lehet");
              return;
            }
            if (_product.imageUrl == "https://placehold.co/300x400.png" &&
                picture == null) {
              MessageHelper.showToast("Töltsön fel egy képet először!");
              return;
            }
            await Provider.of<ProductProvider>(context, listen: false)
                .updateProduct(_product, picture)
                .then((value) {
              if (value == null) {
                MessageHelper.showToast("Sikeres termék modosítás");
                AutoRouter.of(context).maybePop();
              } else {
                Forest.error(value.toString());
                MessageHelper.showToast(
                    "Hiba történt a termék modosítása során");
              }
            });
          }
        },
      ),
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Provider.of<ProductProvider>(context, listen: true).isLoading
                ? const SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: true,
                    child: Center(
                      child: CustomLoader(),
                    ),
                  )
                : SliverPadding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.42,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: GestureDetector(
                                    onTap: () {
                                      showImageViewer(
                                          context, productImageProvider,
                                          onViewerDismissed: () {
                                        debugPrint("dismissed");
                                      });
                                    },
                                    child: AspectRatio(
                                      aspectRatio: 3 / 4,
                                      child: CachedNetworkImage(
                                        imageUrl: widget.product.imageUrl,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                            color:
                                                ApplicationStyle.primaryColor,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error_outline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: MultiSelectContainer(
                                    items: [
                                      for (var category
                                          in _categories) // Correct iteration syntax
                                        MultiSelectCard(
                                          value: category.id,
                                          label: category.name,
                                          selected: _product.categories!
                                              .any((c) => c.id == category.id),
                                        )
                                    ],
                                    alignments: const MultiSelectAlignments(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                    itemsDecoration: MultiSelectDecorations(
                                      selectedDecoration: BoxDecoration(
                                        color: ApplicationStyle.primaryColor,
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      decoration: BoxDecoration(
                                        color: ApplicationStyle.white,
                                        borderRadius: BorderRadius.circular(22),
                                        border: Border.all(
                                          color: ApplicationStyle.primaryColor
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    onChange: (allSelectedItems, selectedItem) {
                                      toggleCategorySelection(
                                          _categories.firstWhere(
                                              (c) => c.id == selectedItem));
                                    }),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomSmallOutlinedButton(
                                  onTap: () async {
                                    picture = await ImageHelper()
                                        .getImageFromGallery(context: context);
                                    if (picture != null) {
                                      productImageProvider =
                                          Image.file(File(picture!.path)).image;
                                      setState(() {
                                        hasSelectedPhoto = true;
                                      });
                                    }
                                  },
                                  title: 'Új kép feltöltése',
                                  height: 24,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  textColor: ApplicationStyle.primaryColor,
                                  foregroundColor:
                                      ApplicationStyle.primaryColor,
                                ),
                                CustomSmallOutlinedButton(
                                  onTap: () {
                                    showImageViewer(
                                        context, productImageProvider,
                                        onViewerDismissed: () {
                                      debugPrint("dismissed");
                                    });
                                  },
                                  title: 'Kép megnyitása',
                                  height: 24,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  textColor: ApplicationStyle.primaryColor,
                                  foregroundColor:
                                      ApplicationStyle.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  controller: _nameController,
                                  onSave: (value) {
                                    _product =
                                        _product.copyWith(name: value ?? "");
                                  },
                                  title: 'Termék neve (max 24 karakter)',
                                  placeholder: 'Termék neve',
                                  validators: [
                                    FormBuilderValidators.required(
                                        errorText: "A mező kitöltése kötelező"),
                                  ],
                                  fillColor: ApplicationStyle.white,
                                  currentFocus: _nameFocus,
                                  nextFocus: _descriptionFocus,
                                  onChanged: (value) {
                                    _product =
                                        _product.copyWith(name: value ?? "");
                                  },
                                  bottomPadding: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: CustomSmallElevatedButton(
                                        isLoading: Provider.of<ProductProvider>(
                                                context,
                                                listen: true)
                                            .isGenerateProductNamesLoading,
                                        onTap: () async {
                                          if (_product.imageUrl ==
                                                  "https://placehold.co/300x400.png" &&
                                              picture == null) {
                                            MessageHelper.showToast(
                                                "Töltsön fel egy képet először!");
                                            return;
                                          }
                                          await Provider.of<ProductProvider>(
                                                  context,
                                                  listen: false)
                                              .askForProductNames(
                                                  _product.imageUrl, picture)
                                              .then((data) async {
                                            _generatedNames =
                                                Provider.of<ProductProvider>(
                                                        context,
                                                        listen: false)
                                                    .generatedNames;
                                            await PopUpHelper
                                                .showCustomDialogWithBody(
                                              context,
                                              body: Container(
                                                decoration: BoxDecoration(
                                                  color: ApplicationStyle.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: Column(
                                                    children: [
                                                      const Text(
                                                        "Ajánlott termék nevek",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      Expanded(
                                                        child: CustomScrollView(
                                                          slivers: [
                                                            SliverPadding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              sliver:
                                                                  SliverList(
                                                                delegate:
                                                                    SliverChildListDelegate([
                                                                  for (var name
                                                                      in _generatedNames)
                                                                    CustomOutlinedButton(
                                                                      onTap:
                                                                          () {
                                                                        Provider.of<ProductProvider>(context, listen: false).selectedName =
                                                                            name.capitalize();
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      title: name
                                                                          .capitalize(),
                                                                      textColor:
                                                                          ApplicationStyle
                                                                              .primaryColor,
                                                                      foregroundColor:
                                                                          ApplicationStyle
                                                                              .primaryColor,
                                                                    )
                                                                ]),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      CustomOutlinedButton(
                                                        title: "Mégse",
                                                        backgroundColor:
                                                            ApplicationStyle
                                                                .primaryColor,
                                                        textColor:
                                                            ApplicationStyle
                                                                .white,
                                                        foregroundColor:
                                                            ApplicationStyle
                                                                .white,
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                            Forest.success(
                                                Provider.of<ProductProvider>(
                                                        context,
                                                        listen: false)
                                                    .selectedName
                                                    .toString());
                                            setState(() {
                                              _product = _product.copyWith(
                                                  name: Provider.of<
                                                              ProductProvider>(
                                                          context,
                                                          listen: false)
                                                      .selectedName);
                                              _nameController.text =
                                                  _product.name;
                                            });

                                            // You can update UI or perform other actions here
                                          }).catchError((error) {
                                            // Handle any errors here
                                            Forest.error(error.toString());
                                            MessageHelper.showToast(
                                                "Ismeretlen hiba történt");
                                          });
                                        },
                                        title: Provider.of<ProductProvider>(
                                                    context,
                                                    listen: false)
                                                .generatedNames
                                                .isEmpty
                                            ? 'Új termék nevek generálása AI-al'
                                            : 'Több termék nevek generálása AI-al',
                                        height: 24,
                                        width: 300,
                                        backgroundColor:
                                            Provider.of<ProductProvider>(
                                                        context,
                                                        listen: false)
                                                    .generatedNames
                                                    .isEmpty
                                                ? ApplicationStyle.primaryColor
                                                : ApplicationStyle.blueColor,
                                      ),
                                    ),
                                  ],
                                ),
                                CustomTextFormField(
                                  onSave: (value) {},
                                  title: 'Termék leírása (max 460 karakter)',
                                  controller: _descriptionController,
                                  placeholder: 'Termék leírása',
                                  validators: [
                                    FormBuilderValidators.required(
                                      errorText: "A mező kitöltése kötelező",
                                    ),
                                  ],
                                  fillColor: ApplicationStyle.white,
                                  currentFocus: _descriptionFocus,
                                  nextFocus: _emptyFocus,
                                  maxLines: 10,
                                  onChanged: (value) {
                                    String savedDescription =
                                        value?.replaceAll('\n', '<br>') ?? '';
                                    _product = _product.copyWith(
                                        description: savedDescription);
                                  },
                                  bottomPadding: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomSmallElevatedButton(
                                      isLoading: Provider.of<ProductProvider>(
                                              context,
                                              listen: true)
                                          .isGenerateProductDescriptionLoading,
                                      onTap: () async {
                                        await Provider.of<ProductProvider>(
                                                context,
                                                listen: false)
                                            .askForProductDescription(
                                                _product.imageUrl, picture)
                                            .then((data) {
                                          setState(() {
                                            _product = _product.copyWith(
                                                description: Provider.of<
                                                            ProductProvider>(
                                                        context,
                                                        listen: false)
                                                    .generatedDescription);
                                            _descriptionController.text =
                                                _product.description;
                                          });

                                          // You can update UI or perform other actions here
                                        }).catchError((error) {
                                          // Handle any errors here
                                          MessageHelper.showToast(
                                              "Ismeretlen hiba történt");
                                        });
                                      },
                                      title: Provider.of<ProductProvider>(
                                                      context,
                                                      listen: false)
                                                  .generatedDescription ==
                                              ""
                                          ? 'Új termék leírás generálása AI-al'
                                          : 'Termék leírás újra generálása AI-al',
                                      backgroundColor:
                                          Provider.of<ProductProvider>(context,
                                                          listen: false)
                                                      .generatedDescription ==
                                                  ""
                                              ? ApplicationStyle.primaryColor
                                              : ApplicationStyle.blueColor,
                                      height: 24,
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 8, right: 8, top: 8),
                            child: Stack(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Termék opciók",
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Positioned(
                                  right: 0,
                                  top: -10,
                                  bottom: 0,
                                  child: IconButton(
                                    onPressed: () async {
                                      final returnedData =
                                          await showMaterialModalBottomSheet(
                                        context: context,
                                        isDismissible: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return const CreateProductOptionSheet();
                                        },
                                      );
                                      if (returnedData is OptionModel) {
                                        setState(() {
                                          _product = _product.copyWith(
                                            options: [
                                              ..._product.options!,
                                              returnedData
                                            ],
                                          );
                                        });
                                      }
                                      Forest.warning(returnedData.toString());
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: _product.options != null && _product.options!.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildListDelegate([
                        for (var option in _product.options!)
                          ProductOptionWidget(
                            optionModel: option,
                            onAvailableChanged: (value) {
                              _product = _product.copyWith(
                                options: _product.options!
                                    .map((o) => o.sku == option.sku
                                        ? option.copyWith(available: value)
                                        : o)
                                    .toList(),
                              );
                            },
                            onStockChanged: (value) {
                              _product = _product.copyWith(
                                options: _product.options!
                                    .map((o) => o.sku == option.sku
                                        ? option.copyWith(stock: value)
                                        : o)
                                    .toList(),
                              );
                            },
                            onEdit: () async {
                              final returnedData =
                                  await showMaterialModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return EditProductOptionSheet(
                                    optionModel: option,
                                  );
                                },
                              );
                              if (returnedData is OptionModel) {
                                setState(() {
                                  _product = _product.copyWith(
                                    options: _product.options!.map((option) {
                                      return option.sku == returnedData.sku
                                          ? returnedData
                                          : option;
                                    }).toList(),
                                  );
                                });
                              }
                              Forest.warning(returnedData.toString());
                            },
                          ),
                      ]),
                    )
                  : const SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: true,
                      child: Center(
                        child: Text("Nincs még opció a termékhez"),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
