import 'package:flutter/material.dart';
import 'package:islami/themes/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.blackColor,
    iconTheme: IconThemeData(color: AppColor.goldColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.blackColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColor.goldColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.blackColor,
      primary: AppColor.blackColor,
      secondary: AppColor.goldColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.goldColor,
      unselectedItemColor: AppColor.blackColor,
      selectedItemColor: AppColor.whiteColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
