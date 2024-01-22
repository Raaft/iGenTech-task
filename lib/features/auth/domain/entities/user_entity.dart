class UserEntity {
  final String email;
  final String password;

  UserEntity({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map['email'],
      password: map['password'],
    );
  }
}
