import 'package:flutter/material.dart';
import 'package:sense_flutter/models/user/user.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';
import 'package:sense_flutter/widgets/greetings.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class HomeGreetingsName extends StatefulWidget {
  final User user;

  HomeGreetingsName({@required this.user});

  @override
  _HomeGreetingsNameState createState() => _HomeGreetingsNameState();
}

class _HomeGreetingsNameState extends State<HomeGreetingsName>
    with AnimationMixin {
  Animation<double> _fadeInGreetings, _fadeInName, _fadeInHelp;

  @override
  void initState() {
    _fadeInGreetings = 0.0.tweenTo(1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.fastOutSlowIn,
        ));

    _fadeInName = 0.0.tweenTo(1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        ));

    _fadeInHelp = 0.0.tweenTo(1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.9, 1.0, curve: Curves.fastOutSlowIn),
        ));

    controller?.play(duration: const Duration(seconds: 5));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeTransition(
          opacity: _fadeInGreetings,
          child: const Greetings(),
        ),
        FadeTransition(
          opacity: _fadeInName,
          child: CustomText(widget.user.name, fontSize: 28),
        ),
        const SizedBox(height: 15),
        FadeTransition(
          opacity: _fadeInHelp,
          child: CustomText("Is there anything we can help?", fontSize: 20),
        ),
      ],
    );
  }
}
