import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sense_flutter/functions/routes.dart';
import 'package:sense_flutter/functions/token_version.dart';
import 'package:sense_flutter/statics/sense_icon.dart';
import 'package:sense_flutter/widgets/builder/user_builder.dart';
import 'package:sense_flutter/widgets/title_button.dart';
import 'package:sense_flutter/widgets/usual_form_field.dart';

class HomeProfilePage extends StatefulWidget {
  @override
  _HomeProfilePageState createState() => _HomeProfilePageState();
}

class _HomeProfilePageState extends State<HomeProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return Container(
        height: screenSize.height,
        width: screenSize.width,
        child: _content(),
      );
    } else {
      return _content();
    }
  }

  Widget _content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        UserBuilder(
          builder: (user) {
            return Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 15),
                      UsualFormField(
                        suffixIcon: SenseIcon.icon(Icons.person),
                        labelText: "Nama Lengkap",
                        textInputAction: TextInputAction.next,
                        text: user.name,
                        readOnly: true,
                      ),
                      UsualFormField(
                        suffixIcon: SenseIcon.icon(Icons.email),
                        labelText: "Alamat E-Mail",
                        text: user.email,
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: <Widget>[
                      TitleButton(
                        iconData: FontAwesomeIcons.key,
                        title: "Ganti Password",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: OutlineButton(
              child: const Text("LOGOUT", style: TextStyle(fontSize: 15)),
              highlightedBorderColor: Colors.red,
              textColor: Colors.red,
              borderSide: const BorderSide(color: Colors.red),
              shape: const StadiumBorder(),
              splashColor: Colors.red[50],
              onPressed: () {
                try {
                  TokenVersion.clearTokenAndUser();
                  Routes.pop(context);
                } catch (err) {
                  print(err);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
