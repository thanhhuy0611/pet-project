import 'package:flutter/material.dart';

abstract class BaseTheme {
  BaseTheme() {
    headLine1 = TextStyle(fontSize: 36.0, color: primaryColor, fontWeight: FontWeight.normal, fontFamily: fontComfortaa);
    button = TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, fontFamily: fontRoboto);
    subtitle1 = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold);
    bodyText1 = const TextStyle(fontSize: 13.0);
  }

  final String fontRoboto = 'Roboto';
  final String fontComfortaa = 'Comfortaa';

  TextStyle? headLine1;
  TextStyle? button;
  TextStyle? subtitle1;
  TextStyle? bodyText1;

  Color get primaryColor;
  Color get backgroundColor;

  ThemeData get theme;
}
