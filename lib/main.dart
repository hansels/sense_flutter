import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/functions/double_back_function.dart';
import 'package:sense_flutter/functions/image_picker_helper.dart';
import 'package:sense_flutter/screens/home/home_screen.dart';
import 'package:sense_flutter/screens/introduction/introduction_screen.dart';
import 'package:sense_flutter/widgets/custom/animated_splash/animated_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Configs.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Svenska",
        primaryColor: Configs.primaryColor,
        accentColor: Configs.secondaryColor,
        errorColor: Configs.dangerColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(
        builder: (context) {
          return AnimatedSplash.styled(
            imagePath: "assets/logo.png",
            duration: 2000,
            customFunction: splashScreen(context),
            curve: Curves.easeInOutCirc,
            style: AnimationStyle.FadeIn,
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }

  static Future<Widget> splashScreen(BuildContext context) async {
    return DoubleBackFunction.use(child: IntroductionScreen());
  }
}
