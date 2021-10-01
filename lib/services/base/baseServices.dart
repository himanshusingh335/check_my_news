

import 'dart:convert';

import 'package:check_my_news/config/endpoint.dart';
import 'package:check_my_news/injector.dart';
import 'package:check_my_news/model/response/baseResponseModel.dart';
import 'package:check_my_news/services/persist.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:http/http.dart' as http;


class BaseServices {

  String? clientID;
  String? clientIP;
  /// Create instance for endpoint
  final endpoint = injector<Endpoint>();

  /// Request get only
  Future<BaseResponseModel> get(String url, {Map<String, dynamic>? param}) async {
    final http.Response response = await http.get(Uri.https(endpoint.baseURL, url, param), headers: await _getHeaders());
    final data = jsonDecode(response.body) as Map<String, dynamic>;

    /// Set client id when null
    if (response.statusCode == 200 && clientID!.isEmpty) {
      setClientID(response.headers["x-msedge-clientid"] ?? "");
    }
    return BaseResponseModel(
      statusCode: response.statusCode,
      data: data
    );
  }

  Future<Map<String, String>>? _getHeaders() async {
    clientID = await getClientID();
    clientIP = await Ipify.ipv64();
    return {
      "x-msedge-clientip": clientIP!,
      "x-bingapis-sdk": "true",
      "x-rapidapi-key": "091d3ca15fmshf687b8d71d5b41ep15a8d9jsn26fd0bb2a445",
      "x-rapidapi-host": endpoint.baseURL,
      "useQueryString": "true",
      "x-msedge-clientid": clientID!,
    };
  }
}