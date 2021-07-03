import 'package:flutter/material.dart';
import 'package:sense_flutter/enums/page_name.dart';

abstract class IRouteConfiguration {
  Future<Widget> getScreen(BuildContext context);
  PageName pageName;
}
