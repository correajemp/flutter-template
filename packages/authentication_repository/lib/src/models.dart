class LoginResponse {
  LoginData? data;
  String? token;

  LoginResponse({
    this.data,
    this.token,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class LoginData {
  String? profileType;

  LoginData({this.profileType});

  LoginData.fromJson(Map<String, dynamic> json) {
    profileType = json['profile_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['profile_type'] = this.profileType;
    return data;
  }
}

class RegisterResponse {
  RegisterData? data;
  String? token;

  RegisterResponse({
    this.data,
    this.token,
  });

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? RegisterData.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class RegisterData {
  String? profileType;

  RegisterData({this.profileType});

  RegisterData.fromJson(Map<String, dynamic> json) {
    profileType = json['profile_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['profile_type'] = this.profileType;
    return data;
  }
}
