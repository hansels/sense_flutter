import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/booking_list/booking_list_page.dart';

class BookingListScreen extends BaseScreen {
  @override
  Widget content(BuildContext context) {
    return BookingListPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
