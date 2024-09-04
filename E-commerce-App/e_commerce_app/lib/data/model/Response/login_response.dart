class LoginResponse {
   String? statusMsg;
   String? message;
   User? user;
   String? token;

  LoginResponse({
     this.statusMsg,
     this.message,
    this.user,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusMsg: json['statusMsg'] as String,
      message: json['message'] as String,
      user: json.containsKey('user') ? User.fromJson(json['user']) : null,
      token: json.containsKey('token') ? json['token'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'statusMsg': statusMsg,
      'message': message,
    };
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (token != null) {
      data['token'] = token;
    }
    return data;
  }
}

class User {
  final String name;
  final String email;
  final String role;

  User({
    required this.name,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role,
    };
  }
}
