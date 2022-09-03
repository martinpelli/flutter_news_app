import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/category_models.dart';
import 'package:flutter_news_app/src/services/news_service.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'package:flutter_news_app/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
        body: Column(children: [
      _CategoriesList(categories: newsService.categories),
      Expanded(child: NewsList(articles: newsService.selectedCategoryArticles))
    ]));
  }
}

class _CategoriesList extends StatelessWidget {
  final List<Category> categories;

  const _CategoriesList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final String categoryName = categories[index].name;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              _CategoryButton(category: categories[index]),
              const SizedBox(
                height: 5,
              ),
              Text('${categoryName[0].toUpperCase()}${categoryName.substring(1)}')
            ]),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;
  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: (() {
        newsService.selectedCategory = category.name;
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 40,
        height: 40,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: newsService.selectedCategory != category.name ? Colors.black54 : myTheme.colorScheme.error,
        ),
      ),
    );
  }
}
