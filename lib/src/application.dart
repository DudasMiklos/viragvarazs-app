import 'package:viragvarazs/src/providers/authentication_provider.dart';
import 'package:viragvarazs/src/providers/category_provider.dart';
import 'package:viragvarazs/src/providers/product_provider.dart';
import 'package:viragvarazs/src/providers/theme_provider.dart';
import 'package:viragvarazs/src/providers/user_provider.dart';
import 'package:viragvarazs/src/resources/handlers/token_handler.dart';
import 'package:viragvarazs/src/resources/routes/app_routes.dart';
import 'package:viragvarazs/src/resources/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatefulWidget {
  const Application({
    super.key,
  });

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  ThemeProvider themeProvider = ThemeProvider();
  UserProvider userProvider = UserProvider();
  AuthenticationProvider authenticationProvider = AuthenticationProvider();
  ProductProvider productProvider = ProductProvider();
  CategoryProvider categoryProvider = CategoryProvider();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter();
    super.initState();
    getCurrentAppTheme();
    getCachedToken();
  }

  void getCurrentAppTheme() async {
    themeProvider.theme = await themeProvider.themePreference.getTheme();
  }

  void getCachedToken() async {
    await TokenHandler.getToken();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => themeProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => userProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => authenticationProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => productProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => categoryProvider,
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => themeProvider,
        child: Consumer<ThemeProvider>(
          builder: (context, provider, child) {
            return MaterialApp.router(
              theme: Styles.themeData(themeProvider.theme, context),
              title: 'viragvarazs',
              debugShowCheckedModeBanner: false,
              routerConfig: _appRouter.config(),
            );
          },
        ),
      ),
    );
  }
}
