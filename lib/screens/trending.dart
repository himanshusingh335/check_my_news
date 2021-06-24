import 'package:check_my_news/model/newsClass.dart';
import 'package:check_my_news/services/backend.dart';
import 'package:flutter/material.dart';

class TrendingHomeScreen extends StatefulWidget {
  const TrendingHomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _TrendingHomeScreenState createState() => _TrendingHomeScreenState();
}

class _TrendingHomeScreenState extends State<TrendingHomeScreen> {
  late Future<News> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
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
        body: FutureBuilder<News>(
          future: futureNews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.separated(
                      itemCount: 22,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.network(
                              snapshot.data!.value[index]['image']['url']),
                          title: Text(snapshot.data!.value[index]['name']),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
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
        ));
  }
}
