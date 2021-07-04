import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/search/search_page.dart';

class SearchScreen extends BaseScreen {
  SearchScreen() : super(padding: EdgeInsets.zero, scrollable: false);

  @override
  Widget content(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    return SearchPage(prediction: args["prediction"]);
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
