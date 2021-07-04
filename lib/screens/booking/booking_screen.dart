import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/booking/booking_page.dart';

class BookingScreen extends BaseScreen {
  BookingScreen() : super(scrollable: false, padding: EdgeInsets.zero);

  @override
  Widget content(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    return BookingPage(resort: args["resort"]);
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
