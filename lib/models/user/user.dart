import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sense_flutter/functions/date_parser.dart';
import 'package:sense_flutter/interfaces/i_has_diseases.dart';
import 'package:sense_flutter/models/disease/disease.dart';

class User implements IHasDiseases {
  static User _empty;
  String name;
  String email;
  DateTime birthday;
  String birthdayString;
  List<Disease> diseases;

  static final instance = FirebaseFirestore.instance;

  User({
    this.name,
    this.email,
    this.birthday,
    this.diseases,
  })  : birthdayString = DateParser.parse(birthday) ?? "",
        assert(name != null || name.isNotEmpty);

  User.copy(User user)
      : this(
          name: user.name,
          email: user.email,
          birthday: user.birthday,
          diseases: user.diseases.map((e) => e).toList(),
        );

  static User empty() {
    return _empty ??= User(name: "EMPTY");
  }

  bool get isEmpty => this == User.empty();

  static User fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : User(
            name: data["name"] ?? "",
            email: (data["email"] ?? ""),
            birthday: data["birthday"] == null
                ? null
                : DateTime.tryParse(data["birthday"] ?? ""),
            diseases: Disease.fromMapList(data["diseases"]));
  }

  static List<User> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "email": email,
      "birthday": birthday?.toIso8601String(),
      "diseases": diseases.map((e) => e?.toVariables()).toList()
    };
  }

  String toJSON() {
    return jsonEncode(toVariables());
  }
}
