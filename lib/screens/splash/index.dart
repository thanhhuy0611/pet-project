import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jaho_challenge/screens/login/index.dart';
import 'package:jaho_challenge/screens/register/index.dart';
import 'package:jaho_challenge/widget/author_info.dart';
import 'package:jaho_challenge/widget/button/elevated_button.dart';
import 'package:jaho_challenge/widget/button/outlined_button.dart';
import 'package:jaho_challenge/widget/floating_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'widgets/action_buttons.dart';

class SplashScreen extends StatelessWidget {
  static const PAGE_NAME = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          'assets/images/splash_background.jpeg',
          fit: BoxFit.cover,
          height: size.height,
          width: size.width,
        ),
        Image.asset(
          'assets/images/logo.png',
          height: size.height/10,
          width: size.width/2,
          fit: BoxFit.contain,
        ),
        _buildForceground(context),
      ],
    );
  }

  Widget _buildForceground(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: const SettingThemeFloatingButton(),
      floatingActionButtonLocation: SettingThemeFloatingButton.location,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: getValueForScreenType<double>(
              context: context,
              mobile: double.infinity,
              tablet: MediaQuery.of(context).size.width/2,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: getValueForScreenType<CrossAxisAlignment>(
                context: context,
                mobile: CrossAxisAlignment.start,
                tablet: CrossAxisAlignment.center,
              ),
              children: [
                getValueForScreenType<bool>(
                  context: context,
                  mobile: false,
                  tablet: true,
                ) ? const Spacer(flex: 2) : const SizedBox(),

                // const AuthorInfoWidget(),
                const SizedBox(height: 16.0),
                const SplashActionButtonsWidget(),

                getValueForScreenType<bool>(
                  context: context,
                  mobile: false,
                  tablet: true,
                ) ? const Spacer(flex: 1) : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}