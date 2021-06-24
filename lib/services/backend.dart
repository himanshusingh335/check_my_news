import 'dart:convert';

import 'package:check_my_news/model/newsClass.dart';
import 'package:http/http.dart' as http;

Future<News> fetchNews() async {
  final response = await http.get(
    Uri.https('bing-news-search1.p.rapidapi.com', '/news/trendingtopics', {
      "count": "10",
      "safeSearch": "Strict",
      "textFormat": "Raw",
      "mkt": "en-in"
    }),
    headers: <String, String>{
      "x-msedge-clientip": "103.208.69.28",
      "x-bingapis-sdk": "true",
      "x-rapidapi-key": "091d3ca15fmshf687b8d71d5b41ep15a8d9jsn26fd0bb2a445",
      "x-rapidapi-host": "bing-news-search1.p.rapidapi.com",
      "useQueryString": "true",
      "x-msedge-clientid": "050FB0532E7B62B00A75A0332FB36325",
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.headers["x-msedge-clientid"]);
    return News.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
