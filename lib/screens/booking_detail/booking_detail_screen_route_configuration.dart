import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/route_configurations/base_route_configuration.dart';

import 'package:sense_flutter/enums/page_name.dart';
import 'booking_detail_screen.dart';

class BookingDetailScreenRouteConfiguration extends BaseRouteConfiguration {
  BookingDetailScreenRouteConfiguration() : super(PageName.BookingDetail);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return BookingDetailScreen();
  }
}
