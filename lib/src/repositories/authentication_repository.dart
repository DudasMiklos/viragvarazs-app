import 'package:chopper/chopper.dart';
import 'package:viragvarazs/src/models/user/user_model.dart';
import 'package:viragvarazs/src/resources/handlers/token_handler.dart';
import 'package:viragvarazs/src/services/authentication/authentication_service.dart';

class AuthenticationRepository {
  static Future<void> login(String email, String password) async {
    Response response = await AuthenticationService.create().login(
      email: email,
      password: password,
    );

    String? token = response.body["data"]["token"];
    if (token == null) {
      throw UnimplementedError();
    }
    await TokenHandler.persistToken(token: token);
  }

  static Future<UserModel> getUser() async {
    Response response = await AuthenticationService.create().getUser();
    UserModel userModel = UserModel.fromJson(response.body["data"]);
    return userModel;
  }
}
