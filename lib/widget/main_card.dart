import 'package:flutter/material.dart';
import 'package:prediver/shared/theme.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;
  final String firstText;
  final String secondText;
  const MainCard({
    super.key,
    required this.imageUrl,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLighterGreenColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firstText,
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    secondText,
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                  )
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: kDarkGreenColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
