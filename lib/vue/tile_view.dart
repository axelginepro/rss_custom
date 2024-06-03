import 'package:flutter/material.dart';
import 'package:france_bleu_rss/controller/detail_controller.dart';
import 'package:france_bleu_rss/modele/article.dart';
import 'package:france_bleu_rss/vue/date_row.dart';
import 'package:france_bleu_rss/vue/description_text.dart';
import 'package:france_bleu_rss/vue/image_view.dart';
import 'package:france_bleu_rss/vue/title_text.dart';

class TileView extends StatelessWidget {

  final Article article;
  const TileView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final route = MaterialPageRoute(builder: (context) => DetailController(article: article));
        Navigator.push(context, route);
      },
      child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              DateRow(date: article.date),
              ImageView(imageUrl: article.imageUrl),
              TitleText(title: article.title),
              const Padding(padding: EdgeInsets.only(top:10)),
              DescriptionText(description: article.description)
            ],
          )
      ),
    );
  }
}
