import 'package:flutter/material.dart';

class RegisterTnc extends StatefulWidget {
  const RegisterTnc({Key key}) : super(key: key);

  @override
  _RegisterTncState createState() => _RegisterTncState();
}

class _RegisterTncState extends State<RegisterTnc> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("By registering, you agree to our"),
        Text("Privacy Policy and Terms of Service"),
      ],
    );
  }
}
