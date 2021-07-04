import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/profile/profile_page.dart';

class ProfileScreen extends BaseScreen {
  ProfileScreen() : super(scrollable: false, padding: EdgeInsets.zero);

  @override
  Widget content(BuildContext context) {
    return ProfilePage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
