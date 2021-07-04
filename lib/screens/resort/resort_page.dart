import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/functions/picture_factory.dart';
import 'package:sense_flutter/functions/toast_helper.dart';
import 'package:sense_flutter/models/resort/resort.dart';
import 'package:sense_flutter/screens/resort/widgets/resort_amenities_tile.dart';
import 'package:sense_flutter/screens/resort/widgets/resort_review_tile.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';
import 'package:sense_flutter/widgets/long_raised_button.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class ResortPage extends StatefulWidget {
  final Resort resort;

  ResortPage({this.resort});

  @override
  _ResortPageState createState() => _ResortPageState();
}

class _ResortPageState extends State<ResortPage> {
  ScrollController _listViewController;
  AudioCache _audioCache;
  AudioPlayer _player;
  bool toggleAudio;

  @override
  void initState() {
    _audioCache = AudioCache(prefix: 'assets/audio/');
    _player = AudioPlayer();
    _listViewController = ScrollController();
    toggleAudio = false;
    super.initState();
  }

  @override
  void dispose() {
    _player?.dispose();
    _listViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resort = widget.resort;
    return Stack(
      children: [
        SnappingSheet(
          lockOverflowDrag: true,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              disableCenter: true,
              viewportFraction: 1,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            itemBuilder: (context, i, _) =>
                PictureFactory.build(resort.images[i]),
            itemCount: resort.images.length,
          ),
          snappingPositions: [
            SnappingPosition.factor(
              positionFactor: 0.45,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 1500),
            ),
            SnappingPosition.factor(
              positionFactor: 0.0,
              snappingCurve: Curves.easeOutExpo,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.top,
            ),
            SnappingPosition.factor(
              positionFactor: 0.9,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.bottom,
            ),
          ],
          grabbing: GrabbingWidget(),
          grabbingHeight: 60,
          sheetAbove: null,
          sheetBelow: SnappingSheetContent(
            draggable: true,
            childScrollController: _listViewController,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _listViewController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              resort.name,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 2.5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  rupiah(resort.price),
                                  fontSize: 26,
                                  color: Configs.tertiaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(width: 10),
                                CustomText("*Est. Cost/night")
                              ],
                            ),
                            const SizedBox(height: 2.5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 30,
                                  color: Colors.yellow[800],
                                ),
                                CustomText(
                                  resort.rating.toString(),
                                  fontSize: 32,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const CustomText("Description", fontSize: 26),
                            const SizedBox(height: 5),
                            CustomText(resort.description, fontSize: 15),
                            const SizedBox(height: 10),
                            const CustomText("Amenities", fontSize: 26),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: resort.amenities
                                  .map((e) => ResortAmenitiesTile(amenity: e))
                                  .toList(),
                            ),
                            const SizedBox(height: 20),
                            const CustomText("Reviews", fontSize: 26),
                            const SizedBox(height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: resort.reviews
                                  .map((e) => ResortReviewTile(review: e))
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.virusSlash,
                                      size: 16,
                                      color: Configs.primaryColor,
                                    ),
                                    const SizedBox(width: 7.5),
                                    CustomText(
                                      "Green Zone",
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                const Text("COVID Status"),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.mapMarker,
                                      size: 16,
                                      color: Configs.primaryColor,
                                    ),
                                    const SizedBox(width: 2.5),
                                    CustomText(
                                      "3.8 KM",
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                const Text("Distance"),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.thermostat,
                                      color: Configs.primaryColor,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 2.5),
                                    CustomText(
                                      "25 °C",
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                const Text("Temperature"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: LongRaisedButton(
                          onPressed: () =>
                              ToastHelper.show("Booking Success!", context),
                          child: CustomText(
                            "Book Now",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SafeArea(child: const BackButton(color: Colors.white70)),
        Positioned(
          right: 7.5,
          top: 7.5,
          child: SafeArea(
            child: GestureDetector(
              onTap: () async {
                if (!toggleAudio) {
                  _player = await _audioCache.play(
                    "${resort.specialties[0]}.mp3",
                    stayAwake: true,
                    volume: 1.0,
                  );
                }

                if (toggleAudio) _player?.stop();

                toggleAudio = !toggleAudio;
              },
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: Icon(Icons.volume_up, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(blurRadius: 25, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 100,
            height: 7,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 2,
            margin: EdgeInsets.all(15).copyWith(top: 0, bottom: 0),
          )
        ],
      ),
    );
  }
}
