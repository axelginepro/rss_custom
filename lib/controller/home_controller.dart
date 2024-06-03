import 'package:flutter/material.dart';
import 'package:france_bleu_rss/controller/feed_controller.dart';
import '../modele/rss_type.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {

  List<RssType> types = [
    RssType(url: "https://www.cnews.fr/rss.xml", name: "Actualités"),
    RssType(
        url: "https://dwh.lequipe.fr/api/edito/rss?path=/", name: "L'Equipe"),
    RssType(
        url: "https://www.radiofrance.fr/francemusique/rss",
        name: "Musique"),
    RssType(url: "https://www.jeuxvideo.com/rss/rss.xml", name: "Gaming"),
  ];

  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

        length: types.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Mes flux RSS',
                  style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w800, color: Colors.black, fontSize: 30)),
            ),
            actions: [
              /*IconButton(
                icon: Icon(_isDarkMode ? Icons.lightbulb_outline : Icons.lightbulb),
                onPressed: () {
                  setState(() {
                    _isDarkMode = !_isDarkMode;
                  });
                },
              ),*/
            ],
            bottom: TabBar(
              tabs: types.map((type) => FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Tab(text: type.name)))
                  .toList(),
              labelColor: Colors.lightBlue,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(fontSize: 12.0),
              labelStyle:
                  const TextStyle(fontFamily: 'Montserrat', fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.deepOrange.withOpacity(0.5),
          ),
          body: TabBarView(
            children:
                types.map((type) => FeedController(url: type.url)).toList(),
          ),
        )
      );
  }


  Widget buildModeToggle() {
    return IconButton(
      icon: Icon(_isDarkMode ? Icons.lightbulb_outline : Icons.lightbulb),
      onPressed: () {
        setState(() {
          _isDarkMode = !_isDarkMode;
        });
      },
    );
  }

}
