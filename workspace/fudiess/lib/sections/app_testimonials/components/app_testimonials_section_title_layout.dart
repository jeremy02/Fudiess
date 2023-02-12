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
    return Flexible(
      flex: Responsive.isMobile(context) ? 0: 2,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Responsive.isMobile(context) ? 0 : kDefaultPadding,
                ),
                RichTextTitle(
                  text: "Customer Testimonials",
                  fontSize: Responsive.isMobile(context) ? 12 : 14,
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
                Padding(
                  padding: EdgeInsets.only(
                    right: Responsive.isMobile(context) ? 0 : kDefaultPadding, // helps in affecting the responsive text scale factor
                  ),
                  child: RichTextTitle(
                    text: "What ",
                    fontSize: Responsive.isMobile(context) ? 22 : 30,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black,
                    alignStart: true,
                    coloredText: "Customers",
                    coloredTextColor: kPrimaryColor,
                    coloredTextFontSize: Responsive.isMobile(context) ? 22 : 30,
                    coloredTextFontWeight: FontWeight.bold,
                    textScaleFactor: 0.0,
                    isResponsiveText: true, // Text not responsive if is desktop
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: Responsive.isDesktop(context) ? kDefaultPadding * 3 : kDefaultPadding * 2, // helps in affecting the responsive text scale factor
                  ),
                  child: RichTextTitle(
                    text: "Say About Us",
                    fontSize: Responsive.isMobile(context) ? 22 : 30,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black,
                    alignStart: true,
                    textScaleFactor: 0.0,
                    isResponsiveText: true, // Text not responsive if is desktop
                  ),
                ),
                SizedBox(
                  height: Responsive.isMobile(context) ? kDefaultPadding * .5 : kDefaultPadding * .75,
                ),
                RichTextTitle(
                  text: Responsive.isMobile(context) ? "We are happy when customers\n are too" : "We are happy when customers are too",
                  fontSize: Responsive.isMobile(context) ? 12 : 14,
                  fontWeight: FontWeight.normal,
                  textColor: kTextSecondaryColor,
                  alignStart: true,
                  coloredText: null,
                  coloredTextColor: null,
                  textScaleFactor: 1.5,
                ),
                const SizedBox(
                  height: kDefaultPadding * .5,
                ),
                FractionallySizedBox(
                  widthFactor: Responsive.isDesktop(context) ? 0.5 : 0.8,
                  alignment: Alignment.centerLeft,
                  child: LayoutBuilder(
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
                ),
                SizedBox(
                  height: Responsive.isMobile(context) ? kDefaultPadding * 1.5 : kDefaultPadding,
                ),
              ],
            ),
          ),
          Flexible(
            flex: Responsive.isMobile(context) ? 1 : 0,
            child: Container(

            ),
          ),
        ],
      ),
    );
  }
}