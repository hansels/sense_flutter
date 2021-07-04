import 'package:flutter/material.dart';
import 'package:sense_flutter/screens/home/widgets/home_rotated_logo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeRotatedLogo();
  }
}
