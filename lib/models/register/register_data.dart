import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:sense_flutter/interfaces/i_has_diseases.dart';
import 'package:sense_flutter/models/disease/disease.dart';

class RegisterData implements IHasDiseases {
  String name = "";
  String email = "";
  DateTime birthday;
  String password = "";
  String confirmPassword = "";
  List<Disease> diseases = [];

  String nameValidator() {
    return name.isEmpty ? "Name can't be empty" : null;
  }

  String emailValidator() {
    return !EmailValidator.validate(email)
        ? "Email format is incorrect!"
        : null;
  }

  String birthdayValidator() {
    return birthday == null ? "Birthday can't be empty" : null;
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
      "birthday": birthday?.toIso8601String(),
      "password": password,
      "diseases": diseases.map((e) => e?.toVariables()).toList()
    };
  }

  String toJSON() {
    return jsonEncode(toVariables());
  }

  bool isMatch() {
    return password == confirmPassword;
  }
}
