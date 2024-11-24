import 'package:provider/provider.dart';
import 'package:viragvarazs/src/models/product/product_model.dart';
import 'package:viragvarazs/src/models/totalCategory/total_category_model.dart';
import 'package:viragvarazs/src/providers/category_provider.dart';
import 'package:viragvarazs/src/ui/custom_loader.dart';
import 'package:viragvarazs/src/ui/widgets/category_product_widget.dart';
import 'package:viragvarazs/src/ui/widgets/custom_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viragvarazs/src/ui/widgets/custom_drawer.dart';

@RoutePage()
class CategoryProductsPage extends StatefulWidget {
  final TotalCategoryModel totalCategory;
  const CategoryProductsPage({super.key, required this.totalCategory});

  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<ProductModel> products;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProvider>(context, listen: false)
          .getCategoryProducts(widget.totalCategory.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    products = Provider.of<CategoryProvider>(context, listen: true).products;
    return Scaffold(
      appBar: CustomAppbar(
        scaffoldKey: scaffoldKey,
        title: widget.totalCategory.name,
      ),
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Provider.of<CategoryProvider>(context, listen: true).isLoading
                ? const SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: true,
                    child: Center(
                      child: CustomLoader(),
                    ),
                  )
                : products.isEmpty
                    ? const SliverFillRemaining(
                        hasScrollBody: false,
                        fillOverscroll: true,
                        child: Center(
                          child: Text("Ez a kategória jelenleg üres"),
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return CategoryProductWidget(
                                productModel: products[index],
                              );
                            },
                            childCount: products.length,
                          ),
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
