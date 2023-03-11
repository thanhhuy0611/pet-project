import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaho_challenge/screens/discover/index.dart';
import 'package:jaho_challenge/widget/button/elevated_button.dart';
import 'package:jaho_challenge/widget/floating_button.dart';
import 'package:jaho_challenge/widget/input_field_decoration.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RegisterScreen extends StatelessWidget {
  static const PAGE_NAME = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const SettingThemeFloatingButton(),
      floatingActionButtonLocation: SettingThemeFloatingButton.location,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/back_icon.svg',
            fit: BoxFit.contain,
            width: 12,
            height: 12,
          ), 
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Center(
            child: Container(
              width: getValueForScreenType<double>(
                context: context,
                mobile: double.infinity,
                tablet: MediaQuery.of(context).size.width/2,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.register,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  
                  // Username
                  const SizedBox(height: 32),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputFieldDecoration.inputDecoration(
                      context: context,
                      hint: AppLocalizations.of(context)!.user_name,
                    ),
                    onChanged: (value) => {},
                  ),
              
                  // Password
                  const SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    obscureText: true,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputFieldDecoration.inputDecoration(
                      context: context,
                      hint: AppLocalizations.of(context)!.password,
                    ),
                    onChanged: (value) => {},
                  ),
              
                  // Confirm Password
                  const SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    obscureText: true,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputFieldDecoration.inputDecoration(
                      context: context,
                      hint: AppLocalizations.of(context)!.confirm_password,
                    ),
                    onChanged: (value) => {},
                  ),
              
                  // Sign up button
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    label: (AppLocalizations.of(context)!.sign_up).toUpperCase(),
                    onTap: () {
                      Navigator.of(context).pushNamed(DiscoverScreen.PAGE_NAME);
                    },
                  ),
              
                  // Condition
                  const SizedBox(height: 32),
                  Text(AppLocalizations.of(context)!.condition_on_register,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}