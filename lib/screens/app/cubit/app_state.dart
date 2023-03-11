part of 'app_cubit.dart';

enum AuthStatus { UNKNOWN, AUTHENTICATED, UNAUTHENTICATED }

class AppState extends Equatable {
  final AuthStatus authStatus;
  final UserSetting? userSetting;

  const AppState({
    this.authStatus = AuthStatus.UNKNOWN,
    this.userSetting,
  });

  AppState copyWith({
    UserSetting? userSetting,
    AuthStatus? authStatus,
  }) {
    return AppState(
      authStatus: authStatus ?? this.authStatus,
      userSetting: userSetting ?? this.userSetting,
    );
  }

  @override
  List<Object?> get props => [
        authStatus,
        userSetting,
      ];
}
