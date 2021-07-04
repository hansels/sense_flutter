import 'package:flutter/material.dart';
import 'package:sense_flutter/models/user/user.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';

class ChatAvatar extends StatefulWidget {
  final User user;

  ChatAvatar({@required this.user});

  @override
  _ChatAvatarState createState() => _ChatAvatarState();
}

class _ChatAvatarState extends State<ChatAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: widget.user.avatarColor,
      child: CustomText(
        widget.user.subName,
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
