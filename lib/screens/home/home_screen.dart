import 'dart:io';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/functions/image_picker_helper.dart';
import 'package:sense_flutter/functions/loading_function.dart';
import 'package:sense_flutter/functions/routes.dart';
import 'package:sense_flutter/functions/toast_helper.dart';
import 'package:sense_flutter/models/prediction/prediction.dart';
import 'package:sense_flutter/models/prediction/prediction_helper.dart';
import 'package:sense_flutter/screens/home/home_content_page.dart';
import 'package:sense_flutter/screens/home/home_profile_page.dart';
import 'package:sense_flutter/widgets/builder/future_use.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';

class HomeScreen extends StatefulWidget {
  final File lostFile;

  HomeScreen({this.lostFile});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabNum;
  bool isToggle;
  PredictionHelper _predictionHelper;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    tabNum = 0;
    isToggle = true;
    _predictionHelper = PredictionHelper();
    super.initState();
  }

  Future<bool> beforeScaffold(BuildContext context) async {
    if (widget.lostFile != null) processImage(context, widget.lostFile);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureUse(
      future: beforeScaffold(context),
      widget: LoadingFunction.loadingSquareCircle(context),
      builder: (context, snapshot) {
        return KeyboardDismisser(
          child: Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: floatingActionButton(context),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 20,
                  ),
                  child: FlutterSwitch(
                    activeText: "Welcome, Traveller",
                    activeTextColor: Colors.white,
                    activeIcon: Image.asset("assets/icon_toggle.png"),
                    activeTextFontWeight: FontWeight.normal,
                    activeColor: Configs.primaryColor,
                    activeSwitchBorder: Border.all(color: Configs.primaryColor),
                    inactiveText: "Account Settings",
                    inactiveTextColor: Colors.black,
                    inactiveIcon: Image.asset("assets/icon_toggle.png"),
                    inactiveTextFontWeight: FontWeight.normal,
                    inactiveColor: Colors.white,
                    inactiveSwitchBorder:
                        Border.all(color: Configs.primaryColor),
                    toggleSize: 50,
                    valueFontSize: 20.0,
                    borderRadius: 45.0,
                    showOnOff: true,
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    value: isToggle,
                    onToggle: (val) => setState(() => isToggle = !isToggle),
                  ),
                ),
                const SizedBox(height: 10),
                if (isToggle)
                  TabBar(
                    controller: _tabController,
                    onTap: (i) => setState(() => tabNum = i),
                    tabs: [
                      Tab(
                        child: const CustomText(
                          "Villa",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Tab(
                        child: const CustomText(
                          "Glamping",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Tab(
                        child: const CustomText(
                          "Apartment",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                Expanded(
                    child: !isToggle
                        ? HomeProfilePage()
                        : HomeContentPage(tabNum)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget floatingActionButton(BuildContext context) {
    if (!isToggle) return null;
    return FabCircularMenu(
      children: [
        IconButton(
          icon: const Icon(Icons.camera_alt_rounded, color: Colors.white),
          iconSize: 40,
          onPressed: () async => await predictWithCamera(context),
        ),
        IconButton(
          icon: const Icon(Icons.photo_rounded, color: Colors.white),
          iconSize: 40,
          onPressed: () async => await predictWithGallery(context),
        ),
      ],
      fabOpenIcon: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset("assets/logo_white.png", color: Colors.white),
      ),
      fabSize: 75,
      ringDiameter: 300,
      ringWidth: 80,
      ringColor: Configs.primaryColor,
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

      return Routes.push(
        context,
        PageName.Search,
        arguments: {"prediction": prediction},
      );
    } catch (err) {
      LoadingFunction.closeLoadingDialog(context);
      ToastHelper.showException(err.message, context);
    }
  }
}
