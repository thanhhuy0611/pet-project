part of '../index.dart';

class SplashActionButtonsWidget extends StatelessWidget {
  const SplashActionButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Login button
        Flexible(
          flex: 1,
          child: CustomOutlinedButton(
            label: (AppLocalizations.of(context)!.log_in).toUpperCase(),
            onTap: () {
              Navigator.of(context).pushNamed(LoginScreen.PAGE_NAME);
            },
          ),
        ),
        const SizedBox(width: 12),
        // Register button
        Flexible(
          flex: 1,
          child: CustomElevatedButton(
            label: (AppLocalizations.of(context)!.register).toUpperCase(),
            onTap: () {
              Navigator.of(context).pushNamed(RegisterScreen.PAGE_NAME);
            },
          ),
        ),
      ],
    );
  }
}
