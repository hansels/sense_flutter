import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/functions/routes.dart';
import 'package:swipe_up/swipe_up.dart';

class IntroductionPage extends StatefulWidget {
  IntroductionPage({Key key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  Random _random;

  @override
  void initState() {
    _random = Random();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwipeUp(
      color: Colors.white,
      onSwipe: () => Routes.push(context, PageName.Home),
      body: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(generateImageRandom()),
            ],
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: const Text(
          'Swipe Up',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  String generateImageRandom() => "assets/image_${next(0, 10)}";
  int next(int min, int max) => min + _random.nextInt(max - min);
}
