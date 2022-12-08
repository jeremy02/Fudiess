import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

class AppFAQsSection extends StatelessWidget {
  const AppFAQsSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    double calculatedWidth = screenSize.width;
    double calculatedHeight = screenSize.height;

    return SafeArea(
      child: AnimatedContainer(
        constraints: BoxConstraints(
          minHeight: Responsive.isMobile(context) ? 450 : 600,
          maxWidth: kMaxWidth,
        ),
        height: calculatedHeight,
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
