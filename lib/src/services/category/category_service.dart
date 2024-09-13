import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:viragvarazs/src/resources/helpers/key_helper.dart';
import 'package:viragvarazs/src/resources/intereceptors/exception_interceptor.dart';
import 'package:viragvarazs/src/resources/intereceptors/token_interceptor.dart';
import 'package:viragvarazs/src/services/converter/built_value_converter.dart';
part 'category_service.chopper.dart';

@ChopperApi()
abstract class CategoryService extends ChopperService {
  @Get(path: "category/all")
  Future<Response> getAllTotalCategories();

  @Post(path: "category/products")
  @multipart
  Future<Response> getCategoryProducts({
    @Part('id') required int id,
  });

  static CategoryService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(KeyHelper.baseUrl),
      services: [
        _$CategoryService(),
      ],
      interceptors: [
        ExceptionInterceptor(),
        HttpLoggingInterceptor(),
        TokenInterceptor(),
      ],
      converter: BuiltValueConverter(),
    );

    return _$CategoryService(client);
  }
}
