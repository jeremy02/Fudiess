import 'package:flutter/material.dart';
import 'package:fudiess/components/rich_text_title.dart';
import 'package:fudiess/sections/app_top_section/components/top_section_discount_text_button.dart';

import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class TopSectionMainComponent extends StatelessWidget {
  const TopSectionMainComponent({
    required Key key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {

    Duration duration = const Duration(milliseconds: 200);

    return Expanded(
        child: AnimatedContainer(
              duration: duration,
              width: double.infinity,
              height: double.infinity,
              child: Flex(
                direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _topContainerImageLayout(context, 2),
                  _topContainerTextLayout(context, 3),
                ],
              ),
        ),
    );
  }

  // this displays the top containers image
  Widget _topContainerImageLayout(BuildContext context, int weight) {
    return Expanded(
          flex: weight,
          child: 1 == 1 ?
          Image.asset(
            'assets/images/ic_top_section_main_1x.png',
            height: height * 0.7,
            scale: 0.9,
          )
              :
          Align(
              alignment: Alignment.centerLeft,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                      return Image.asset(
                        "assets/images/ic_top_section_main_1x.png",
                        width: Responsive.isMobile(context) ? width * 0.5 : width * 0.60,
                        height: Responsive.isMobile(context) ? width * 0.5 : width * 0.60,
                        fit: height > 450 ? BoxFit.fill : BoxFit.fitHeight,
                      );
                  },
              ),
          )
      );
  }

  // this displays the top containers text layout
  Widget _topContainerTextLayout(BuildContext context, int weight) {
    String captionText =
        "Open repair of infrarenal aortic \nanuerysm or dissection, plus repair.";

    if (Responsive.isMobile(context)) {
        captionText = "Open repair of infrarenal \naortic anuerysm or \n dissection.";
    }

    return Expanded(
        flex: weight,
        child: Container(
            alignment: Responsive.isMobile(context) ? Alignment.center :  Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: Responsive.isMobile(context) ? kDefaultPadding : 0,
              right: Responsive.isMobile(context) ? kDefaultPadding : kDefaultPadding * 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: Responsive.isMobile(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                if (!Responsive.isMobile(context))
                  TopSectionDiscountTextButton(),
                if (!Responsive.isMobile(context))
                  const SizedBox(
                      height: kDefaultPadding,
                  ),
                RichTextTitle(
                    text: "Fastest & \nCheapest ",
                    fontSize: Responsive.isMobile(context) ? 30 : 40,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black,
                    alignStart: Responsive.isMobile(context) ? false : true,
                    coloredText: "Food",
                    coloredTextColor: kPrimaryColor,
                    textScaleFactor: 1.5,
                ),
                RichTextTitle(
                  text: "is in Your Hand",
                  fontSize: Responsive.isMobile(context) ? 30 : 40,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.black,
                  alignStart: Responsive.isMobile(context) ? false : true,
                  textScaleFactor: 1.5,
                ),
                SizedBox(
                  height: Responsive.isMobile(context) ? kDefaultPadding / 1.5 : kDefaultPadding,
                ),
                RichTextTitle(
                  text: captionText,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: kTextSecondaryColor,
                  alignStart: Responsive.isMobile(context) ? false : true,
                  textScaleFactor: 1.2,
                ),
                SizedBox(
                  height: Responsive.isMobile(context) ? kDefaultPadding * 0.8 : 0,
                ),
                if (Responsive.isMobile(context))
                  TopSectionDiscountTextButton(),
              ],
            ),
        ),
    );
  }
}