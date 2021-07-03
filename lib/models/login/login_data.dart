import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sense_flutter/extensions/string_extensions.dart';

class LoginData extends ChangeNotifier {
  String email = "";
  String password = "";
  bool autoValidate = false;

  String emailValidator() {
    return !EmailValidator.validate(email)
        ? "Email format is incorrect!"
        : null;
  }

  String passwordValidator() {
    return password.isEmpty ? "Password cannot be empty" : null;
  }

  Map<String, String> toVariables() {
    return {
      "email": email.trimLower(),
      "password": password,
    };
  }

  String toJSON() {
    return jsonEncode(toVariables());
  }
}
