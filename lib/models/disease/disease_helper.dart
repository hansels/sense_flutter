import 'package:sense_flutter/basics/helpers/base_http_helper.dart';

class DiseaseHelper extends BaseHTTPHelper {
  Future<List<String>> diseases() async {
    var result = await get<Map<String, dynamic>>(endpoint: "diseases");
    return toListStringFromDynamic(result["value"]);
  }

  static List<String> toListStringFromDynamic(List<dynamic> data) {
    return data == null ? [] : data.map((e) => e as String).toList();
  }
}
