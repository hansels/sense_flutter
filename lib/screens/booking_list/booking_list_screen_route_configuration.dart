import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/route_configurations/base_route_configuration.dart';

import 'package:sense_flutter/enums/page_name.dart';
import 'booking_list_screen.dart';

class BookingListScreenRouteConfiguration extends BaseRouteConfiguration {
  BookingListScreenRouteConfiguration() : super(PageName.BookingList);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return BookingListScreen();
  }
}
