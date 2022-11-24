import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import '../../components/rich_text_title.dart';

class AppOrderSection extends StatelessWidget {
  const AppOrderSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return SafeArea(
      child:
      AnimatedContainer(
        constraints: BoxConstraints(
          minHeight: Responsive.isMobile(context) ? 450 : 600,
        ),
        height: screenHeight,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastLinearToSlowEaseIn,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding,
            horizontal: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: kDefaultPadding,
              ),
              _orderSectionTitleLayout(context),
              const SizedBox(
                height: kDefaultPadding,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _orderSectionTitleLayout(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichTextTitle(
          text: "Order ",
          fontSize: Responsive.isMobile(context) ? 22 : 30,
          fontWeight: FontWeight.bold,
          textColor: kPrimaryColor,
          alignStart: Responsive.isMobile(context) ? false : true,
          coloredText: "in Just 30 ",
          coloredTextColor: Colors.black,
          textScaleFactor: 1.2,
        ),
        RichTextTitle(
          text: " Minutes ",
          fontSize: Responsive.isMobile(context) ? 22 : 30,
          fontWeight: FontWeight.bold,
          textColor: Colors.black,
          alignStart: Responsive.isMobile(context) ? false : true,
          textScaleFactor: 1.2,
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        RichTextTitle(
          text: "By clicking on 3 steps",
          fontSize: 12,
          fontWeight: FontWeight.bold,
          textColor: kTextSecondaryColor,
          alignStart: Responsive.isMobile(context) ? false : true,
          textScaleFactor: 1.0,
        ),
      ],
    );
  }
}
