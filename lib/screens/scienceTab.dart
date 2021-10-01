import 'package:check_my_news/injector.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:check_my_news/model/newsClass.dart';
import 'package:check_my_news/services/news/newsServices.dart';

class Science extends StatefulWidget {
  const Science({Key? key}) : super(key: key);

  @override
  _ScienceState createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
 
  final newsServices = injector<NewsServices>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
      future: newsServices.fetchCategoryNews("ScienceAndTechnology"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    setState(() {});
                    return Future.delayed(
                      const Duration(milliseconds: 500),
                    );
                  },
                  child: ListView.separated(
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: snapshot.data!.value[index]['image'] != null
                              ? Image.network(
                                  snapshot.data!.value[index]['image']
                                      ['thumbnail']['contentUrl'],
                                )
                              : Image.asset(
                                  'assets/n.png',
                                  height: 120,
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
