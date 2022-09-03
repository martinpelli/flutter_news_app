import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';

class NewsList extends StatelessWidget {
  final List<Article> articles;

  const NewsList({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(articles[0].title);
      },
    );
  }
}
