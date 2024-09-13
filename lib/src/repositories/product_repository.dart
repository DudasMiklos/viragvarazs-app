import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:forest_logger/forest_logger.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viragvarazs/src/models/category/category_model.dart';
import 'package:viragvarazs/src/models/color/color_model.dart';
import 'package:viragvarazs/src/models/product/product_model.dart';
import 'package:viragvarazs/src/models/size/size_model.dart';
import 'package:viragvarazs/src/resources/handlers/token_handler.dart';
import 'package:viragvarazs/src/resources/helpers/key_helper.dart';
import 'package:viragvarazs/src/resources/helpers/message_helper.dart';
import 'package:viragvarazs/src/services/product/product_service.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];

    Response response = await ProductService.create().getProductCategories();
    response.body["data"].forEach((element) {
      try {
        CategoryModel competitionModel = CategoryModel.fromJson(element);
        categories.add(competitionModel);
      } catch (e) {
        Forest.critical("Error while parsing CategoryModel:$e");
      }
    });
    return categories;
  }

  static Future<List<ColorModel>> getColors() async {
    List<ColorModel> colors = [];

    Response response = await ProductService.create().getProductColors();
    response.body["data"].forEach((element) {
      try {
        ColorModel competitionModel = ColorModel.fromJson(element);
        colors.add(competitionModel);
      } catch (e) {
        Forest.critical("Error while parsing ColorModel:$e");
      }
    });
    return colors;
  }

  static Future<List<SizeModel>> getSizes() async {
    List<SizeModel> sizes = [];

    Response response = await ProductService.create().getProductSizes();
    response.body["data"].forEach((element) {
      try {
        SizeModel competitionModel = SizeModel.fromJson(element);
        sizes.add(competitionModel);
      } catch (e) {
        Forest.critical("Error while parsing SizeModel:$e");
      }
    });
    return sizes;
  }

  static Future<List<ProductModel>> getAllProduct() async {
    List<ProductModel> products = [];

    Response response = await ProductService.create().getAllProducts();
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

  static Future<ProductModel?> createProduct(
      ProductModel productModel, XFile image) async {
    String? token = await TokenHandler.getToken();
    List<int> fileInBytes = await image.readAsBytes();
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        "${KeyHelper.baseUrl}/product/create",
      ),
    );
    request.headers.addAll(
      {
        "authorization": "Bearer ${token ?? ""}",
      },
    );
    List<Map> optionsInMap = [];
    if (productModel.options != null) {
      if (productModel.options!.isNotEmpty) {
        for (var element in productModel.options!) {
          optionsInMap.add({
            "color_id": element.color.id,
            "size_id": element.size.id,
            "available": element.available,
            "stock": element.stock,
            "price": element.price,
          });
        }
      }
    }

    String categories = "";
    if (productModel.categories != null) {
      if (productModel.categories!.isNotEmpty) {
        for (var element in productModel.categories!) {
          categories += "${element.id},";
        }
      }
    }
    categories = categories.substring(0, categories.length - 1);

    request.fields.addAll({
      "name": productModel.name,
      "description": productModel.description,
      "options": jsonEncode(optionsInMap),
      "categories": categories,
    });
    request.files.add(
      http.MultipartFile.fromBytes(
        'image',
        fileInBytes,
        filename: image.path.split("/").last,
      ),
    );
    http.StreamedResponse response = await request.send();
    final responseString = await response.stream.bytesToString();
    var jsonResponse = jsonDecode(responseString);
    Forest.info(responseString);
    if (response.statusCode == 404) {
      throw UnimplementedError();
    }
    if (response.statusCode != 200) {
      throw UnimplementedError();
    }

    return ProductModel.fromJson(jsonResponse['data']['product']);
  }

  static Future<ProductModel?> updateProduct(
      ProductModel productModel, XFile? image) async {
    String? token = await TokenHandler.getToken();
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        "${KeyHelper.baseUrl}/product/update",
      ),
    );
    request.headers.addAll(
      {
        "authorization": "Bearer ${token ?? ""}",
      },
    );
    List<Map> optionsInMap = [];
    if (productModel.options != null) {
      if (productModel.options!.isNotEmpty) {
        for (var element in productModel.options!) {
          optionsInMap.add({
            "id": element.id,
            "color_id": element.color.id,
            "size_id": element.size.id,
            "available": element.available,
            "stock": element.stock,
            "price": element.price,
          });
        }
      }
    }

    Forest.warning(optionsInMap.toString());

    String categories = "";
    if (productModel.categories != null) {
      if (productModel.categories!.isNotEmpty) {
        for (var element in productModel.categories!) {
          categories += "${element.id},";
        }
      }
    }
    categories = categories.substring(0, categories.length - 1);

    request.fields.addAll({
      "id": productModel.id.toString(),
      "name": productModel.name,
      "description": productModel.description,
      "imageUrl": productModel.imageUrl,
      "options": jsonEncode(optionsInMap),
      "categories": categories,
    });

    if (image != null) {
      List<int> fileInBytes = await image.readAsBytes();
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          fileInBytes,
          filename: image.path.split("/").last,
        ),
      );
    }

    http.StreamedResponse response = await request.send();
    final responseString = await response.stream.bytesToString();
    var jsonResponse = jsonDecode(responseString);
    Forest.info(responseString);
    if (response.statusCode == 404) {
      throw UnimplementedError();
    }
    if (response.statusCode != 200) {
      throw UnimplementedError();
    }

    return ProductModel.fromJson(jsonResponse['data']['product']);
  }

  static Future<List<String>?> askForProductNames(
      String? imageUrl, XFile? image) async {
    String? token = await TokenHandler.getToken();
    if (imageUrl == "https://placehold.co/300x400.png" && image == null) {
      MessageHelper.showToast("Töltsön fel egy képet először!");
      throw Exception("No image or imageUrl provided");
    }
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("${KeyHelper.baseUrl}/product/ask-for-names"),
    );
    request.headers.addAll({
      "authorization": "Bearer ${token ?? ""}",
    });

    try {
      if (image != null) {
        List<int> fileInBytes = await image.readAsBytes();
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            fileInBytes,
            filename: image.path.split("/").last,
          ),
        );
      }
    } catch (e) {
      Forest.error("Error while adding image to the request: $e");
    }

    if (imageUrl != "https://placehold.co/300x400.png") {
      request.fields.addAll({
        "imageUrl": imageUrl ?? "",
      });
    }
    http.StreamedResponse response = await request.send();

    final responseString = await response.stream.bytesToString();
    Forest.info(responseString);
    Forest.info(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(responseString);
        return jsonResponse['data']['names'].cast<String>();
      } catch (e) {
        Forest.error("Error while parsing response: $e");
        return null;
      }
    } else if (response.statusCode == 422) {
      MessageHelper.showToast("Töltsön fel egy képet először!");
      throw Exception("Unprocessable Entity (422)");
    } else {
      throw Exception(
          "Failed to request product description, status code: ${response.statusCode}");
    }
  }

  static Future<String?> askForProductDescription(
      String? imageUrl, XFile? image) async {
    String? token = await TokenHandler.getToken();
    if (imageUrl == "https://placehold.co/300x400.png" && image == null) {
      MessageHelper.showToast("Töltsön fel egy képet először!");
      throw Exception("No image or imageUrl provided");
    }
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("${KeyHelper.baseUrl}/product/ask-for-description"),
    );
    request.headers.addAll({
      "authorization": "Bearer ${token ?? ""}",
    });

    try {
      if (image != null) {
        List<int> fileInBytes = await image.readAsBytes();
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            fileInBytes,
            filename: image.path.split("/").last,
          ),
        );
      }
    } catch (e) {
      Forest.error("Error while adding image to the request: $e");
    }

    if (imageUrl != "https://placehold.co/300x400.png") {
      request.fields.addAll({
        "imageUrl": imageUrl ?? "",
      });
    }
    http.StreamedResponse response = await request.send();

    final responseString = await response.stream.bytesToString();
    Forest.info(responseString);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(responseString);
      return jsonResponse['data']['description'];
    } else if (response.statusCode == 422) {
      MessageHelper.showToast("Töltsön fel egy képet először!");
      throw Exception("Unprocessable Entity (422)");
    } else {
      throw Exception(
          "Failed to request product description, status code: ${response.statusCode}");
    }
  }
}
