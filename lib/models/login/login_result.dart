import 'package:sense_flutter/models/user/user.dart';

class LoginResult {
  String token;
  User user;

  LoginResult({this.token, this.user});

  LoginResult.fromMap(Map<String, dynamic> data)
      : this(
          token: data["token"],
          user: User.fromMap(data["user"]),
        );
}
