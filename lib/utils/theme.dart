import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/utils/assets_manager.dart';
import 'package:flutter_crud_back4app/utils/colors.dart';
import 'package:flutter_crud_back4app/utils/no_transition_screen.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
      primarySwatch: AppColors.colorPrimarySwatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: AssetsManager.fontFamily,
      scaffoldBackgroundColor: AppColors.colorBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.colorBackground,
        titleTextStyle: TextStyle(
            fontFamily: AssetsManager.fontFamily,
            fontSize: 20.0,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold),
      ),
      textTheme: _buildTextTheme(),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: NoTransitionsScreen(),
          TargetPlatform.iOS: NoTransitionsScreen(),
        },
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ));

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontSize: 38.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
