import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sense_flutter/basics/helpers/base_http_helper.dart';
import 'package:sense_flutter/models/login/login_data.dart';
import 'package:sense_flutter/models/login/login_result.dart';
import 'package:sense_flutter/models/register/register_data.dart';
import 'package:sense_flutter/models/user/user.dart';

class UserHelper extends BaseHTTPHelper {
  final instance = FirebaseFirestore.instance;

  Future<LoginResult> login(LoginData data) async {
    var result = await post<Map<String, dynamic>>(
      endpoint: "login",
      json: data.toJSON(),
    );
    return LoginResult.fromMap(result);
  }

  Future<String> register(RegisterData data) async {
    return await post<String>(endpoint: "register", json: data.toJSON());
  }

  Future<bool> checkUser(String email) async {
    var data = {"email": email};
    return await post<bool>(endpoint: "check-user", json: jsonEncode(data));
  }
}
