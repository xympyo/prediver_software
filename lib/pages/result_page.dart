import 'package:flutter/material.dart';
import 'package:prediver/shared/global.dart';
import 'package:prediver/shared/theme.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreenColor,
      body: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 64,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  'Your result is here',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 224,
                  height: 280,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/doc3.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Prediver detected that you have',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      fever_probability,
                      style: whiteTextStyle.copyWith(
                        fontSize: 40,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        Text(
                          'chance\nto have a fever',
                          style: whiteTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text(
                      "But you probably don't!\nWe are about",
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: regular,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          no_fever_probability,
                          style: whiteTextStyle.copyWith(
                            fontSize: 40,
                            fontWeight: bold,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          children: [
                            Text(
                              "sure that\nyou don't have a fever",
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  bottom: 32,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kWhiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                  ),
                  child: Text(
                    'Go Back',
                    style: greenTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
