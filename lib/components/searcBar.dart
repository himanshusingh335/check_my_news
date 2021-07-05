import 'package:flutter/material.dart';

import 'package:check_my_news/model/newsClass.dart';
import 'package:check_my_news/services/backend.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<News>(
      future: fetchSearchedNews(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: snapshot.data!.value[index]['image'] != null
                          ? Image.network(
                              snapshot.data!.value[index]['image']['thumbnail']
                                  ['contentUrl'],
                            )
                          : Image.asset(
                              'assets/n.png',
                              height: 120,
                            ),
                      title: Text(snapshot.data!.value[index]['name']),
                      subtitle:
                          Text(snapshot.data!.value[index]['description']),
                      isThreeLine: true,
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Icon(
        Icons.search,
        size: 100,
        color: Colors.blue,
      ),
    );
  }
}
