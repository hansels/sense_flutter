import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/route_configurations/base_route_configuration.dart';

import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/functions/double_back_function.dart';
import 'home_screen.dart';

class HomeScreenRouteConfiguration extends BaseRouteConfiguration {
  HomeScreenRouteConfiguration() : super(PageName.Home);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return DoubleBackFunction.use(child: HomeScreen());
  }
}
