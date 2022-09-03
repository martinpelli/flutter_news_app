import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/category_models.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

const String _URL_NEWS = "https://newsapi.org/v2";
const String _API_KEY = "8f9faf3b4b2046abb3cc3c8fb76d6087";

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, "business"),
    Category(FontAwesomeIcons.tv, "entertainment"),
    Category(FontAwesomeIcons.addressCard, "general"),
    Category(FontAwesomeIcons.headSideVirus, "health"),
    Category(FontAwesomeIcons.vials, "science"),
    Category(FontAwesomeIcons.volleyball, "sports"),
    Category(FontAwesomeIcons.memory, "technology"),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    _getTopHeadlines();

    categories.forEach((item) {
      categoryArticles[item.name] = [];
    });
  }

  String get selectedCategory => _selectedCategory;

  List<Article> get selectedCategoryArticles => categoryArticles[selectedCategory]!;

  set selectedCategory(String value) {
    _selectedCategory = value;
    _getArticlesByCategory(value);
    notifyListeners();
  }

  void _getTopHeadlines() async {
    const String url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=ar';
    final response = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromMap(response.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  _getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category]!;
    }

    String url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=ar&category=$category';
    final response = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromMap(response.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
