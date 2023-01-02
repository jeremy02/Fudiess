import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import '../../components/rich_text_title.dart';

class AppTestimonialsSection extends StatelessWidget {
  const AppTestimonialsSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        constraints: BoxConstraints(
          minHeight: Responsive.isMobile(context) ? 450 : 600,
          maxWidth: kMaxWidth,
        ),
        padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding * 0.5,
          horizontal: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
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
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 2.5 : kDefaultPadding * 5,
            ),
            Flex(
              direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: Responsive.isMobile(context) ? 0 : Responsive.isTablet(context) ? 3 : 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Responsive.isMobile(context) ? 0 : kDefaultPadding,
                      bottom: Responsive.isMobile(context) ? 0 : kDefaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const RichTextTitle(
                          text: "Customer Testimonial",
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          textColor: kPrimaryColor,
                          alignStart: true,
                          textScaleFactor: 0.0,
                        ),
                        SizedBox(
                          height: Responsive.isMobile(context) ? kDefaultPadding * .5 : kDefaultPadding * .75,
                        ),
                        RichTextTitle(
                          text: "What ",
                          fontSize: Responsive.isMobile(context) ? 22 : Responsive.isTablet(context) ? 32 : 36,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                          alignStart: true,
                          coloredText: "Customers",
                          coloredTextColor: kPrimaryColor,
                          coloredTextFontSize: Responsive.isMobile(context) ? 22 : Responsive.isTablet(context) ? 32 : 36,
                          coloredTextFontWeight: FontWeight.bold,
                          textScaleFactor: 1.40,
                        ),
                        RichTextTitle(
                          text: "Say About Us",
                          fontSize: Responsive.isMobile(context) ? 22 : Responsive.isTablet(context) ? 32 : 36,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                          alignStart: true,
                          textScaleFactor: 1.40,
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: Responsive.isMobile(context) ? 0 : Responsive.isTablet(context) ? 5 : 3,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 2.5 : kDefaultPadding * 5,
            ),
          ],
        ),
      ),
    );
  }
}
