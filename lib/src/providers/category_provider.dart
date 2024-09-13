import 'package:forest_logger/forest_logger.dart';
import 'package:viragvarazs/src/exceptions/exception_handler.dart';
import 'package:viragvarazs/src/models/product/product_model.dart';
import 'package:viragvarazs/src/models/totalCategory/total_category_model.dart';
import 'package:viragvarazs/src/repositories/category_repository.dart';
import 'package:viragvarazs/src/resources/interfaces/loading_interface.dart';

class CategoryProvider extends LoadingInterface {
  List<TotalCategoryModel> totalCategories = [];
  List<ProductModel> products = [];

  Future<Exception?> getAllTotalCategories() async {
    try {
      isLoading = true;
      totalCategories = await CategoryRepository.getAllTotalCategories();
      isLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> getCategoryProducts(int id) async {
    try {
      isLoading = true;
      products = await CategoryRepository.getCategoryProducts(id);
      isLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }
}
