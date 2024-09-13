import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:forest_logger/forest_logger.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:viragvarazs/src/models/color/color_model.dart';
import 'package:viragvarazs/src/models/option/option_model.dart';
import 'package:viragvarazs/src/models/size/size_model.dart';
import 'package:viragvarazs/src/providers/product_provider.dart';
import 'package:viragvarazs/src/resources/helpers/message_helper.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/widgets/custom_dropdown_form_field.dart';
import 'package:viragvarazs/src/ui/widgets/custom_elevated_button.dart';
import 'package:viragvarazs/src/ui/widgets/custom_text_form_field.dart';

class CreateProductOptionSheet extends StatefulWidget {
  const CreateProductOptionSheet({super.key});

  @override
  State<CreateProductOptionSheet> createState() =>
      _CreateProductOptionSheetState();
}

class _CreateProductOptionSheetState extends State<CreateProductOptionSheet> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode colorFocus = FocusNode();
  FocusNode sizeFocus = FocusNode();
  FocusNode priceFocus = FocusNode();
  FocusNode emptyFocus = FocusNode();
  ColorModel? selectedColor;
  SizeModel? selectedSize;
  String? price;

  bool isStock = false;
  bool isAvailable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: MediaQuery.of(context).padding.top,
        left: 0,
      ),
      child: GestureDetector(
        onTap: () {
          // FocusScope.of(context).requestFocus(emptyFocus);
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: const BoxDecoration(
              color: ApplicationStyle.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.74,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          height: 80,
                          left: 20,
                          right: 20,
                          child: Center(
                            child: Text(
                              "Új termék opció",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: ApplicationStyle.darkColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          CustomDropDownFormField(
                            height: 52,
                            onChanged: (newColor) {
                              setState(() {
                                selectedColor = newColor as ColorModel;
                              });
                            },
                            onSave: (newColor) {
                              setState(() {
                                selectedColor = newColor as ColorModel;
                              });
                            },
                            title: "Opció színe",
                            placeholder: "Opció színe",
                            currentFocus: colorFocus,
                            initialValue: selectedColor,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: ApplicationStyle.primaryColor,
                            ),
                            iconPadding: 20,
                            items: Provider.of<ProductProvider>(context,
                                    listen: false)
                                .colors
                                .map((item) => DropdownMenuItem<ColorModel>(
                                      value: item,
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: ApplicationStyle.primaryColor,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                          CustomDropDownFormField(
                            height: 52,
                            onChanged: (newSize) {
                              setState(() {
                                selectedSize = newSize as SizeModel;
                              });
                            },
                            onSave: (newSize) {
                              setState(() {
                                selectedSize = newSize as SizeModel;
                              });
                            },
                            title: "Opció mérete",
                            placeholder: "Opció mérete",
                            currentFocus: sizeFocus,
                            initialValue: selectedSize,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: ApplicationStyle.primaryColor,
                            ),
                            iconPadding: 20,
                            items: Provider.of<ProductProvider>(context,
                                    listen: false)
                                .sizes
                                .map((item) => DropdownMenuItem<SizeModel>(
                                      value: item,
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: ApplicationStyle.primaryColor,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                          CustomTextFormField(
                            onSave: (value) {
                              price = value;
                            },
                            validators: [
                              FormBuilderValidators.required(
                                errorText: "Kötelező mező",
                              ),
                            ],
                            currentFocus: sizeFocus,
                            nextFocus: emptyFocus,
                            keyboardType: TextInputType.number,
                            title: "Opció ára (Ft)",
                            placeholder: "x.xxx Ft",
                            fillColor: ApplicationStyle.white,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Opció látható",
                              ),
                              AdvancedSwitch(
                                initialValue: isAvailable,
                                activeColor: ApplicationStyle.primaryColor,
                                inactiveColor: ApplicationStyle.primaryColor
                                    .withOpacity(0.3),
                                activeChild: const Text("Megjelenik"),
                                inactiveChild: Text(
                                  "Nem látható",
                                  style: TextStyle(
                                      color: ApplicationStyle.darkColor
                                          .withOpacity(0.9)),
                                ),
                                width: MediaQuery.of(context).size.width * 0.40,
                                height: 30,
                                borderRadius: BorderRadius.circular(30),
                                onChanged: (value) {
                                  isAvailable = value;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Opció raktáron",
                              ),
                              AdvancedSwitch(
                                initialValue: isStock,
                                activeColor: ApplicationStyle.primaryColor,
                                inactiveColor: ApplicationStyle.primaryColor
                                    .withOpacity(0.3),
                                activeChild: const Text("Raktáron"),
                                inactiveChild: Text(
                                  "3-4 nap",
                                  style: TextStyle(
                                      color: ApplicationStyle.darkColor
                                          .withOpacity(0.9)),
                                ),
                                width: MediaQuery.of(context).size.width * 0.40,
                                height: 30,
                                borderRadius: BorderRadius.circular(30),
                                onChanged: (value) {
                                  isStock = value;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          CustomElevatedButton(
                            title: "Létrehozás",
                            width: MediaQuery.of(context).size.width * 0.8,
                            isLoading: Provider.of<ProductProvider>(context,
                                    listen: true)
                                .isLoading,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                Forest.info(selectedColor.toString());
                                Forest.info(selectedSize.toString());
                                Forest.info(price.toString());
                                if (selectedColor == null ||
                                    selectedSize == null ||
                                    price == null) {
                                  MessageHelper.showToast(
                                    "Kérjük töltse ki az összes mezőt!",
                                  );
                                  return;
                                }
                                OptionModel optionModel = OptionModel(
                                  id: 0,
                                  sku:
                                      "#${selectedColor!.id}--${selectedSize!.id}",
                                  price: int.parse(price!),
                                  available: isAvailable ? 1 : 0,
                                  stock: isStock ? 1 : 0,
                                  color: selectedColor!,
                                  size: selectedSize!,
                                );
                                Navigator.of(context).pop(optionModel);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
