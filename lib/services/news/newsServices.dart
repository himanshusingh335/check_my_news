
import 'package:check_my_news/constants/enum_constants.dart';
import 'package:check_my_news/model/newsClass.dart';
import 'package:check_my_news/model/response/baseResponseModel.dart';
import 'package:check_my_news/services/base/baseServices.dart';

class NewsServices extends BaseServices {
  
  Future<News> fetchTrendingNews() async {
    BaseResponseModel response = await get(endpoint.getTrendingNews, param: {
      "count": "10",
      "safeSearch": "Strict",
      "textFormat": "Raw",
      "mkt": "en-in"
    });

    if (response.statusCode == 200) {
      return News.fromJson(response.data!);
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      throw Exception('Failed to load Trending news');
    }
  }

  Future<News> fetchCategoryNews(String category) async {
    BaseResponseModel response = await get(endpoint.getNews, param: {
      "textFormat": "Raw",
      "safeSearch": "Strict",
      "mkt": "en-in",
      "category": category
    });

    if (response.statusCode == 200) {
      return News.fromJson(response.data!);
    } else {
      throw Exception('Failed to load Category news');
    }
  }

  Future<News> fetchSearchedNews(String query) async {
    BaseResponseModel response = await get(endpoint.getNews, param: {
      "q": query,
      "safeSearch": "Off",
      "textFormat": "Raw",
      "freshness": "Day"
    });

    if (response.statusCode == 200) {
      return News.fromJson(response.data!);
    } else {
      throw Exception('Failed to load searched news');
    }
  }
}

