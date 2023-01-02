import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/responsive.dart';

class AppTestimonialsSectionTitleLayout extends StatelessWidget {
  const AppTestimonialsSectionTitleLayout({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Flexible(
      flex: Responsive.isMobile(context) ? 0 : 2,
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
              fontSize: 10,
              fontWeight: FontWeight.normal,
              textColor: kPrimaryColor,
              alignStart: true,
              textScaleFactor: 0,
            ),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * .5 : kDefaultPadding * .75,
            ),
            RichTextTitle(
              text: "What ",
              fontSize: Responsive.isMobile(context) ? 22 : 30,
              fontWeight: FontWeight.bold,
              textColor: Colors.black,
              alignStart: true,
              coloredText: "Customer",
              coloredTextColor: kPrimaryColor,
              coloredTextFontSize: Responsive.isMobile(context) ? 22 : 30,
              coloredTextFontWeight: FontWeight.bold,
              textScaleFactor: 0,
            ),
          ],
        ),
      ),
    );
  }
}