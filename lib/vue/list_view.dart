import 'package:flutter/material.dart';
import 'package:france_bleu_rss/modele/article.dart';
import 'package:france_bleu_rss/vue/tile_view.dart';

class ListVue extends StatelessWidget {
  const ListVue({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((context, index) => TileView(article: articles[index])),
      separatorBuilder: ((context, index) => const Divider()),
      itemCount: articles.length,
    );
  }
}
