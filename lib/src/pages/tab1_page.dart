import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:flutter_news_app/src/services/news_service.dart';
import 'package:flutter_news_app/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final List<Article> headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
        body: headlines.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : NewsList(articles: headlines));
  }

  @override
  bool get wantKeepAlive => true;
}
