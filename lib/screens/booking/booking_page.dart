import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/models/resort/resort.dart';
import 'package:sense_flutter/widgets/custom/countdown/circular_countdown_timer.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';

class BookingPage extends StatefulWidget {
  final Resort resort;

  BookingPage({this.resort});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  "Scan This QR Code for Check In",
                  fontSize: 24,
                  color: Configs.primaryColor,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.5),
                QrImage(
                  data: DateTime.now().toIso8601String(),
                  version: QrVersions.auto,
                  size: 250.0,
                ),
              ],
            ),
          ),
        ),
        const SafeArea(child: const BackButton(color: Colors.black))
      ],
    );
  }
}
