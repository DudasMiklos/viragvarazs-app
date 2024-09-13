import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:viragvarazs/src/resources/helpers/key_helper.dart';
import 'package:viragvarazs/src/resources/intereceptors/exception_interceptor.dart';
import 'package:viragvarazs/src/resources/intereceptors/token_interceptor.dart';
import 'package:viragvarazs/src/services/converter/built_value_converter.dart';
part 'authentication_service.chopper.dart';

@ChopperApi()
abstract class AuthenticationService extends ChopperService {
  @Post(path: "login")
  @multipart
  Future<Response> login({
    @Part('email') required String email,
    @Part('password') required String password,
  });

  @Get(path: "user")
  Future<Response> getUser();

  static AuthenticationService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(KeyHelper.baseUrl),
      services: [
        _$AuthenticationService(),
      ],
      interceptors: [
        ExceptionInterceptor(),
        HttpLoggingInterceptor(),
        TokenInterceptor(),
      ],
      converter: BuiltValueConverter(),
    );

    return _$AuthenticationService(client);
  }
}
