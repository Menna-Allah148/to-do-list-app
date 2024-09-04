import 'dart:convert';

class SignupRequest {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  SignupRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  SignupRequest copyWith({
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  }) {
    return SignupRequest(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'rePassword': rePassword,
      'phone': phone,
    };
  }

  factory SignupRequest.fromMap(Map<String, dynamic> map) {
    return SignupRequest(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      rePassword: map['rePassword'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupRequest.fromJson(String source) => SignupRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignupRequest(name: $name, email: $email, password: $password, rePassword: $rePassword, phone: $phone)';
  }

  @override
  bool operator ==(covariant SignupRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.rePassword == rePassword &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      rePassword.hashCode ^
      phone.hashCode;
  }
}