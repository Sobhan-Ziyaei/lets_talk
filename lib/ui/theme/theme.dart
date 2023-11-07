import 'package:flutter/material.dart';
import 'package:lets_talk/gen/fonts.gen.dart';
import 'package:lets_talk/ui/theme/colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontFamily: FontFamily.arT,
        color: darkBlueColor,
        fontSize: 14,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.arM, color: lightBlueColor, fontSize: 30,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.arM,
        fontSize: 50,
        color: lightBlueColor,
      ),
      titleSmall: TextStyle(
        fontFamily: FontFamily.arM,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: darkBlueColor,
      ),
      titleLarge: TextStyle(
        fontFamily: FontFamily.arEB,
        fontSize: 17,
        color: darkBlueColor,
      ),
      labelMedium: TextStyle(
        fontFamily: FontFamily.arB,
        fontSize: 20,
        color: whiteColor,
      ),
    ),
  );
}
