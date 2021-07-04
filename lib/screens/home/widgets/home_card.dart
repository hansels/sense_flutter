import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/functions/picture_factory.dart';
import 'package:sense_flutter/functions/routes.dart';
import 'package:sense_flutter/models/resort/resort.dart';

class HomeCard extends StatelessWidget {
  final Resort resort;
  const HomeCard({@required this.resort});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(const Radius.circular(10)),
      child: GestureDetector(
        onTap: () => Routes.push(
          context,
          PageName.Resort,
          arguments: {"resort": resort},
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.width / 2) - 15,
              child: PictureFactory.build(
                resort.images[0],
                placeholderRatioX: 1,
                placeholderRatioY: 1,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(210, 0, 0, 0),
                    Color.fromARGB(70, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    resort.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
