import 'package:flutter/material.dart';
import 'package:sense_flutter/basics/route_configurations/base_route_configuration.dart';

import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/functions/double_back_function.dart';
import 'profile_screen.dart';

class ProfileScreenRouteConfiguration extends BaseRouteConfiguration {
  ProfileScreenRouteConfiguration() : super(PageName.Profile);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return DoubleBackFunction.use(child: ProfileScreen());
  }
}
