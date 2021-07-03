import 'package:flutter/material.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/widgets/custom/custom_text.dart';

class TitleButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function() onTap;

  TitleButton({
    @required this.title,
    @required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(
            iconData,
            color: Configs.primaryColor,
          ),
          title: CustomText(
            title,
            fontSize: 20,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Configs.secondaryColor,
          ),
          onTap: onTap,
          dense: true,
        ),
        const Divider(color: Colors.grey, height: 10),
      ],
    );
  }
}
