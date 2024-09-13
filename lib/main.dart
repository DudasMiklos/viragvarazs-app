import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:forest_logger/forest_logger.dart';
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
  runApp(const Application());
}
