import 'package:chopper/chopper.dart';
import 'package:forest_logger/forest_logger.dart';
import 'package:viragvarazs/src/models/product/product_model.dart';
import 'package:viragvarazs/src/models/totalCategory/total_category_model.dart';
import 'package:viragvarazs/src/services/category/category_service.dart';

class CategoryRepository {
  static Future<List<TotalCategoryModel>> getAllTotalCategories() async {
    List<TotalCategoryModel> categories = [];

    Response response = await CategoryService.create().getAllTotalCategories();
    response.body["data"].forEach((element) {
      try {
        TotalCategoryModel competitionModel =
            TotalCategoryModel.fromJson(element);
        categories.add(competitionModel);
      } catch (e) {
        Forest.critical("Error while parsing TotalCategoryModel:$e");
      }
    });
    return categories;
  }

  static Future<List<ProductModel>> getCategoryProducts(int id) async {
    List<ProductModel> products = [];

    Response response =
        await CategoryService.create().getCategoryProducts(id: id);
    response.body["data"].forEach((element) {
      try {
        ProductModel competitionModel = ProductModel.fromJson(element);
        products.add(competitionModel);
      } catch (e) {
        Forest.critical("Error while parsing ProductModel:$e");
      }
    });
    return products;
  }
}
