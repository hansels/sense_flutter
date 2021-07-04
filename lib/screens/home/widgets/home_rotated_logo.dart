import 'package:flutter/material.dart';

class HomeRotatedLogo extends StatefulWidget {
  HomeRotatedLogo({Key key}) : super(key: key);

  @override
  _HomeRotatedLogoState createState() => _HomeRotatedLogoState();
}

class _HomeRotatedLogoState extends State<HomeRotatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController _rotationController;

  @override
  void initState() {
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _rotationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_rotationController),
      child: GestureDetector(
        onTap: () => _rotationController.forward(from: 0.0),
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
