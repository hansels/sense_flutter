import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/functions/routes.dart';
import 'package:sense_flutter/functions/token_version.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';
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
      color: Colors.black87,
      onSwipe: () async {
        String token = await TokenVersion.getToken();
        if (token.isEmpty) return Routes.push(context, PageName.Login);
        return Routes.push(context, PageName.Home);
      },
      body: Material(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: const CustomText("Good Day,", fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: const CustomText("Traveller!", fontSize: 32),
              ),
              const SizedBox(height: 30),
              Image.asset(generateImageRandom()),
            ],
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: const Text(
          'Swipe Up',
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  String generateImageRandom() => "assets/image_${next(0, 10)}.png";

  int next(int min, int max) => min + _random.nextInt(max - min);
}
