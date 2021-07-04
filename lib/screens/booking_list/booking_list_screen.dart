import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen_with_app_bar.dart';
import 'package:sense_flutter/screens/booking_list/booking_list_page.dart';

class BookingListScreen extends BaseScreenWithAppBar {
  BookingListScreen()
      : super(
          "BOOKING",
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return BookingListPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
