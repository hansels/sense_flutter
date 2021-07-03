import 'package:flutter/material.dart';

class Refresher with ChangeNotifier {
  refresh() {
    notifyListeners();
  }
}
