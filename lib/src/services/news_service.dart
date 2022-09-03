import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const String _URL_NEWS = "https://newsapi.org/v2";
const String _API_KEY = "8f9faf3b4b2046abb3cc3c8fb76d6087";

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    _getTopHeadlines();
  }

  void _getTopHeadlines() async {
    const String url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=ar';
    final response = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromMap(response.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
