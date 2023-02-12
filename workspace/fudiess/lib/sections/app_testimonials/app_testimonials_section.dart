import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import 'components/app_testimonials_section_content_layout.dart';
import 'components/app_testimonials_section_title_layout.dart';

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
        constraints: const BoxConstraints(
          maxWidth: kMaxWidth,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: Responsive.isMobile(context) ? 10 : 40,
        ),
        decoration: const BoxDecoration(
          color: kBackgroundColor,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 2 : kDefaultPadding * 4,
            ),
            Flex(
              direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: Responsive.isMobile(context) ? MainAxisAlignment.start : MainAxisAlignment.spaceEvenly,
              children: [
                AppTestimonialsSectionTitleLayout(
                    key: UniqueKey()
                ),
                SizedBox(
                  width: Responsive.isMobile(context) ? 0 : kDefaultPadding,
                ),
                AppTestimonialsSectionContentLayout(
                    key: UniqueKey()
                ),
              ],
            ),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 2.5 : kDefaultPadding * 4,
            ),
          ],
        ),
      ),
    );
  }
}