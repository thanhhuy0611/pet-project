import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jaho_challenge/common/global_config.dart';
import 'package:jaho_challenge/repository/user_repository.dart';
import 'package:jaho_challenge/repository/user_setting_repository.dart';
import 'package:jaho_challenge/route/app_route.dart';
import 'package:jaho_challenge/screens/app/cubit/app_cubit.dart';
import 'package:jaho_challenge/theme/dark_theme.dart';
import 'package:jaho_challenge/theme/ligh_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApp extends StatelessWidget {
  final SharedPreferences preferences;
  final AdaptiveThemeMode? savedThemeMode;
  MainApp({Key? key, required this.preferences, this.savedThemeMode}) : super(key: key);

  final appName = GlobalConfigs.appName;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserSettingRepository(
            ref: preferences,
          ),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: BlocProvider<AppCubit>(
        create: (context) => AppCubit(
          userSettingRepository: RepositoryProvider.of<UserSettingRepository>(context),
        ),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return GestureDetector(
              onDoubleTap: () {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              onTap: () {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              child: AdaptiveTheme(
                light: LightTheme().theme,
                dark: DarkTheme().theme,
                initial: savedThemeMode ?? AdaptiveThemeMode.light,
                builder: (theme, darkTheme) => MaterialApp(
                  builder: EasyLoading.init(),
                  theme: theme,
                  darkTheme: darkTheme,
                  title: appName,
                  locale: state.userSetting?.languageCode == null 
                      ? null 
                      : Locale(state.userSetting!.languageCode),
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: GlobalConfigs.supportedLocales,
                  // Returns a locale which will be used by the app
                  localeResolutionCallback: (
                    Locale? locale,
                    Iterable<Locale> _,
                  ) {
                    // Check if the current device locale is supported
                    for (var supportedLocale in GlobalConfigs.supportedLocales) {
                      if (locale?.languageCode == supportedLocale.languageCode) {
                        BlocProvider.of<AppCubit>(context).init(supportedLocale.languageCode);
                        return supportedLocale;
                      }
                    }
                    // If the locale of the device is not supported, use the first one
                    // from the list (English, in this case).
                    BlocProvider.of<AppCubit>(context).init(GlobalConfigs.supportedLocales.first.languageCode);
                    return GlobalConfigs.supportedLocales.first;
                  },
                  onGenerateRoute: AppPageRoute.routes,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
