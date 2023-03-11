import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:jaho_challenge/screens/app/app.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get shared preference instance
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  
  // Get theme mode
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  // Setting breakpoint
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  );

  runApp(MainApp(
    preferences: preferences,
    savedThemeMode: savedThemeMode,
  ));
}
