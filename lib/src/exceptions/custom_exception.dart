abstract class CustomException implements Exception {
  final String message;
  final String code;

  CustomException([this.message = "", this.code = ""]);

  String toCode() {
    return code;
  }
}
