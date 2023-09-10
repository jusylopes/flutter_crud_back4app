import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
        primarySwatch: AppColors.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.roboto().fontFamily,
        scaffoldBackgroundColor: AppColors.colorBackground,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          toolbarHeight: 180,
          backgroundColor: AppColors.colorBackground,
          titleTextStyle: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 33.0,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
        ),
        textTheme: _buildTextTheme(),
      );

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
