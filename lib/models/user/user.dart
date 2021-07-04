import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sense_flutter/configs/configs.dart';

class User {
  static User _empty;
  String name;
  String email;
  String subName;
  Color avatarColor;

  static final instance = FirebaseFirestore.instance;

  User({
    this.name,
    this.email,
  })  : subName = _getInitial(name),
        avatarColor = _getAvatarColor(name),
        assert(name != null || name.isNotEmpty);

  User.copy(User user)
      : this(
          name: user.name,
          email: user.email,
        );

  static User empty() {
    return _empty ??= User(name: "EMPTY");
  }

  bool get isEmpty => this == User.empty();

  static Color _getAvatarColor(String name) {
    var length = name.length % Configs.colorAvatars.length;
    return Configs.colorAvatars[length];
  }

  static String _getInitial(String name) {
    var chunks = name.toUpperCase().split(" ");
    if (chunks.length < 2) {
      return chunks[0].substring(0, 1);
    } else {
      return chunks[0].substring(0, 1) + chunks[1].substring(0, 1);
    }
  }

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
