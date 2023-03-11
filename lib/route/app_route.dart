import 'package:flutter/material.dart';
import 'package:jaho_challenge/screens/discover/index.dart';
import 'package:jaho_challenge/screens/login/index.dart';
import 'package:jaho_challenge/screens/register/index.dart';
import 'package:jaho_challenge/screens/splash/index.dart';


class AppPageRoute {
  static MaterialPageRoute routes(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case LoginScreen.PAGE_NAME:
            return const LoginScreen();

          case RegisterScreen.PAGE_NAME:
            return const RegisterScreen();

          case DiscoverScreen.PAGE_NAME:
            return const DiscoverScreen();

          case SplashScreen.PAGE_NAME:
          default:
            return const SplashScreen();
        }
      },
    );
  }
}
