import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sense_flutter/configs/configs.dart';

import 'package:sense_flutter/functions/routes.dart';
import 'package:sense_flutter/enums/page_name.dart';
import 'package:sense_flutter/functions/loading_function.dart';
import 'package:sense_flutter/functions/toast_helper.dart';
import 'package:sense_flutter/functions/token_version.dart';
import 'package:sense_flutter/models/login/login_data.dart';
import 'package:sense_flutter/models/user/user_helper.dart';
import 'package:sense_flutter/statics/sense_icon.dart';
import 'package:sense_flutter/widgets/header.dart';

import 'package:sense_flutter/widgets/long_raised_button.dart';
import 'package:sense_flutter/widgets/password_form_field.dart';
import 'package:sense_flutter/widgets/usual_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserHelper _helper;

  GlobalKey<FormState> _formKey;
  FocusNode _usernameFocusNode;
  FocusNode _passwordFocusNode;
  LoginData _loginData;

  @override
  void initState() {
    _helper = UserHelper();
    _formKey = GlobalKey<FormState>();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _loginData = LoginData();
    super.initState();
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Header(
          withAppBar: true,
          withBackButton: true,
          title: "LOGIN",
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Center(child: Image.asset("assets/logo.png", width: 160)),
                const SizedBox(height: 15),
                Padding(
                  padding: Configs.screenEdgeInsets,
                  child: Form(
                    autovalidateMode: _loginData.autoValidate
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        UsualFormField(
                          suffixIcon: SenseIcon.icon(Icons.email),
                          labelText: "Alamat E-Mail",
                          hintText: "ex: abc@xyz.com",
                          focusNode: _usernameFocusNode,
                          textInputAction: TextInputAction.next,
                          text: _loginData.email,
                          onChanged: (val) => _loginData.email = val,
                          validator: (_) => _loginData.emailValidator(),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                        ),
                        const SizedBox(height: 10),
                        PasswordFormField(
                          focusNode: _passwordFocusNode,
                          textInputAction: TextInputAction.next,
                          text: _loginData.password,
                          onChanged: (val) => _loginData.password = val,
                          validator: (_) => _loginData.passwordValidator(),
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).requestFocus(FocusNode()),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Lupa Password?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              color: Configs.tertiaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: LongRaisedButton(
                            dividedBy: 1.25,
                            color: Configs.quaternaryColor,
                            onPressed: () async => await login(context),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Belum Terdaftar? ",
                              style: TextStyle(fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Routes.push(context, PageName.Register),
                              child: Text(
                                "Registrasi disini!",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Configs.tertiaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        // TitleButton(
                        //   iconData: FontAwesomeIcons.infoCircle,
                        //   title: "Tentang Aplikasi",
                        //   onTap: () => Routes.push(context, PageName.About),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> login(BuildContext context) async {
    try {
      LoadingFunction.showLoadingDialog(context);
      var result = await _helper.login(_loginData);
      LoadingFunction.closeLoadingDialog(context);

      TokenVersion.setTokenAndUser(result.token, result.user);
      Routes.pushAndRemoveUntil(context, PageName.Home);
    } catch (err) {
      LoadingFunction.closeLoadingDialog(context);
      ToastHelper.showException(err.message, context);
    }
  }
}
