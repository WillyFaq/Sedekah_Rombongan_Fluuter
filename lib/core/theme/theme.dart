import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: _border(Pallete.greyColorMore),
      focusedBorder: _border(Pallete.mainColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Pallete.backgroundColor,
    ),
  );
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Pallete.whiteColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: _border(Pallete.borderColor2),
      focusedBorder: _border(Pallete.mainColor),
    ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: Pallete.backgroundColor,
    // ),
  );
}
