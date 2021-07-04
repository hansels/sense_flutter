import 'package:flutter/material.dart';
import 'package:sense_flutter/configs/configs.dart';

class LongRaisedButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final bool disabled;
  final Color color;
  final double dividedBy;

  LongRaisedButton({
    @required this.onPressed,
    this.child,
    this.disabled = false,
    this.color = Configs.primaryColor,
    this.dividedBy = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / dividedBy,
      child: RaisedButton(
        shape: roundedRectangleBorder(),
        color: color,
        onPressed: disabled ? null : onPressed,
        child: child,
      ),
    );
  }

  static RoundedRectangleBorder roundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(const Radius.circular(12.5)),
    );
  }
}
