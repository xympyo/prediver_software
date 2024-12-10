import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prediver/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/main-page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreenColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 228,
              height: 320,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/doc3.png',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Prediver',
            style: whiteTextStyle.copyWith(
              fontSize: 32,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Predict your Fever.',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: regular,
            ),
          )
        ],
      ),
    );
  }
}
