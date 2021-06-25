import 'package:check_my_news/screens/businessTab.dart';
import 'package:check_my_news/screens/entertainmentTab.dart';
import 'package:check_my_news/screens/indiaTab.dart';
import 'package:check_my_news/screens/lifestyleTab.dart';
import 'package:check_my_news/screens/politicsTab.dart';
import 'package:check_my_news/screens/scienceTab.dart';
import 'package:check_my_news/screens/sportsTab.dart';
import 'package:check_my_news/screens/trending.dart';
import 'package:check_my_news/screens/worldTab.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(this.title),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Tab>[
              new Tab(text: 'Trending'),
              new Tab(text: 'India'),
              new Tab(text: 'Politics'),
              new Tab(text: 'Science & Tech'),
              new Tab(text: 'Sports'),
              new Tab(text: 'Business'),
              new Tab(text: 'Entertainment'),
              new Tab(text: 'Lifestyle'),
              new Tab(text: 'World'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: FlutterLogo(
                  size: 5,
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                //onTap: () {
                //Navigator.pushNamed(context, '/settings');
                //},
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          Trending(),
          India(),
          Politics(),
          Science(),
          Sports(),
          Business(),
          Entertainment(),
          LifeStyle(),
          World(),
        ]),
      ),
    );
  }
}
