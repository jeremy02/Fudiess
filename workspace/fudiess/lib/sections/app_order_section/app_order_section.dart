import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import 'components/order_section_steps_layout.dart';
import 'components/order_section_title_layout.dart';

class AppOrderSection extends StatelessWidget {
  const AppOrderSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      AnimatedContainer(
        constraints: const BoxConstraints(
          maxWidth: kMaxWidth,
        ),
        padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding * 0.5,
          horizontal: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastLinearToSlowEaseIn,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const OrderSectionTitleLayout(),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding : kDefaultPadding * 2,
            ),
            const OrderSectionStepsLayout(),
          ],
        ),
      ),
    );
  }
}
