import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:viragvarazs/src/resources/handlers/token_handler.dart';

class TokenInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    String? token = await TokenHandler.getToken();
    if (token != null) {
      if (token.isNotEmpty) {
        final request = applyHeader(
          chain.request,
          "authorization",
          'Bearer $token',
        );
        final response = await chain.proceed(request);
        if (response.statusCode == 401) {
          throw Exception("Token is invalid");
        }
        return response;
      }
    }
    return chain.proceed(chain.request);
  }
}
