class Password {
  late String _password;

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  bool isValid() {
    // Check length
    if (_password.length < 8 || _password.length > 16) {
      return false;
    }

    // Check for uppercase letters
    if (!_password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    // Check for lowercase letters
    if (!_password.contains(RegExp(r'[a-z]'))) {
      return false;
    }

    // Check for numbers
    if (!_password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    // All checks passed
    return true;
  }

  @override
  String toString() {
    return "Your Password is: $_password";
  }
}