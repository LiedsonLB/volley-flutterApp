import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutterprojeto_3/pages/home_page/home_page.dart';

void main() {
  // mostrar grades de distancias dos widgets
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class AppColors {
  static const Color colorBlue = Color(0xFF00ADC3);
  static const Color colorDarkBlue = Color(0xFF2B4A8E);
  static const Color colorLightRed = Color(0xFFF77859);
  static const Color colorWhite = Color(0xFFC2F2F8);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoVolley Scoreboard',
      theme: ThemeData(
        primaryColor: AppColors.colorBlue,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorBlue),
        fontFamily: "ConcertOne",
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'NeoVolley Scoreboard'),
    );
  }
}