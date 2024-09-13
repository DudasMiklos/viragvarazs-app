import 'custom_exception.dart';

class InvalidTokenException implements CustomException {
  @override
  final String message = "exception_invalid_token";

  @override
  final String code = "unauthorized";

  InvalidTokenException();

  @override
  String toCode() {
    return code;
  }

  @override
  String toString() {
    return message;
  }
}
