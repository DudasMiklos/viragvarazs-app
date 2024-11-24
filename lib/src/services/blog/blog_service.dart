import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:viragvarazs/src/resources/helpers/key_helper.dart';
import 'package:viragvarazs/src/resources/intereceptors/exception_interceptor.dart';
import 'package:viragvarazs/src/resources/intereceptors/token_interceptor.dart';
import 'package:viragvarazs/src/services/converter/built_value_converter.dart';
part 'blog_service.chopper.dart';

@ChopperApi()
abstract class BlogService extends ChopperService {
  @Get(path: "blog/all")
  Future<Response> getAllPosts();

  static BlogService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(KeyHelper.baseUrl),
      services: [
        _$BlogService(),
      ],
      interceptors: [
        ExceptionInterceptor(),
        HttpLoggingInterceptor(),
        TokenInterceptor(),
      ],
      converter: BuiltValueConverter(),
    );

    return _$BlogService(client);
  }
}
