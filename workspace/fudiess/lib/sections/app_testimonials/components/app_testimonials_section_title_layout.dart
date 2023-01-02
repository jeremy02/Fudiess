import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';

import '../../../components/default_button.dart';
import '../../../components/rich_text_title.dart';
import '../../../utils/responsive.dart';

class AppTestimonialsSectionTitleLayout extends StatelessWidget {
  const AppTestimonialsSectionTitleLayout({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: Responsive.isMobile(context) ? 0 : kDefaultPadding,
        ),
        const RichTextTitle(
          text: "Customer Testimonials",
          fontSize: 12,
          fontWeight: FontWeight.normal,
          textColor: kPrimaryColor,
          alignStart: true,
          coloredText: null,
          coloredTextColor: null,
          textScaleFactor: 1.5,
        ),
        SizedBox(
          height: Responsive.isMobile(context) ? kDefaultPadding * .5 : kDefaultPadding * .75,
        ),
        RichTextTitle(
          text: "What ",
          fontSize: Responsive.isMobile(context) ? 22 : Responsive.isTablet(context) ? 30 : 36,
          fontWeight: FontWeight.bold,
          textColor: Colors.black,
          alignStart: true,
          coloredText: "Customers",
          coloredTextColor: kPrimaryColor,
          coloredTextFontSize: Responsive.isMobile(context) ? 22 : Responsive.isTablet(context) ? 30 : 36,
          coloredTextFontWeight: FontWeight.bold,
          textScaleFactor: 1.40,
        ),
        RichTextTitle(
          text: "Say About Us",
          fontSize: Responsive.isMobile(context) ? 22 : Responsive.isTablet(context) ? 30 : 36,
          fontWeight: FontWeight.bold,
          textColor: Colors.black,
          alignStart: true,
          textScaleFactor: 1.40,
        ),
        SizedBox(
          height: Responsive.isMobile(context) ? kDefaultPadding * .5 : kDefaultPadding * .75,
        ),
        RichTextTitle(
          text: Responsive.isMobile(context) ? "We are happy when customers\n are too" : "We are happy when customers are too",
          fontSize: 12,
          fontWeight: FontWeight.bold,
          textColor: kTextSecondaryColor,
          alignStart: true,
          coloredText: null,
          coloredTextColor: null,
          textScaleFactor: 1.5,
        ),
        SizedBox(
          height: Responsive.isMobile(context) ? kDefaultPadding * .25 : kDefaultPadding * .5,
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return DefaultButton(
              buttonText: "Read More",
              fontSize: 14.0,
              buttonPadding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context) ? kDefaultPadding * 1.5 : kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              fontWeight: FontWeight.normal,
              buttonPress: () => {},
              buttonWidth: Responsive.isMobile(context) ? constraints.maxWidth * 0.20 : Responsive.isTablet(context) ? constraints.maxWidth * 0.50 : constraints.maxWidth * 0.40,
            );
          },
        ),
        SizedBox(
          height: Responsive.isMobile(context) ? kDefaultPadding * 1.5 : kDefaultPadding,
        ),
      ],
    );
  }
}