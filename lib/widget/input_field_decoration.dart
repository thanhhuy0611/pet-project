import 'package:flutter/material.dart';

class InputFieldDecoration {
  static InputDecoration inputDecoration({
    required BuildContext context,
    String hint = '',
    String? errText, 
    double vertical = 21.0,
    Color fillColor = Colors.transparent,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool dense = false,
    double raduis = 0.0,
    bool bold = false,
  }) {
    final _border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(raduis),
      ),
    );
    
    return InputDecoration(
      isDense: dense,
      hintText: hint,
      hintStyle: TextStyle(
        color: Theme.of(context).primaryColor.withOpacity(0.5),
        fontWeight: !!bold ? FontWeight.bold : FontWeight.normal,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: 15.0,
      ),
      focusedBorder: _border,
      border: _border,
      enabledBorder: _border,
      filled: true,
      fillColor: fillColor,
      errorText: errText,
      errorStyle: errorStyle(),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
    );
  }

  static TextStyle errorStyle() {
    return const TextStyle(
      color: Colors.red,
      fontSize: 9.0,
      height: 0.3,
      textBaseline: TextBaseline.ideographic,
    );
  }
}
