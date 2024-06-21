import '6-password.dart';

class User extends Password {

  String name;
  int age;
  double height;
  int id;
  String? user_password;

  User({this.name = '', this.age = 0, this.height = 0.0, this.id = 0, this.user_password});

  String showName() {
    return 'Hello $name';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
    };
  }

  static User fromJson(Map<dynamic, dynamic> userJson) {
    return User(
      id: userJson['id'],
      name: userJson['name'],
      age: userJson['age'],
      height: userJson['height'],
      user_password: userJson['user_password'],
    );
  }

  bool isPasswordValid() {
    return Password(password: user_password ?? '').isValid();
  }

  String toString() {
    return 'User(id : $id ,name: $name, age: $age, height: $height, Password: ${isPasswordValid()})';
  }
}