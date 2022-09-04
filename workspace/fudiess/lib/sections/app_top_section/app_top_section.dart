import 'package:flutter/material.dart';
import 'package:fudiess/sections/app_bar/custom_app_bar.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

class AppTopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;

    double calculatedHeight = sizes.width;

    // if isDesktop
    if (Responsive.isDesktop(context)) {
      calculatedHeight = calculatedHeight * 0.45;
    }

    // if isTablet
    if (Responsive.isTablet(context)) {
      calculatedHeight = calculatedHeight * 0.60;
    }

    // if mobile
    if (Responsive.isMobile(context)) {
      calculatedHeight = calculatedHeight * 1.5;
    }

    return SafeArea(
      child: Stack(
        children: [
          AnimatedContainer(
            height: calculatedHeight,
            margin: const EdgeInsets.only(
              bottom: kDefaultPadding * 2,
            ),
            decoration: const BoxDecoration(
              color: kBackgroundColor,
            ),
            duration: const Duration(
              milliseconds: 500,
            ),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomAppBar(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Your Text here \n With new text Your Text here \n With new text",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
