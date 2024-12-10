import 'package:flutter/material.dart';
import 'package:prediver/pages/main_page.dart';
import 'package:prediver/pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/main-page': (context) => const MainPage(),
      },
    );
  }
}
