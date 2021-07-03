import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';

class Greetings extends StatefulWidget {
  const Greetings();

  @override
  _GreetingsState createState() => _GreetingsState();
}

class _GreetingsState extends State<Greetings> {
  @override
  Widget build(BuildContext context) {
    return CustomText(
      getText(),
      fontSize: 24,
      color: Colors.grey[600],
    );
  }

  String getText() {
    DateTime now = DateTime.now();
    int timeNow = int.parse(DateFormat('kk').format(now));

    if (timeNow <= 12) {
      return "Good Morning 🌅";
    } else if (timeNow > 12 && timeNow <= 16) {
      return "Good Afternoon ☀️";
    } else if (timeNow > 16 && timeNow <= 20) {
      return "Good Evening 🌇";
    } else {
      return "Good Night 🌃";
    }
  }
}
