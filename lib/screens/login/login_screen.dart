import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/login/login_page.dart';

class LoginScreen extends BaseScreen {
  LoginScreen() : super(padding: EdgeInsets.zero);

  @override
  Widget content(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: LoginPage(),
    );
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
