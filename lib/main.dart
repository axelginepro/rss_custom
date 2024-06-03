import 'package:flutter/material.dart';
import 'controller/home_controller.dart';
import 'package:intl/date_symbol_data_local.dart';




void main() {
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(MyApp());});
}

class MyAppColors {
  static final darkBlue = Color(0xFF1E1E2C);
  static final lightBlue = Color(0xFF2D2D44);
}

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: MyAppColors.lightBlue,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    primaryColor: MyAppColors.darkBlue,
    brightness: Brightness.dark,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flux RSS Homemade',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: MyAppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home:  HomeController(),
    );
  }
}

