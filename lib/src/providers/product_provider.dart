import 'package:forest_logger/forest_logger.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viragvarazs/src/exceptions/exception_handler.dart';
import 'package:viragvarazs/src/models/category/category_model.dart';
import 'package:viragvarazs/src/models/color/color_model.dart';
import 'package:viragvarazs/src/models/product/product_model.dart';
import 'package:viragvarazs/src/models/size/size_model.dart';
import 'package:viragvarazs/src/repositories/product_repository.dart';
import 'package:viragvarazs/src/resources/interfaces/loading_interface.dart';

class ProductProvider extends LoadingInterface {
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  List<SizeModel> sizes = [];
  List<ColorModel> colors = [];

  String generatedDescription = "";
  List<String> generatedNames = [];
  String selectedName = "";

  Future<Exception?> getAllProducts() async {
    try {
      isLoading = true;
      products = await ProductRepository.getAllProduct();
      isLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> loadBaseData() async {
    try {
      categories = await ProductRepository.getCategories();
      sizes = await ProductRepository.getSizes();
      colors = await ProductRepository.getColors();
      return null;
    } catch (e) {
      Forest.error(e.toString());
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> getCategories() async {
    try {
      isLoading = true;
      categories = await ProductRepository.getCategories();
      isLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> getSizes() async {
    try {
      isLoading = true;
      sizes = await ProductRepository.getSizes();
      isLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> getColors() async {
    try {
      isLoading = true;
      colors = await ProductRepository.getColors();
      isLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> createProduct(
      ProductModel productModel, XFile image) async {
    try {
      isSaveProductLoading = true;
      ProductModel? newProduct =
          await ProductRepository.createProduct(productModel, image);
      if (newProduct != null) {
        products.add(newProduct);
      }
      isSaveProductLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isSaveProductLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> updateProduct(
      ProductModel productModel, XFile? image) async {
    try {
      isSaveProductLoading = true;
      ProductModel? newProduct =
          await ProductRepository.updateProduct(productModel, image);
      if (newProduct is ProductModel) {
        products.removeWhere((element) => element.id == newProduct.id);
        products.add(newProduct);
      }
      isSaveProductLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isSaveProductLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> askForProductNames(String? imageUrl, XFile? image) async {
    try {
      isGenerateProductNamesLoading = true;
      List<String>? response =
          await ProductRepository.askForProductNames(imageUrl, image);
      Forest.success("Product names: $response");
      generatedNames.addAll(response ?? []);
      isGenerateProductNamesLoading = false;
      return null;
    } catch (e) {
      isGenerateProductNamesLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> askForProductDescription(
      String? imageUrl, XFile? image) async {
    try {
      isGenerateProductDescriptionLoading = true;
      String? response =
          await ProductRepository.askForProductDescription(imageUrl, image);
      Forest.success("Product description: $response");
      generatedDescription = response ?? "";
      isGenerateProductDescriptionLoading = false;
      return null;
    } catch (e) {
      isGenerateProductDescriptionLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }
}
