import 'package:flutter/material.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/widgets/loading_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingFunction {
  static Widget loadingSquareCircle(BuildContext context) {
    return Container(
      height: double.infinity,
      child: LoadingWidget(),
    );
  }

  static Widget loadingInside(BuildContext context) {
    return LoadingWidget(withContainer: false);
  }

  static Widget loadingInfinte() {
    return SpinKitThreeBounce(
      color: Configs.secondaryColor,
    );
  }

  static Future showLoadingDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SpinKitSquareCircle(
          color: Configs.secondaryColor,
          size: 125.0,
        );
      },
    );
  }

  static void closeLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
