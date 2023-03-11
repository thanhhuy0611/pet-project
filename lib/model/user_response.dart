class UserResponse {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UserData>? data;
  final Support? support;

  UserResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  UserResponse copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserData>? data,
    Support? support,
  }) {
    return UserResponse(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }

  UserResponse.fromJson(Map<String, dynamic> json)
    : page = json['page'] as int?,
      perPage = json['per_page'] as int?,
      total = json['total'] as int?,
      totalPages = json['total_pages'] as int?,
      data = (json['data'] as List?)?.map((dynamic e) => UserData.fromJson(e as Map<String,dynamic>)).toList(),
      support = (json['support'] as Map<String,dynamic>?) != null ? Support.fromJson(json['support'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'page' : page,
    'per_page' : perPage,
    'total' : total,
    'total_pages' : totalPages,
    'data' : data?.map((e) => e.toJson()).toList(),
    'support' : support?.toJson()
  };
}

class UserData {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  UserData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  UserData copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return UserData(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }

  UserData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      email = json['email'] as String?,
      firstName = json['first_name'] as String?,
      lastName = json['last_name'] as String?,
      avatar = json['avatar'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'email' : email,
    'first_name' : firstName,
    'last_name' : lastName,
    'avatar' : avatar
  };
}

class Support {
  final String? url;
  final String? text;

  Support({
    this.url,
    this.text,
  });

  Support copyWith({
    String? url,
    String? text,
  }) {
    return Support(
      url: url ?? this.url,
      text: text ?? this.text,
    );
  }

  Support.fromJson(Map<String, dynamic> json)
    : url = json['url'] as String?,
      text = json['text'] as String?;

  Map<String, dynamic> toJson() => {
    'url' : url,
    'text' : text
  };
}