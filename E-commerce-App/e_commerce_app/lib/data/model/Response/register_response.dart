class RegisterResponse {
  String? message;
  User? user;
  String? token;
  String? statusMsg;
  RegisterResponse({this.message, this.user, this.token,this.statusMsg});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
     if (json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class User {
  String? name;
  String? email;
  String? role;

  User({this.name, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["role"] = role;
    return _data;
  }
}
