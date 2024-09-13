import 'package:viragvarazs/src/exceptions/custom_exception.dart';

class UnknownErrorException implements CustomException {
  @override
  final String message = "exception_unknown_error_exception";
  @override
  final String code = "unkown_error_exception";

  @override
  String toCode() {
    return code;
  }

  @override
  String toString() {
    return message;
  }
}
