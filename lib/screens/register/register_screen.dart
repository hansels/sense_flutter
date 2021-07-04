import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/register/register_page.dart';

class RegisterScreen extends BaseScreen {
  RegisterScreen() : super(padding: EdgeInsets.zero, scrollable: false);

  @override
  Widget content(BuildContext context) {
    return RegisterPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
