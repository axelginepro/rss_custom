import 'package:flutter/material.dart';
import 'package:france_bleu_rss/modele/article.dart';
import 'package:france_bleu_rss/modele/feed_parser.dart';
import 'package:france_bleu_rss/vue/list_view.dart';

class FeedController extends StatelessWidget {
  const FeedController({super.key, required this.url});

  final String url;

  @override

  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: FeedParser().getFeed(url),
      builder: ((context, snapshot) => ListVue(articles: snapshot.data ?? []) ) 
    );
  }
}
