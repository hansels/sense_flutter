import 'package:flutter/material.dart';
import 'package:sense_flutter/models/prediction/prediction.dart';
import 'package:sense_flutter/models/resort/resort_helper.dart';
import 'package:sense_flutter/screens/home/widgets/home_card.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';
import 'package:sense_flutter/widgets/loading_widget.dart';
import 'package:sense_flutter/widgets/transparent_app_bar.dart';
import 'package:sense_flutter/widgets/wrong_widget.dart';

class SearchPage extends StatefulWidget {
  final Prediction prediction;

  SearchPage({this.prediction});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ResortHelper _resortHelper;

  @override
  void initState() {
    _resortHelper = ResortHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prediction = widget.prediction;
    if (!prediction.isDetected) {
      return Column(
        children: [
          const TransparentAppBar(),
          Expanded(child: WrongWidget("No Detection Can Be Made!")),
        ],
      );
    }
    return Column(
      children: [
        const TransparentAppBar(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomText(
                  "We Have ${prediction.verdict.toUpperCase()} For You..",
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: CustomText("Search Result", fontSize: 20),
              ),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future:
                      _resortHelper.getResortsBySpecialties(prediction.verdict),
                  builder: (context, snapshot) {
                    if (snapshot.hasError)
                      return WrongWidget("Error Occured when Fetch Data!");
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return LoadingWidget();

                    var documents = snapshot?.data ?? [];
                    var resorts = documents.toList();

                    if (resorts.length == 0)
                      return WrongWidget("Data Tidak Ditemukan!");

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      padding: const EdgeInsets.all(15),
                      itemCount: resorts.length,
                      itemBuilder: (context, i) => HomeCard(resort: resorts[i]),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
