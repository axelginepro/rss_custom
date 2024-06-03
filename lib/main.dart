import 'package:flutter/material.dart';
import 'controller/home_controller.dart';
import 'package:intl/date_symbol_data_local.dart';



void main() {
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flux RSS Homemade',
      theme: ThemeData(brightness: Brightness.light,useMaterial3: true, primaryColor: Colors.orange),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomeController(),
    );
  }
}

