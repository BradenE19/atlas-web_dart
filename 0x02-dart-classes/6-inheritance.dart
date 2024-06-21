import '6-password.dart';

class User {
  int id;
  String name;
  int age;
  double height;
  late Password _userPassword;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required String user_password,
  }) {
    _userPassword = Password(password: user_password);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
      'user_password': _userPassword.password,
    };
  }

  static User fromJson(Map<dynamic, dynamic> userJson) {
    return User(
      id: userJson['id'] ?? 0,
      name: userJson['name'] ?? '',
      age: userJson['age'] ?? 0,
      height: userJson['height'] ?? 0.0,
      user_password: userJson['user_password'] ?? '',
    );
  }

  String toString() {
    return "User(id : $id ,name: $name, age: $age, height: $height, ${_userPassword.toString()})";
  }

  String get user_password => _userPassword.password;

  set user_password(String newPassword) {
    _userPassword.password = newPassword;
  }
}