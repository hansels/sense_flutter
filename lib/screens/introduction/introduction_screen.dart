import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/introduction/introduction_page.dart';

class IntroductionScreen extends BaseScreen {
  IntroductionScreen() : super(scrollable: false, padding: EdgeInsets.zero);

  @override
  Widget content(BuildContext context) {
    return IntroductionPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
