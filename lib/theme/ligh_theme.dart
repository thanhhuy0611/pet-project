import 'package:flutter/material.dart';
import 'package:jaho_challenge/theme/base_theme.dart';

class LightTheme extends BaseTheme {

  LightTheme() : super();
  
  @override
  Color get primaryColor => const Color(0xFF000000);

  @override
  Color get backgroundColor => const Color(0xFFFFFFFF);

  @override
  ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      fontFamily: fontRoboto,
      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline1: headLine1?.copyWith(color: primaryColor),
        subtitle1: subtitle1?.copyWith(color: primaryColor),
        button: button?.copyWith(color: primaryColor),
        bodyText1: bodyText1?.copyWith(color: primaryColor),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
