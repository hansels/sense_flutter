import 'package:flutter/material.dart';
import 'package:sense_flutter/models/resort/resort.dart';
import 'package:sense_flutter/models/resort/resort_helper.dart';
import 'package:sense_flutter/screens/home/widgets/home_card.dart';
import 'package:sense_flutter/widgets/builder/stream_use.dart';
import 'package:sense_flutter/widgets/loading_widget.dart';
import 'package:sense_flutter/widgets/wrong_widget.dart';

class HomeContentPage extends StatefulWidget {
  final int i;
  HomeContentPage(this.i);

  @override
  _HomeContentPageState createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
  ResortHelper _resortHelper;

  @override
  void initState() {
    _resortHelper = ResortHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Iterable<Resort>>(
      stream: _resortHelper.listResortByType(getTypeByI(widget.i)),
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return WrongWidget("Error Occured when Fetch Data!");
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingWidget();

        var documents = snapshot?.data ?? [];
        var resorts = documents.toList();

        if (resorts.length == 0) return WrongWidget("Data Tidak Ditemukan!");

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
    );
  }

  String getTypeByI(int i) {
    switch (i) {
      case 0:
        return "Villa";
      case 1:
        return "Glamping";
      default:
        return "Apartment";
    }
  }
}
