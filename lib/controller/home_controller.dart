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
        name: "France Musique"),
    RssType(url: "https://www.jeuxvideo.com/rss/rss.xml", name: "Gaming"),
  ];

/*  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }// Debug print
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: types.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Mes flux RSS',
                style: TextStyle(color: Colors.white)),
            /*actions: [
              IconButton(
                icon: Icon(
                  _themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
                ),
                onPressed: _toggleTheme,
              ),
            ],*/
            bottom: TabBar(
              isScrollable: true,
              tabs: types.map((type) => FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Tab(text: type.name)))
                  .toList(),
              labelColor: Colors.lightBlue,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(fontSize: 12.0),
              labelStyle:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.deepOrangeAccent,
          ),
          body: TabBarView(
            children:
                types.map((type) => FeedController(url: type.url)).toList(),
          ),

        )
      );
  }
}
