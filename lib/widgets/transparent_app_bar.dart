import 'package:flutter/material.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';

class TransparentAppBar extends StatefulWidget {
  final String title;
  final bool withBackButton;
  final List<Widget> actions;

  const TransparentAppBar({
    this.title = "",
    this.withBackButton = true,
    this.actions,
  });

  @override
  _TransparentAppBarState createState() => _TransparentAppBarState();
}

class _TransparentAppBarState extends State<TransparentAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(widget.title, fontSize: 20),
      centerTitle: true,
      leading: !widget.withBackButton ? null : BackButton(color: Colors.black),
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: widget.actions,
    );
  }
}
