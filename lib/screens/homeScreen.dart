import 'package:check_my_news/components/searcBar.dart';
import 'package:check_my_news/constants/enum_constants.dart';
import 'package:check_my_news/screens/news_list_screen.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),
          ],
          centerTitle: true,
          title: Text(this.title),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Tab>[
              Tab(text: 'India'),
              Tab(text: 'Politics'),
              Tab(text: 'Science & Tech'),
              Tab(text: 'Sports'),
              Tab(text: 'Business'),
              Tab(text: 'Entertainment'),
              Tab(text: 'Lifestyle'),
              Tab(text: 'World'),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          NewsListScreen(category: NewsCategory.India),
          NewsListScreen(category: NewsCategory.Politics),
          NewsListScreen(category: NewsCategory.ScienceANdTech),
          NewsListScreen(category: NewsCategory.Sports),
          NewsListScreen(category: NewsCategory.Business),
          NewsListScreen(category: NewsCategory.Entertainment),
          NewsListScreen(category: NewsCategory.Lifestyle),
          NewsListScreen(category: NewsCategory.World),
        ]),
      ),
    );
  }
}
