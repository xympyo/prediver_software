import 'package:flutter/material.dart';
import 'package:prediver/pages/input_page.dart';
import 'package:prediver/shared/theme.dart';
import 'package:prediver/widget/main_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 52,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            Text(
              'Feeling unwell?',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
              overflow: TextOverflow.visible,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '“Am I having a Fever?”\nInput your information now,\nand let our Artificial\nIntelligence predicts it!',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
                Container(
                  height: 176,
                  width: 124,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/doc1.png',
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget whiteContainer() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 660,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultRadius),
              topRight: Radius.circular(defaultRadius),
            ),
          ),
        ),
      );
    }

    Widget circle() {
      return Container(
        width: 280,
        height: 280,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/circle.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget cardContainer() {
      return Container(
        height: 160,
        width: double.infinity,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 272,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: const [
            MainCard(
              imageUrl: 'assets/images/image1.png',
              firstText: 'Prediver.',
              secondText: 'Now Prediver is\navailable for Fever\nservices',
            ),
            MainCard(
              imageUrl: 'assets/images/image2.png',
              firstText: 'Check your fever\nNow!',
              secondText: "It won't hurt, won't it?",
            ),
          ],
        ),
      );
    }

    Widget mainCard() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        height: 280,
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 458,
        ),
        decoration: BoxDecoration(
          color: kDarkGreenColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  height: 166,
                  width: 124,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/doc2.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Let us help!',
                        style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        "Share your temperature, and we'll provide instant insights to help you stay safe and informed.",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                        overflow: TextOverflow.visible,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                ),
                child: Text(
                  'Input Now',
                  style: greenTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget bottomNavContainer() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 40,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            color: kDarkerWhiteColor,
          ),
          child: Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/icon_hospital.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kDarkGreenColor,
      body: Stack(
        children: [
          circle(),
          whiteContainer(),
          header(),
          cardContainer(),
          mainCard(),
          bottomNavContainer(),
        ],
      ),
    );
  }
}
