import 'package:check_my_news/components/news_card.dart';
import 'package:check_my_news/constants/enum_constants.dart';
import 'package:flutter/material.dart';

import 'package:check_my_news/model/newsClass.dart';
import 'package:check_my_news/services/backend.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key, required this.category}) : super(key: key);

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
  final NewsCategory category;
}

class _NewsListScreenState extends State<NewsListScreen> {
  late final Future<News> _future;

  @override
  void initState() {
    super.initState();
    _future = fetchCategoryNews(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          News news = snapshot.data as News;

          return Column(
            children: <Widget>[
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await fetchCategoryNews(widget.category);
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
