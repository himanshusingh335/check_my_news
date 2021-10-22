import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Creates a card widget that displays News Data
class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.cardNews,
  }) : super(key: key);

  final Map<dynamic, dynamic> cardNews;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: cardNews['image'] != null
            ? Image.network(
                cardNews['image']['thumbnail']['contentUrl'],
              )
            : Image.asset(
                'assets/n.png',
                height: 120,
              ),
        title: Text(cardNews['name']),
        subtitle: Text(cardNews['description']),
        onTap: () async {
          String _url = cardNews['url'];
          await canLaunch(_url)
              ? await launch(_url, forceWebView: true)
              : throw 'Could not launch $_url';
        },
        onLongPress: () async {
          // copy url to the clipboard
          await FlutterClipboard.copy(cardNews['url']);
          // show snackbar to the user
          SnackBar snackbar = SnackBar(
            content: Text("News url copied to the clipboard"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
      ),
    );
  }
}
