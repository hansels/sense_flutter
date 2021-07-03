import 'dart:convert';
import 'dart:io';

import 'package:package_info/package_info.dart';
import 'package:sense_flutter/models/user/user.dart';

import 'shared_preferences_function.dart';

class TokenVersion {
  final _sharedPreferencesHelper = SharedPreferencesFunction();

  String _token;
  String _os;
  User _user;
  String _version;
  bool _tutorial;

  static TokenVersion _instance;

  static TokenVersion get instance {
    return _instance == null ? (_instance = TokenVersion()) : _instance;
  }

  static Future<String> getVersion() async {
    if (instance._version == null) {
      var packageInfo = await PackageInfo.fromPlatform();
      instance._version = packageInfo.version;
    }
    return instance._version;
  }

  static Future<String> getOS() async {
    if (instance._os == null) {
      instance._os = Platform.isIOS ? "iOS" : "Android";
    }
    return instance._os;
  }

  static Future<String> getVersionString() async {
    var os = await getOS();
    var version = await getVersion();
    return "vers. $os $version";
  }

  static Future<String> getToken() async {
    if (instance._token == null) {
      instance._token =
          await instance._sharedPreferencesHelper.getString('token');
    }
    return instance._token ?? "";
  }

  static Future<User> getUser() async {
    var userString = await instance._sharedPreferencesHelper.getString('user');
    Map<String, dynamic> userMap;
    try {
      userMap = jsonDecode(userString);
    } catch (err) {
      userMap = null;
    }
    instance._user = userMap == null ? User.empty() : User.fromMap(userMap);
    return instance._user;
  }

  static Future<String> getUserEmail() async {
    var user = await getUser();
    return user?.email;
  }

  static Future<void> setTokenAndUser(String token, User user) async {
    await instance._sharedPreferencesHelper.setString('token', token);
    await setUser(user);
    instance._token = token;
    instance._user = user;
  }

  static Future<void> setUser(User user) async {
    var userVariables = user.toVariables();
    var userString = jsonEncode(userVariables);
    await instance._sharedPreferencesHelper.setString('user', userString);
  }

  static Future<void> clearTokenAndUser() async {
    await instance._sharedPreferencesHelper.remove('user');
    await instance._sharedPreferencesHelper.remove('token');
    instance._token = null;
    instance._user = null;
    // auth.FirebaseAuth.instance.signOut();
  }

  static Future<bool> hasUser() async {
    return (await getUser()) != null;
  }

  static Future<void> setTutorial(bool tutorial) async {
    await instance._sharedPreferencesHelper.setBool('tutorial', tutorial);
  }

  static Future<bool> getTutorial() async {
    if (instance._tutorial == null) {
      instance._tutorial =
          await instance._sharedPreferencesHelper.getBool('tutorial');
    }
    return instance._tutorial ?? false;
  }
}
