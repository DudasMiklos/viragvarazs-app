import 'package:shared_preferences/shared_preferences.dart';
import 'package:viragvarazs/src/resources/helpers/key_helper.dart';

class TokenHandler {
  static String? cachedToken;

  static Future<void> persistToken({required String token}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(KeyHelper.tokenKey, token);
  }

  static Future<void> deleteToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(KeyHelper.tokenKey);
  }

  static Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Object? value = sharedPreferences.get(KeyHelper.tokenKey);
    String? freshToken;
    if (value != null) {
      freshToken = (value as String);
      cachedToken = freshToken;
    }
    return freshToken;
  }
}
