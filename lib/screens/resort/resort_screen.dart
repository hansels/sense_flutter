import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/resort/resort_page.dart';

class ResortScreen extends BaseScreen {
  ResortScreen() : super(scrollable: false, padding: EdgeInsets.zero);

  @override
  Widget content(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    return ResortPage(resort: args["resort"]);
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
