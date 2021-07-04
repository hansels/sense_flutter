import 'package:flutter/cupertino.dart';
import 'package:sense_flutter/models/resort/resort.dart';
import 'package:sense_flutter/models/resort/resort_helper.dart';
import 'package:sense_flutter/screens/booking_list/widgets/booking_list_card.dart';
import 'package:sense_flutter/widgets/loading_widget.dart';
import 'package:sense_flutter/widgets/wrong_widget.dart';

class BookingListPage extends StatefulWidget {
  @override
  _BookingListPageState createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
  ResortHelper _resortHelper;

  @override
  void initState() {
    _resortHelper = ResortHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Resort>>(
      future: _resortHelper.getResortsBySpecialties("Nature"),
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return WrongWidget("Error Occured when Fetch Data!");
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingWidget();

        var documents = snapshot?.data ?? [];
        var resorts = documents.toList();

        if (resorts.length == 0) return WrongWidget("Data Tidak Ditemukan!");

        return ListView.builder(
          itemBuilder: (context, i) => BookingListCard(resort: resorts[i]),
          itemCount: resorts.length,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        );
      },
    );
  }
}
