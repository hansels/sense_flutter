import 'package:flutter/material.dart';

class LoginTnc extends StatefulWidget {
  const LoginTnc({Key key}) : super(key: key);

  @override
  _LoginTncState createState() => _LoginTncState();
}

class _LoginTncState extends State<LoginTnc> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("By logging in, you agree to our"),
        Text("Privacy Policy and Terms of Service"),
      ],
    );
  }
}
