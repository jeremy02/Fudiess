import 'package:flutter/material.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class OrderSectionTitleLayout extends StatelessWidget {
  const OrderSectionTitleLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          alignStart: false,
          coloredText: "in Just 30 \n Minutes",
          coloredTextColor: Colors.black,
          textScaleFactor: 1.5,
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        RichTextTitle(
          text: "By clicking on 3 steps",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          textColor: kTextSecondaryColor,
          alignStart: Responsive.isMobile(context) ? false : true,
          textScaleFactor: 1.5,
        ),
      ],
    );
  }
}