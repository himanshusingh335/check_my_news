import 'package:check_my_news/components/news_card.dart';
import 'package:check_my_news/constants/enum_constants.dart';
import 'package:check_my_news/injector.dart';
import 'package:check_my_news/services/news/newsServices.dart';
import 'package:flutter/material.dart';

import 'package:check_my_news/model/newsClass.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key, required this.category}) : super(key: key);

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
  final NewsCategory category;
}

class _NewsListScreenState extends State<NewsListScreen> {
  final newsServices = injector<NewsServices>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
      future: newsServices.fetchCategoryNews(categoryToStringMap[widget.category]!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          News news = snapshot.data as News;

          return Column(
            children: <Widget>[
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await newsServices.fetchCategoryNews(categoryToStringMap[widget.category]!);
                  },
                  child: ListView.separated(
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(
                        cardNews: news.value[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
