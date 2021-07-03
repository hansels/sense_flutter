import 'package:flutter/material.dart';
import 'package:sense_flutter/functions/token_version.dart';
import 'package:sense_flutter/models/user/user.dart';
import 'package:sense_flutter/widgets/builder/future_use.dart';

class UserBuilder extends StatefulWidget {
  final Function(User) builder;
  final Widget widget;
  UserBuilder({this.builder, this.widget});

  @override
  _UserBuilderState createState() => _UserBuilderState();
}

class _UserBuilderState extends State<UserBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureUse(
      future: TokenVersion.getUser(),
      widget: widget.widget,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? widget.builder(snapshot.data)
              : Container(),
    );
  }
}
