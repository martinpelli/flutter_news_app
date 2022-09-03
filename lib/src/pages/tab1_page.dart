import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/services/news_service.dart';
import 'package:flutter_news_app/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);

    return Scaffold(body: NewsList(articles: newsService.headlines));
  }
}
