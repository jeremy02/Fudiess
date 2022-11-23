import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class FoodCompanyItem extends StatelessWidget {
  const FoodCompanyItem({
    required Key key,
    required this.title,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.press,
  }) : super(key: key);

  final String title;
  final String imagePath;
  final double width;
  final double height;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Duration duration = const Duration(milliseconds: 200);

    return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 0.8),
          child: AnimatedContainer(
            duration: duration,
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
    );
  }
}