import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/booking/booking_page.dart';

class BookingScreen extends BaseScreen {
  @override
  Widget content(BuildContext context) {
    return BookingPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
