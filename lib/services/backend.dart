import 'dart:convert';
import 'package:dart_ipify/dart_ipify.dart';

import 'package:check_my_news/services/persist.dart';
import 'package:http/http.dart' as http;

import 'package:check_my_news/model/newsClass.dart';

Future<News> fetchNews() async {
  String clientID = await getClientID();
  String clientIP = await Ipify.ipv64();
  final response = await http.get(
    Uri.https('bing-news-search1.p.rapidapi.com', '/news/trendingtopics', {
      "count": "10",
      "safeSearch": "Strict",
      "textFormat": "Raw",
      "mkt": "en-in"
    }),
    headers: <String, String>{
      "x-msedge-clientip": clientIP,
      "x-bingapis-sdk": "true",
      "x-rapidapi-key": "091d3ca15fmshf687b8d71d5b41ep15a8d9jsn26fd0bb2a445",
      "x-rapidapi-host": "bing-news-search1.p.rapidapi.com",
      "useQueryString": "true",
      "x-msedge-clientid": clientID,
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    if (clientID == "") {
      setClientID(response.headers["x-msedge-clientid"] ?? "");
    }
    return News.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Trending news');
  }
}
