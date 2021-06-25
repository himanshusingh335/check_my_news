import 'package:flutter/material.dart';
import 'package:check_my_news/model/newsClass.dart';
import 'package:check_my_news/services/backend.dart';

class India extends StatefulWidget {
  const India({Key? key}) : super(key: key);

  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  late Future<News> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchCategoryNews("India");
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
                    return ListTile(
                      leading: Image.network(snapshot.data!.value[index]
                          ['image']['thumbnail']['contentUrl']),
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
}
