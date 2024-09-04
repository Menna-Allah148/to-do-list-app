import 'dart:convert';

class User {
  final String name;
  final String email;
  final String role;
  User({
    required this.name,
    required this.email,
    required this.role,
  });

  User copyWith({
    String? name,
    String? email,
    String? role,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email, role: $role)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.role == role;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ role.hashCode;
}