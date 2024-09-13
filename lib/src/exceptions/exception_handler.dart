import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:viragvarazs/src/exceptions/custom_exception.dart';
import 'package:viragvarazs/src/exceptions/invalid_token_exception.dart';
import 'package:viragvarazs/src/exceptions/unknown_error_exception.dart';

class ExceptionHandler {
  static final List<CustomException> exceptions = [
    UnknownErrorException(),
    InvalidTokenException(),
  ];

  static Exception convertCodeToException(String errorCode) {
    for (int x = 0; x < exceptions.length; x++) {
      if (exceptions[x].toCode() == errorCode) {
        return exceptions[x];
      }
    }

    return UnknownErrorException();
  }

  static SnackBar getSnack(
    String defaultMessage,
    CustomException exception,
    BuildContext context,
  ) {
    SnackBar snackBar = SnackBar(
      content: Text(
        getMessageByException(defaultMessage, exception, context),
      ),
    );

    return snackBar;
  }

  static Exception returnException(Object e) {
    if (e is Exception) {
      return e;
    }
    if (e is CustomException) {
      return e;
    }
    return UnknownErrorException();
  }

  static String getMessageByException(
    String defaultMessage,
    Exception exception,
    BuildContext context,
  ) {
    if (exception is UnknownErrorException) {
      return defaultMessage;
    }
    if (exception is CustomException) {
      return exception.toString();
    }
    log(exception.toString());
    return defaultMessage;
  }
}
