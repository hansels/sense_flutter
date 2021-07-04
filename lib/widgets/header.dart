import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';

class Header extends StatefulWidget {
  final bool withAppBar;
  final bool withBackButton;
  final String title;
  final Gradient gradient;
  final List<Widget> actions;
  final Widget leading;
  final CustomClipper<Path> clipper;

  const Header({
    this.withAppBar = false,
    this.withBackButton = false,
    this.title = "",
    this.gradient,
    this.actions,
    this.leading,
    this.clipper,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: widget.clipper ?? WaveClipperOne(flip: true),
      child: Stack(
        children: <Widget>[
          Container(
            height: 125,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: widget.gradient ??
                  LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Configs.quaternaryColor, Configs.primaryColor],
                  ),
            ),
          ),
          if (widget.withAppBar)
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                title: CustomText(
                  widget.title,
                  fontSize: 20,
                  color: Colors.white,
                ),
                elevation: 0,
                centerTitle: true,
                leading: !widget.withBackButton ? widget.leading : BackButton(),
                backgroundColor: Colors.transparent,
                actions: widget.actions,
              ),
            ),
        ],
      ),
    );
  }
}
