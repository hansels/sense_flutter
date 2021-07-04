import 'package:flutter/material.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:sense_flutter/functions/loading_function.dart';
import 'package:sense_flutter/functions/routes.dart';
import 'package:sense_flutter/functions/toast_helper.dart';
import 'package:sense_flutter/models/register/register_data.dart';
import 'package:sense_flutter/models/user/user_helper.dart';
import 'package:sense_flutter/statics/sense_icon.dart';
import 'package:sense_flutter/widgets/header.dart';
import 'package:sense_flutter/widgets/long_raised_button.dart';
import 'package:sense_flutter/widgets/password_form_field.dart';
import 'package:sense_flutter/widgets/usual_form_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserHelper _helper;

  GlobalKey<FormState> _formKey;
  FocusNode _nameFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;
  FocusNode _confirmPasswordFocusNode;
  RegisterData _registerData;

  @override
  void initState() {
    _helper = UserHelper();
    _formKey = GlobalKey<FormState>();
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _registerData = RegisterData();
    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
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
          title: "REGISTRASI",
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 15),
                    UsualFormField(
                      suffixIcon: SenseIcon.icon(Icons.person),
                      labelText: "Nama Lengkap",
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      text: _registerData.name,
                      onChanged: (val) => _registerData.name = val,
                      validator: (_) => _registerData.nameValidator(),
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_emailFocusNode),
                    ),
                    UsualFormField(
                      suffixIcon: SenseIcon.icon(Icons.email),
                      labelText: "Alamat E-Mail",
                      hintText: "ex: abc@xyz.com",
                      focusNode: _emailFocusNode,
                      textInputAction: TextInputAction.next,
                      text: _registerData.email,
                      onChanged: (val) => _registerData.email = val,
                      validator: (_) => _registerData.emailValidator(),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                    ),
                    const SizedBox(height: 10),
                    PasswordFormField(
                      focusNode: _passwordFocusNode,
                      textInputAction: TextInputAction.next,
                      text: _registerData.password,
                      onChanged: (val) => _registerData.password = val,
                      validator: (_) => _registerData.passwordValidator(),
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_confirmPasswordFocusNode),
                    ),
                    PasswordFormField(
                      labelText: "Konfirmasi Password",
                      focusNode: _confirmPasswordFocusNode,
                      text: _registerData.confirmPassword,
                      onChanged: (val) => _registerData.confirmPassword = val,
                      validator: (_) => _registerData.passwordValidator(),
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(FocusNode()),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: LongRaisedButton(
                        dividedBy: 1.25,
                        color: Configs.tertiaryColor,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (!_registerData.isMatch()) {
                              return ToastHelper.showException(
                                "Password tidak sama..",
                                context,
                              );
                            }
                            await register(context);
                          }
                        },
                        child: const Text(
                          "DAFTAR",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Future<void> register(BuildContext context) async {
    try {
      LoadingFunction.showLoadingDialog(context);
      await _helper.register(_registerData);
      LoadingFunction.closeLoadingDialog(context);
      ToastHelper.show("Registrasi Berhasil!", context);
      Routes.pop(context);
    } catch (err) {
      LoadingFunction.closeLoadingDialog(context);
      ToastHelper.showException(err.message, context);
    }
  }
}
