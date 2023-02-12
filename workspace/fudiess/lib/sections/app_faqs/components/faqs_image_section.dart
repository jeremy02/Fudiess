import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';

class FaqsImageSection extends StatelessWidget {

  const FaqsImageSection({
    required this.constraints,
    Key? key,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) ?
    Container()
    :
    Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: constraints.maxWidth * .5,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Responsive.isDesktop(context) ? 50 : 20,
                    right: Responsive.isDesktop(context) ? 50 : 20,
                  ),
                  child: Image.asset(
                    'assets/images/faqs/ic_faqs_bg_2.png',
                    height: constraints.maxHeight * 0.75,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: Responsive.isDesktop(context) ? 100 : 60,
                  ),
                  child: Image.asset(
                    'assets/images/faqs/ic_faqs_bg_1.png',
                    height: constraints.maxHeight * 0.75,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: Responsive.isDesktop(context) ? 100 : 10,
        ),
      ],
    );
  }
}