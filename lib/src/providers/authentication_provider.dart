import 'package:forest_logger/forest_logger.dart';
import 'package:viragvarazs/src/exceptions/exception_handler.dart';
import 'package:viragvarazs/src/models/user/user_model.dart';
import 'package:viragvarazs/src/repositories/authentication_repository.dart';
import 'package:viragvarazs/src/resources/handlers/token_handler.dart';
import 'package:viragvarazs/src/resources/interfaces/loading_interface.dart';

class AuthenticationProvider extends LoadingInterface {
  UserModel? userModel;
  bool isAuthenticated = false;

  AuthenticationProvider() {
    if (TokenHandler.cachedToken != null) {
      isAuthenticated = true;
    }
  }

  Future<Exception?> login(String email, String password) async {
    try {
      isLoading = true;
      await AuthenticationRepository.login(email, password);
      await getUser();
      isAuthenticated = true;
      isLoading = false;
      return null;
    } catch (e) {
      Forest.error(e.toString());
      isLoading = false;
      return ExceptionHandler.returnException(e);
    }
  }

  Future<Exception?> getUser() async {
    try {
      isLoading = true;
      userModel = await AuthenticationRepository.getUser();
      isLoading = false;
      return null;
    } catch (e) {
      isLoading = false;
      Forest.error(e.toString());
      return ExceptionHandler.returnException(e);
    }
  }
}
