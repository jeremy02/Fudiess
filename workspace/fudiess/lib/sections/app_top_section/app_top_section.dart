import 'package:flutter/material.dart';
import 'package:fudiess/sections/app_bar/custom_app_bar.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import 'components/food_companies_component.dart';
import 'components/top_section_main_component.dart';

class AppTopSection extends StatelessWidget {
  const AppTopSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {

    double calculatedWidth = screenSize.width;
    double calculatedHeight = screenSize.height;

    double minTopSectionHeight = Responsive.isMobile(context) ? 700 : 700;

    // if isDesktop
    if (Responsive.isDesktop(context)) {
      calculatedWidth = calculatedWidth * 0.45;
    }

    // if isTablet
    if (Responsive.isTablet(context)) {
      calculatedWidth = calculatedWidth * 0.45;
    }

    // if mobile
    if (Responsive.isMobile(context)) {
      calculatedWidth = calculatedWidth * 1.5;
    }

    calculatedHeight = calculatedHeight <= minTopSectionHeight ? minTopSectionHeight : calculatedHeight;

    return SafeArea(
      child: Stack(
        children: [
          AnimatedContainer(
            constraints: BoxConstraints(
              minHeight: minTopSectionHeight,
              maxWidth: kMaxWidth,
              maxHeight: calculatedHeight
            ),
            height: calculatedHeight,
            margin: const EdgeInsets.only(
              bottom: kDefaultPadding * 3.5,
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomAppBar(),
                SizedBox(
                  height: Responsive.isDesktop(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
                ),
                TopSectionMainComponent(
                  key: UniqueKey(),
                  width: calculatedWidth,
                  height: calculatedHeight,
                ),
                SizedBox(
                  height: Responsive.isDesktop(context) ? kDefaultPadding * 5 : kDefaultPadding * 2,
                ),
              ],
            ),
          ),
          FoodCompaniesComponent(
            key: UniqueKey(),
            calculatedWidth: calculatedWidth,
          )
        ],
      ),
    );
  }
}
