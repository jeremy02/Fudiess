import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class TopSectionMain extends StatelessWidget {
  const TopSectionMain({
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
                  Expanded(
                      flex: 3,
                      child: topContainerImageLayout(context)
                  ),
                  SizedBox(
                    height: Responsive.isMobile(context) ? kDefaultPadding : 0,
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                          alignment: Responsive.isMobile(context) ? Alignment.center :  Alignment.centerLeft,
                          margin: EdgeInsets.only(
                            left: Responsive.isMobile(context) ? kDefaultPadding*0.8 : 0,
                            right: Responsive.isMobile(context) ? kDefaultPadding*0.8 : kDefaultPadding * 2,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: Responsive.isMobile(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: Responsive.isMobile(context) ? TextAlign.center : TextAlign.start,
                                text: TextSpan(
                                  text: 'Fastest &',
                                  style: TextStyle(
                                    fontSize: Responsive.isMobile(context) ? 40 : 48,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    height: 1.0,
                                  ),
                                ),
                              ),
                              RichText(
                                textAlign: Responsive.isMobile(context) ? TextAlign.center : TextAlign.start,
                                text: const TextSpan(
                                  text: 'Cheapest',
                                  style: TextStyle(
                                    fontSize: 48,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Food',
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                        ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ),
                  ),
                ],
              ),
        ),
    );
  }

  // this displays the top containers image
  Widget topContainerImageLayout(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FractionallySizedBox(
            heightFactor: Responsive.isMobile(context) ? 1 : 0.75,
            widthFactor: 0.75,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: height > width ? BoxFit.fill : BoxFit.contain,
                  image: AssetImage(
                      "assets/images/ic_top_section_main_1x.png",
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // this displays the top containers text layout
  Widget topContainerTextLayout(BuildContext context) {
    return Align(
      alignment: Responsive.isMobile(context) ? Alignment.centerLeft : Alignment.center,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Opacity(
            opacity: Responsive.isMobile(context) ? .1 : 1.0,
            child: Container(
              height: Responsive.isMobile(context)
                  ? constraints.maxHeight - 50
                  : constraints.maxHeight,
              width: Responsive.isMobile(context)
                  ? constraints.maxWidth - 100
                  : constraints.maxWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: Responsive.isDesktop(context)
                      ? BoxFit.fitHeight
                      : BoxFit.contain,
                  image: AssetImage("assets/images/ic_top_section_main_1x.png"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}