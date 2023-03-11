import 'package:flutter/material.dart';

class ElevatedButtonDecoration {
  ButtonStyle buttonStyle(
    context, {
    Color? color,
    Color? borderColor,
    double? elevation = 0,
    double height = 52.0,
  }) {
    return ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, height),
      primary: color ?? Theme.of(context).primaryColor,
      onSurface: Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      elevation: elevation,
      side: BorderSide(
        color: borderColor ?? Colors.transparent,
        width: 2,
      ),
    );
  }

  ButtonStyle buttonStadiumStyle(
    context, {
    Color? color,
    double? elevation = 0,
    double height = 40,
  }) {
    return ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, height),
      primary: color,
      onSurface: color,
      shadowColor: color,
      shape: const StadiumBorder(),
      elevation: elevation,
    );
  }
}

class OutlinedButtonStyle {
  ButtonStyle buttonStyle(
    context, {
    double height = 52.0,
    double width = double.infinity,
    Color color = const Color(0xFFBFBFBF),
  }) {
    return OutlinedButton.styleFrom(
      side: BorderSide(width: 2.0, color: color),
      minimumSize: Size(width, height),
      primary: Colors.grey[400],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
    );
  }
}
