import 'package:provider/provider.dart';
import 'package:viragvarazs/src/models/totalCategory/total_category_model.dart';
import 'package:viragvarazs/src/providers/category_provider.dart';
import 'package:viragvarazs/src/resources/routes/app_routes.dart';
import 'package:viragvarazs/src/ui/custom_loader.dart';
import 'package:viragvarazs/src/ui/widgets/custom_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viragvarazs/src/ui/widgets/custom_drawer.dart';
import 'package:viragvarazs/src/ui/widgets/total_category_widget.dart';

@RoutePage()
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<TotalCategoryModel> totalCategories;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    totalCategories =
        Provider.of<CategoryProvider>(context, listen: true).totalCategories;
    return Scaffold(
      appBar: CustomAppbar(
        scaffoldKey: scaffoldKey,
        title: "Kategóriák",
        onCreateTap: () {},
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
                : SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * 0.5,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 3 / 4.92,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              AutoRouter.of(context).push(
                                CategoryProductsRoute(
                                  totalCategory: totalCategories[index],
                                ),
                              );
                            },
                            child: TotalCategoryWidget(
                              totalCategory: totalCategories[index],
                            ),
                          );
                        },
                        childCount: totalCategories.length,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
