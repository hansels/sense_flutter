import 'package:flutter/material.dart';
import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/functions/picture_factory.dart';
import 'package:sense_flutter/functions/routes.dart';
import 'package:sense_flutter/models/resort/resort.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';
import 'package:indonesia/indonesia.dart';

class BookingListCard extends StatefulWidget {
  final Resort resort;

  BookingListCard({this.resort});

  @override
  _BookingListCardState createState() => _BookingListCardState();
}

class _BookingListCardState extends State<BookingListCard> {
  @override
  Widget build(BuildContext context) {
    final resort = widget.resort;
    return Column(
      children: [
        InkWell(
          onTap: () => Routes.push(
            context,
            PageName.Booking,
            arguments: {"resort": resort},
          ),
          child: Row(
            children: [
              Container(
                height: 82.5,
                width: 82.5,
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  clipBehavior: Clip.hardEdge,
                  child: PictureFactory.build(
                    resort.images[0],
                    placeholderRatioX: 1,
                    placeholderRatioY: 1,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      resort.name,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2.5),
                    CustomText(
                      resort.description,
                      fontSize: 11,
                      color: Colors.grey[800],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    CustomText(
                      rupiah(resort.price.toString()),
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(color: Colors.grey, height: 8.0),
      ],
    );
  }
}
