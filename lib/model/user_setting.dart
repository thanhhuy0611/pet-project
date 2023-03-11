import 'dart:convert';

class UserSetting {
    const UserSetting({
      required this.languageCode,
      this.isDarkMode = false,
    });

    final String languageCode;
    final bool isDarkMode;

    UserSetting copyWith({
        String? languageCode,
        bool? isDarkMode,
    }) => 
        UserSetting(
            languageCode: languageCode ?? this.languageCode,
            isDarkMode: isDarkMode ?? this.isDarkMode,
        );

    factory UserSetting.fromJson(String str) => UserSetting.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserSetting.fromMap(Map<String, dynamic> json) => UserSetting(
        languageCode: json["language_code"],
        isDarkMode: json["is_dark_mode"],
    );

    Map<String, dynamic> toMap() => {
        "language_code": languageCode,
        "is_dark_mode": isDarkMode,
    };
}
