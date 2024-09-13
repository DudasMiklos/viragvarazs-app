import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:viragvarazs/src/resources/helpers/key_helper.dart';
import 'package:viragvarazs/src/resources/intereceptors/exception_interceptor.dart';
import 'package:viragvarazs/src/resources/intereceptors/token_interceptor.dart';
import 'package:viragvarazs/src/services/converter/built_value_converter.dart';
part 'product_service.chopper.dart';

@ChopperApi()
abstract class ProductService extends ChopperService {
  @Get(path: "product/all")
  Future<Response> getAllProducts();

  @Get(path: "product/colors")
  Future<Response> getProductColors();

  @Get(path: "product/sizes")
  Future<Response> getProductSizes();

  @Get(path: "product/categories")
  Future<Response> getProductCategories();

  static ProductService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(KeyHelper.baseUrl),
      services: [
        _$ProductService(),
      ],
      interceptors: [
        ExceptionInterceptor(),
        HttpLoggingInterceptor(),
        TokenInterceptor(),
      ],
      converter: BuiltValueConverter(),
    );

    return _$ProductService(client);
  }
}
