import 'package:sense_flutter/basics/route_configurations/base_route_configuration.dart';

import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/screens/search/search_screen.dart';
import 'search_screen.dart';

class SearchScreenRouteConfiguration extends BaseRouteConfiguration {
  SearchScreenRouteConfiguration()
      : super(PageName.Search, builder: (context) => SearchScreen());
}
