import 'package:auto_route/auto_route.dart';
import 'package:viragvarazs/src/resources/handlers/token_handler.dart';
import 'package:viragvarazs/src/resources/routes/app_routes.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (TokenHandler.cachedToken != null) {
      resolver.next(true);
    } else {
      resolver.redirect(
        const LoginRoute(),
      );
    }
  }
}
