import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import 'components/members_section_card_layout.dart';

class AppMemberSection extends StatelessWidget {
  const AppMemberSection({
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
        padding: EdgeInsets.only(
          left: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
          right: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              kDefaultPadding * 0.75,
            ),
            color: Colors.white,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastLinearToSlowEaseIn,
        child: Stack(
          children: [
            const MembersSectionCardLayout(),
            Responsive.isMobile(context) ? Container() : const Positioned(
              top: kDefaultPadding,
              left: kDefaultPadding,
              child: Image(
                width: kDefaultPadding * 1.5,
                height: kDefaultPadding * 1.5,
                fit: BoxFit.contain,
                image: AssetImage(
                  'assets/images/member_section/ic_top_left.png',
                ),
              ),
            ),
            Responsive.isMobile(context) ? Container() : const Positioned(
              left: kDefaultPadding * 0.5,
              bottom: kDefaultPadding * 0.5,
              child: Image(
                width: kDefaultPadding * 1.5,
                height: kDefaultPadding * 1.5,
                fit: BoxFit.contain,
                image: AssetImage(
                  'assets/images/member_section/ic_bottom_left.png',
                ),
              ),
            ),
            Responsive.isMobile(context) ? Container() : const Positioned(
              bottom: kDefaultPadding / 5,
              right: 0,
              left: 0,
              child: Image(
                width: kDefaultPadding,
                height: kDefaultPadding,
                fit: BoxFit.contain,
                image: AssetImage(
                  'assets/images/member_section/ic_bottom_center.png',
                ),
              ),
            ),
            Responsive.isMobile(context) ? Container() : const Positioned(
              top: kDefaultPadding * 0.5,
              right: kDefaultPadding * 0.5,
              child: Image(
                width: kDefaultPadding * 1.5,
                height: kDefaultPadding * 1.5,
                fit: BoxFit.contain,
                image: AssetImage(
                  'assets/images/member_section/ic_top_right.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
