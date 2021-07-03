import 'package:flutter/material.dart';
import 'package:sense_flutter/screens/home/widgets/home_greetings_name.dart';
import 'package:sense_flutter/widgets/builder/user_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        UserBuilder(builder: (user) => HomeGreetingsName(user: user)),
      ],
    );
  }
}
