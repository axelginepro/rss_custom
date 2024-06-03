import 'package:flutter/material.dart';
import 'package:france_bleu_rss/modele/article.dart';
import 'package:france_bleu_rss/vue/description_text.dart';
import 'package:france_bleu_rss/vue/image_view.dart';
import 'package:france_bleu_rss/vue/my_padd.dart';
import 'package:france_bleu_rss/vue/title_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailController extends StatelessWidget {
  const DetailController({super.key,required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padd(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleText(title: article.title),
              ),
              const Padd(),
              ImageView(imageUrl: article.imageUrl),
              const Padd(),
              const Divider(),
              const Padd(),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: DescriptionText(description: article.description),
              ),
              const Padd(),
              ElevatedButton(
                  onPressed: handleToWeb,
                  child: const Text("Vers l'article complet",style: TextStyle(color: Colors.orange)))
            ],
          )
        ),
      )
    );

  }

  handleToWeb() async {
    final Uri url = Uri.parse(article.link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
