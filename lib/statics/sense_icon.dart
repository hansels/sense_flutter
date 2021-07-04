import 'package:flutter/material.dart';

class SenseIcon {
  static Icon miniIcon(IconData icon, {Color color}) =>
      Icon(icon, color: color, size: 20);
  static Icon icon(IconData icon, {Color color}) =>
      Icon(icon, color: color, size: 30);
}
