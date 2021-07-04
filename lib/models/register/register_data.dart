import 'dart:convert';

import 'package:email_validator/email_validator.dart';

class RegisterData {
  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  String nameValidator() {
    return name.isEmpty ? "Name can't be empty" : null;
  }

  String emailValidator() {
    return !EmailValidator.validate(email)
        ? "Email format is incorrect!"
        : null;
  }

  String passwordValidator() {
    if (password.length < 6) return "Password min. 6 character long";
    if (!isMatch()) return "Password confirmation doesn't match";
    return password.isEmpty ? "Password can't be empty" : null;
  }

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }

  String toJSON() {
    return jsonEncode(toVariables());
  }

  bool isMatch() {
    return password == confirmPassword;
  }
}
