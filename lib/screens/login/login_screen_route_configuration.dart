import 'package:sense_flutter/basics/route_configurations/base_route_configuration.dart';

import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/screens/login/login_screen.dart';
import 'login_screen.dart';

class LoginScreenRouteConfiguration extends BaseRouteConfiguration {
  LoginScreenRouteConfiguration()
      : super(PageName.Login, builder: (context) => LoginScreen());
}
