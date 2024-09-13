import 'package:viragvarazs/src/resources/helpers/key_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(KeyHelper.themePreferenceKey, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(KeyHelper.themePreferenceKey) ?? false;
  }
}
