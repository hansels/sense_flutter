import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sense_flutter/basics/screens/base_screen_with_app_bar.dart';
import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/functions/image_picker_helper.dart';
import 'package:sense_flutter/functions/loading_function.dart';
import 'package:sense_flutter/functions/routes.dart';
import 'package:sense_flutter/functions/toast_helper.dart';
import 'package:sense_flutter/models/prediction/prediction.dart';
import 'package:sense_flutter/models/prediction/prediction_helper.dart';
import 'package:sense_flutter/screens/home/home_page.dart';

class HomeScreen extends BaseScreenWithAppBar {
  PredictionHelper _predictionHelper;

  HomeScreen() : super("HOME", scrollable: false);

  @override
  Widget content(BuildContext context) {
    return HomePage();
  }

  @override
  Widget drawer(BuildContext context) {
    return null;
  }

  @override
  Future<bool> beforeScaffold(BuildContext context) async {
    _predictionHelper = PredictionHelper();
    File lostFile = await ImagePickerHelper.retrieveLostData();
    if (lostFile != null) processImage(context, lostFile);

    return true;
  }

  @override
  Widget appBar(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(FontAwesomeIcons.userCircle, color: Colors.black),
          onPressed: () {},
          tooltip: "Profile Screen",
        ),
      ],
    );
  }

  Future<void> predictWithCamera(BuildContext context) async {
    File file = await ImagePickerHelper.openCameraWithoutCrop();
    await processImage(context, file);
  }

  Future<void> predictWithGallery(BuildContext context) async {
    File file = await ImagePickerHelper.openGalleryWithoutCrop();
    await processImage(context, file);
  }

  Future<void> processImage(BuildContext context, File file) async {
    try {
      LoadingFunction.showLoadingDialog(context);
      Prediction prediction = await _predictionHelper.predict(file);
      LoadingFunction.closeLoadingDialog(context);
    } catch (err) {
      LoadingFunction.closeLoadingDialog(context);
      ToastHelper.showException(err.message, context);
    }
  }
}
