import 'package:flutter/material.dart';

class PlaceHolder extends StatefulWidget {
  final double ratioX;
  final double ratioY;
  final double height;

  PlaceHolder({this.ratioX = 1, this.ratioY = 1, @required this.height});

  @override
  _PlaceHolderState createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.ratioX / widget.ratioY,
      child: Container(
        child: Center(
          child: Image.asset('assets/logo.png', height: widget.height),
        ),
        color: Colors.white,
      ),
    );
  }
}
