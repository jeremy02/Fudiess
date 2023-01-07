import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/responsive.dart';

class AppArticlesTitleLayout extends StatelessWidget {
  const AppArticlesTitleLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String captionText = 'Open repair of infrarenal aortic anuerysm or dissection,\nplus repair of associated arterial trauma.';
    if(Responsive.isMobile(context)) {
      captionText = 'Open repair of infrarenal aortic \nanuerysm or dissection.';
    }

    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Responsive.isMobile(context) ?  40 :  60,
        ),
        const RichTextTitle(
          text: "Article",
          fontSize: 14,
          fontWeight: FontWeight.normal,
          textColor: kPrimaryColor,
          alignStart: false,
          textScaleFactor: 1.0,
        ),
        const SizedBox(
          height: 10,
        ),
        RichTextTitle(
          text: "Recent ",
          fontSize: Responsive.isMobile(context) ? 30 : 40,
          fontWeight: FontWeight.bold,
          textColor: Colors.black,
          alignStart: false,
          coloredText: "Post",
          coloredTextColor: kPrimaryColor,
          textScaleFactor: 1.5,
          isResponsiveText: false,
        ),
        const SizedBox(
          height: 10,
        ),
        RichTextTitle(
          text: captionText,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          textColor: kTextSecondaryColor,
          alignStart: false,
          textScaleFactor: 1.5,
        ),
        SizedBox(
          height: Responsive.isMobile(context) ?  10 :  60,
        ),
      ],
    );
  }
}