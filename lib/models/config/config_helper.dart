import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sense_flutter/basics/helpers/base_http_helper.dart';

class ConfigHelper extends BaseHTTPHelper {
  static final instance = FirebaseFirestore.instance;
  static String getConfigYear() {
    return DateTime.now().year.toString();
  }

  Future<List<String>> diseases() async {
    var result = await get<Map<String, dynamic>>(endpoint: "diseases");
    return result["value"] as List<String>;
  }
}
