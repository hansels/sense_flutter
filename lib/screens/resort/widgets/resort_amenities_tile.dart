import 'package:flutter/material.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/widgets/custom/animated_splash/animated_splash.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';

class ResortAmenitiesTile extends StatefulWidget {
  final String amenity;

  ResortAmenitiesTile({this.amenity});

  @override
  _ResortAmenitiesTileState createState() => _ResortAmenitiesTileState();
}

class _ResortAmenitiesTileState extends State<ResortAmenitiesTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 18, color: Configs.secondaryColor),
        const SizedBox(width: 10),
        CustomText(
          widget.amenity,
          fontSize: 20,
        ),
      ],
    );
  }
}
