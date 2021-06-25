import 'package:flutter/material.dart';
import 'package:check_my_news/model/newsClass.dart';
import 'package:check_my_news/services/backend.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  late Future<News> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchCategoryNews("Business");
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
