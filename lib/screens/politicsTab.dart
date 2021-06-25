import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:check_my_news/model/newsClass.dart';
import 'package:check_my_news/services/backend.dart';

class Politics extends StatefulWidget {
  const Politics({Key? key}) : super(key: key);

  @override
  _PoliticsState createState() => _PoliticsState();
}

class _PoliticsState extends State<Politics> {
  late Future<News> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchCategoryNews("Politics");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
      future: futureNews,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          snapshot.data!.value[index]['image']['thumbnail']
                              ['contentUrl'],
                        ),
                        title: Text(snapshot.data!.value[index]['name']),
                        subtitle:
                            Text(snapshot.data!.value[index]['description']),
                        onTap: () async {
                          String _url = snapshot.data!.value[index]['url'];
                          await canLaunch(_url)
                              ? await launch(_url, forceWebView: true)
                              : throw 'Could not launch $_url';
                        },
                      ),
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
    );
  }
}
