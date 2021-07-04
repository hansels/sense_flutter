import 'package:sense_flutter/basics/route_configurations/base_route_configuration.dart';

import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/screens/resort/resort_screen.dart';
import 'resort_screen.dart';

class ResortScreenRouteConfiguration extends BaseRouteConfiguration {
  ResortScreenRouteConfiguration()
      : super(PageName.Resort, builder: (context) => ResortScreen());
}
