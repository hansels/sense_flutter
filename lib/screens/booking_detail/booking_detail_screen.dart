import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/screens/base_screen.dart';
import 'package:sense_flutter/screens/booking_detail/booking_detail_page.dart';

class BookingDetailScreen extends BaseScreen {
  @override
  Widget content(BuildContext context) {
    return BookingDetailPage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }
}
