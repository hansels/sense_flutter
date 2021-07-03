import 'dart:io';

import 'package:sense_flutter/basics/helpers/base_http_helper.dart';
import 'package:sense_flutter/models/prediction/prediction.dart';

class PredictionHelper extends BaseHTTPHelper {
  Future<Prediction> predict(File file) async {
    var response = await formData(file: file, endpoint: "/predict");
    return Prediction.fromMap(response);
  }
}
