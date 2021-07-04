import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/route_configurations/base_route_configuration.dart';

import 'package:sense_flutter/enums/page_name.dart';
import 'booking_screen.dart';

class BookingScreenRouteConfiguration extends BaseRouteConfiguration {
  BookingScreenRouteConfiguration() : super(PageName.Booking);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return BookingScreen();
  }
}
