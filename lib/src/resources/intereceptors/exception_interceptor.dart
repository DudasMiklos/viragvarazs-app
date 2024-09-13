import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:forest_logger/forest_logger.dart';
import 'package:viragvarazs/src/exceptions/exception_handler.dart';
import 'package:viragvarazs/src/exceptions/invalid_token_exception.dart';
import 'package:viragvarazs/src/exceptions/unknown_error_exception.dart';

class ExceptionInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    Map<String, dynamic> body;
    final response = await chain.proceed(chain.request);
    try {
      body = jsonDecode(response.bodyString);
    } catch (e) {
      Forest.debug(response.bodyString);
      throw UnknownErrorException();
    }
    if (body["status"] != 200) {
      Forest.debug(response.bodyString);
      if (body["status"] == null) {
        Forest.debug("Unknown error: ${response.bodyString}");
        throw UnknownErrorException();
      }
      if (body["status"] == 401) {
        Forest.debug("Invalid token: ${response.bodyString}");
        throw InvalidTokenException();
      }
      if (body["status"] == 404) {
        return response;
      }
      Forest.debug("CustomExcepiton: ${response.bodyString}");
      throw ExceptionHandler.convertCodeToException(
        body["status"] ?? "unknown_error_exception",
      );
    }

    return response;
  }
}
