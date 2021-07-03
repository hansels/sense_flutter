import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WrongWidget extends StatelessWidget {
  final String text;
  final Future<void> Function() onRefresh;
  final double bottomHeight;

  WrongWidget(this.text, {this.onRefresh, this.bottomHeight = 0});
  @override
  Widget build(BuildContext context) {
    return onRefresh != null
        ? RefreshIndicator(
            strokeWidth: 3.5,
            onRefresh: () async => await onRefresh(),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: _child(),
            ),
          )
        : _child();
  }

  Widget _child() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          child: FlareActor(
            "assets/flare/empty_page.flr",
            animation: "empty",
          ),
        ),
        Text(
          text,
          softWrap: true,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: bottomHeight),
      ],
    );
  }
}
