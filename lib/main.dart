import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:forest_logger/forest_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viragvarazs/src/application.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Forest.init(
    isDebugModeEnabled: true,
    isProfileModeEnabled: true,
    isReleaseModeEnabled: true,
    useTimestamps: true,
  );

  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      //Utilities.log("Will log here ${errorDetails.exception.toString()}");
    };
    runApp(const Application());
  }, (error, stackTrace) {
    // Utilities.log("Others catching ${error.toString()}");
  });
}
