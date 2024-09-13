import 'package:flutter/material.dart';

import 'application_style.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: ApplicationStyle.primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.white,
      ),
      useMaterial3: false,
      scaffoldBackgroundColor: ApplicationStyle.white,
      fontFamily: 'Plus-Jakarta-Sans',
      appBarTheme: const AppBarTheme(
        //DONE
        backgroundColor: ApplicationStyle.primaryColor,
        shadowColor: Colors.transparent,
        foregroundColor: ApplicationStyle.primaryColor,
        titleTextStyle: TextStyle(
          color: ApplicationStyle.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        //DONE
        style: OutlinedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ApplicationStyle.magentaColor,
          ),
          foregroundColor: ApplicationStyle.magentaColor,
          disabledBackgroundColor: ApplicationStyle.grayColor.withOpacity(0.5),
          disabledForegroundColor: ApplicationStyle.graySecondaryColor,
          minimumSize: const Size(99999999, ApplicationStyle.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: ApplicationStyle.borderRadiusCircular,
          ),
          side: const BorderSide(
            width: 1,
            color: ApplicationStyle.primaryColor,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.resolveWith(
            (states) => ApplicationStyle.magentaColor.withOpacity(0.1),
          ),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ApplicationStyle.primaryColor,
          borderRadius: BorderRadius.circular(ApplicationStyle.borderRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        //DONE
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          foregroundColor: ApplicationStyle.white,
          backgroundColor: ApplicationStyle.primaryColor,
          shadowColor: Colors.transparent,
          minimumSize: const Size(99999999, ApplicationStyle.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: ApplicationStyle.borderRadiusCircular,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: ApplicationStyle.primaryColor,
        size: ApplicationStyle.iconSize,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: ApplicationStyle.primaryColor.withOpacity(0.2),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: ApplicationStyle.primaryColor,
          ),
          borderRadius: ApplicationStyle.borderRadiusCircular,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: ApplicationStyle.primaryColor,
          ),
          borderRadius: ApplicationStyle.borderRadiusCircular,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: ApplicationStyle.primaryColor.withOpacity(0.6),
          ),
          borderRadius: ApplicationStyle.borderRadiusCircular,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.5,
            color: ApplicationStyle.primaryColor,
          ),
          borderRadius: ApplicationStyle.borderRadiusCircular,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: ApplicationStyle.inputErrorColor,
          ),
          borderRadius: ApplicationStyle.borderRadiusCircular,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.0,
            color: ApplicationStyle.inputErrorColor,
          ),
          borderRadius: ApplicationStyle.borderRadiusCircular,
        ),
        hintStyle: const TextStyle(
          color: ApplicationStyle.inputHintTextColor,
        ),
        errorStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.red,
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: const TextStyle(
          fontFamily: 'Monument-Extended',
          fontSize: 17,
          height: 1.29411764,
          letterSpacing: 1.05,
          fontWeight: FontWeight.w800,
          color: ApplicationStyle.primarySecondColor,
        ),
        bodyLarge: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 19,
          height: 1.15789473,
          letterSpacing: 1.02,
          fontWeight: FontWeight.w400,
          color: ApplicationStyle.purpleColor,
        ),
        bodySmall: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 12,
          height: 1.83,
          letterSpacing: 1.03,
          fontWeight: FontWeight.w400,
          color: ApplicationStyle.purpleColor,
        ),
        bodyMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          height: 1.57142857,
          letterSpacing: 1.03,
          fontWeight: FontWeight.w400,
          color: ApplicationStyle.darkColor,
        ),
        headlineLarge: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18,
          height: 1.2,
          letterSpacing: 1.05,
          fontWeight: FontWeight.w300,
          color: ApplicationStyle.white,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 12,
          height: 1.29411764,
          letterSpacing: 1.05,
          fontWeight: FontWeight.w800,
          color: ApplicationStyle.darkColor.withOpacity(0.6),
        ),
        titleLarge: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: ApplicationStyle.darkColor,
        ),
        titleSmall: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ApplicationStyle.darkColor,
        ),
        titleMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ApplicationStyle.darkColor,
        ),
        labelMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: ApplicationStyle.labelColor,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: ApplicationStyle.primaryColor,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1.5,
        color: ApplicationStyle.primaryColor.withOpacity(0.2),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ApplicationStyle.processIndicatorColor,
      ),
    );
  }
}
