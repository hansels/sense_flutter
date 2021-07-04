import 'package:flutter/material.dart';
import 'package:sense_flutter/models/review/review.dart';
import 'package:sense_flutter/widgets/chat_avatar.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';

class ResortReviewTile extends StatefulWidget {
  final Review review;

  ResortReviewTile({this.review});

  @override
  _ResortReviewTileState createState() => _ResortReviewTileState();
}

class _ResortReviewTileState extends State<ResortReviewTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChatAvatar(user: widget.review.user),
            const SizedBox(width: 7.5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          widget.review.user.name,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.review.comment,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Svenska",
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
