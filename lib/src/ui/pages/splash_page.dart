import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:viragvarazs/src/providers/authentication_provider.dart';
import 'package:viragvarazs/src/providers/blog_provider.dart';
import 'package:viragvarazs/src/providers/category_provider.dart';
import 'package:viragvarazs/src/providers/product_provider.dart';
import 'package:viragvarazs/src/resources/assets/asset_flow.dart';
import 'package:viragvarazs/src/resources/handlers/token_handler.dart';
import 'package:viragvarazs/src/resources/routes/app_routes.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double animationRotation = 0;
  late Image image;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TokenHandler.getToken().then((value) {
        if (value != null) {
          Provider.of<AuthenticationProvider>(context, listen: false).getUser();
          Provider.of<ProductProvider>(context, listen: false).getAllProducts();
          Provider.of<ProductProvider>(context, listen: false).loadBaseData();
          Provider.of<CategoryProvider>(context, listen: false)
              .getAllTotalCategories();
          Provider.of<BlogProvider>(context, listen: false).getAllPosts();
        }
      });
    });

    super.initState();
    image = Image.asset(AssetFlow.viragvarazsTotalTranslarentPng,
        width:
            PlatformDispatcher.instance.views.first.physicalSize.width * 0.8);
    FlutterNativeSplash.remove();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    imageSlideUp(200);
    runGoToHome();
  }

  Future runGoToHome() async {
    await Future.wait([
      Future.delayed(const Duration(milliseconds: 2000)), //min delay value
    ]).then(
      (value) => goToHome(context),
    );
  }

  Future<void> imageSlideUp(int milliseconds) async {
    await Future<void>.delayed(
      Duration(milliseconds: milliseconds),
    ).then(
      (_) => setState(
        () {
          animationRotation = 1;
        },
      ),
    );
  }

  Future<void> goToHome(BuildContext context) async {
    if (Provider.of<AuthenticationProvider>(context, listen: false).userModel !=
        null) {
      AutoRouter.of(context).replace(const CategoriesRoute());
    } else {
      AutoRouter.of(context).replace(const LoginRoute());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //FlutterNativeSplash.remove();
    return Scaffold(
      backgroundColor: ApplicationStyle.primaryColor,
      body: Center(
        child: AnimatedRotation(
          turns: animationRotation,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeInOutBack,
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.6, child: image),
        ),
      ),
    );
  }
}
