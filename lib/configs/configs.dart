import 'package:flutter/material.dart';

class Configs {
  static String appName = "Sense";

  //Colors for theme
  static const primaryColor = Color.fromRGBO(255, 59, 59, 1);
  static const secondaryColor = Color.fromRGBO(255, 110, 10, 1);
  static const tertiaryColor = Color.fromRGBO(255, 92, 59, 1);
  static const quaternaryColor = Color.fromRGBO(210, 104, 104, 1);
  static const backgroundColor = Color.fromRGBO(231, 216, 209, 1);
  static const stickyNotesColor = Color.fromRGBO(254, 255, 156, 1);

  static const moneyColor = Color.fromRGBO(133, 187, 101, 1);
  static const dangerColor = Color.fromRGBO(217, 83, 79, 1);
  static const highlighterColor = Color.fromRGBO(254, 255, 126, 1);

  static const Color linkColor = Color(0XFF0000EE);
  static const String httpLink = "34.101.173.235:3001";

  static const double screenPadding = 20.0;

  static const EdgeInsets screenEdgeInsets = EdgeInsets.symmetric(
    vertical: Configs.screenPadding / 1.5,
    horizontal: Configs.screenPadding,
  );

  static const EdgeInsets topLeftRightEdgeInsets = const EdgeInsets.only(
    left: Configs.screenPadding,
    right: Configs.screenPadding,
    top: Configs.screenPadding / 1.5,
  );
}
