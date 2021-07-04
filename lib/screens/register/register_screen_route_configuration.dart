import 'package:sense_flutter/basics/route_configurations/base_route_configuration.dart';

import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/screens/register/register_screen.dart';
import 'register_screen.dart';

class RegisterScreenRouteConfiguration extends BaseRouteConfiguration {
  RegisterScreenRouteConfiguration()
      : super(PageName.Register, builder: (context) => RegisterScreen());
}
