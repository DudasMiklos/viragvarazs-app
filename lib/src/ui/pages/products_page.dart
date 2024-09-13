import 'package:provider/provider.dart';
import 'package:viragvarazs/src/models/product/product_model.dart';
import 'package:viragvarazs/src/providers/product_provider.dart';
import 'package:viragvarazs/src/resources/routes/app_routes.gr.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/custom_loader.dart';
import 'package:viragvarazs/src/ui/widgets/category_product_widget.dart';
import 'package:viragvarazs/src/ui/widgets/custom_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viragvarazs/src/ui/widgets/custom_drawer.dart';
import 'package:viragvarazs/src/ui/widgets/custom_text_form_field.dart';

@RoutePage()
class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<ProductModel> products;
  late List<ProductModel> filteredProducts;

  @override
  void initState() {
    super.initState();
    products = Provider.of<ProductProvider>(context, listen: false).products;
    filteredProducts = products;
  }

  @override
  Widget build(BuildContext context) {
    products = Provider.of<ProductProvider>(context, listen: true).products;
    if (products ==
        Provider.of<ProductProvider>(context, listen: false).products) {
      filteredProducts = products;
    }
    return Scaffold(
      appBar: CustomAppbar(
        scaffoldKey: scaffoldKey,
        title: "Termékek",
        onCreateTap: () {
          AutoRouter.of(context).push(
            const CreateProductRoute(),
          );
        },
      ),
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomTextFormField(
                onSave: (value) {},
                onChanged: (value) {
                  setState(() {
                    if (value == null || value == "") {
                      filteredProducts = products;
                    } else {
                      filteredProducts = products
                          .where((element) => element.name
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    }
                  });
                },
                validators: const [],
                placeholder: "Keresés...",
                fillColor: ApplicationStyle.white,
                bottomPadding: 8,
              ),
            ),
            Expanded(
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
                      : filteredProducts.isEmpty
                          ? const SliverFillRemaining(
                              hasScrollBody: false,
                              fillOverscroll: true,
                              child: Center(
                                child:
                                    Text("Nincs a keresésnek megfelelő termék"),
                              ),
                            )
                          : SliverPadding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return CategoryProductWidget(
                                      productModel: filteredProducts[index],
                                    );
                                  },
                                  childCount: filteredProducts.length,
                                ),
                              ),
                            )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
