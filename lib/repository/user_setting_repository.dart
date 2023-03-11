import 'package:jaho_challenge/model/user_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingRepository {
  final SharedPreferences ref;

  UserSettingRepository({
    required this.ref,
  });

  String get userSettingRefKey => "USER_SETTING";

  Future<UserSetting?> getUserSetting() async {
    try {
      String? json = ref.getString(userSettingRefKey);
      return json == null ? null : UserSetting.fromJson(json);
    } on Exception {
      rethrow;
    }
  }

  Future<void> upsertUserSetting(UserSetting userSetting) async {
    try {
      await ref.setString(userSettingRefKey, userSetting.toJson());
    } on Exception {
      rethrow;
    }
  }

  Future<void> deleteUserSetting() async {
    try {
      await ref.remove(userSettingRefKey);
    } on Exception {
      rethrow;
    }
  }
}
