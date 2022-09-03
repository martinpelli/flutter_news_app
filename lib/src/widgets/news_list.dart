import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> articles;

  const NewsList({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(article: articles[index], index: index);
      },
    );
  }
}

class _New extends StatelessWidget {
  final Article article;
  final int index;

  const _New({Key? key, required this.article, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(article: article, index: index),
        _TitleCard(
          article: article,
        ),
        _ImageCard(article: article),
        _BodyCard(article: article),
        _ButtonsCard(),
        SizedBox(
          height: 10,
        ),
        Divider()
      ],
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: myTheme.colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(
          width: 10,
        ),
        RawMaterialButton(
          onPressed: () {},
          fillColor: myTheme.colorScheme.error,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.more),
        )
      ],
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article article;

  const _BodyCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(article.description ?? ''),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article article;

  const _ImageCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: article.urlToImage != null
              ? FadeInImage(placeholder: const AssetImage('assets/giphy.gif'), image: NetworkImage(article.urlToImage!))
              : const Image(image: AssetImage('assets/no-image.png')),
        ),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article article;

  const _TitleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article article;
  final int index;

  const _TopBarCard({
    Key? key,
    required this.article,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: myTheme.colorScheme.secondary),
          ),
          Text(
            '${article.source.name}',
          )
        ],
      ),
    );
  }
}
