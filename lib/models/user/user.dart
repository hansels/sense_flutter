import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  static User _empty;
  String name;
  String email;

  static final instance = FirebaseFirestore.instance;

  User({
    this.name,
    this.email,
  }) : assert(name != null || name.isNotEmpty);

  User.copy(User user)
      : this(
          name: user.name,
          email: user.email,
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
          );
  }

  static List<User> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "email": email,
    };
  }

  String toJSON() {
    return jsonEncode(toVariables());
  }
}
