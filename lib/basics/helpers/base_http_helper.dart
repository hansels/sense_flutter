import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sense_flutter/basics/exceptions/http_exception.dart';
import 'package:sense_flutter/functions/token_version.dart';
import 'package:http/http.dart' as http;
import 'package:sense_flutter/configs/configs.dart';

abstract class BaseHTTPHelper {
  static Dio dio = Dio();

  Future<T> post<T>({String json, String endpoint}) async {
    try {
      var url = Uri.http(Configs.httpLink, "/$endpoint");
      var response = await http.post(
        url,
        body: json,
        headers: await generateHeaders(),
      );
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        return map['data'];
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err);
    }
  }

  Future<T> get<T>({String endpoint}) async {
    try {
      var url = Uri.http(Configs.httpLink, "/$endpoint");
      var response = await http.get(
        url,
        headers: await generateHeaders(),
      );
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        return map['data'];
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err);
    }
  }

  Future<Map<String, dynamic>> formData({
    String endpoint,
    @required File file,
  }) async {
    try {
      var multipart = await MultipartFile.fromFile(file.path);
      var formData = FormData.fromMap({"data": multipart});

      var response = await dio.post(
        "http://" + Configs.httpLink + endpoint,
        data: formData,
        options: Options(headers: await mustAuthorized()),
      );

      if (response.statusCode == 200) {
        return response.data["data"];
      } else {
        throw "Upload Image Error";
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<Map<String, String>> mustAuthorized() async {
    String token = await TokenVersion.getToken();
    return {"Authorization": "Bearer $token"};
  }

  Future<Map<String, String>> generateHeaders() async {
    String token = await TokenVersion.getToken();
    if (token == null) {
      return {"content-type": "application/json"};
    } else {
      return {
        "content-type": "application/json",
        "Authorization": "Bearer $token",
      };
    }
  }
}
