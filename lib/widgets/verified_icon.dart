import 'package:flutter/material.dart';
import 'package:sense_flutter/statics/phoodto_icon.dart';

class VerifiedIcon extends StatefulWidget {
  @override
  _VerifiedIconState createState() => _VerifiedIconState();
}

class _VerifiedIconState extends State<VerifiedIcon> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Verified",
      child: PhoodtoIcon.miniIcon(
        Icons.verified_user,
        color: Colors.green,
      ),
    );
  }
}
