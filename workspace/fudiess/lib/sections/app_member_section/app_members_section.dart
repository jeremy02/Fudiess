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
          left: Responsive.isMobile(context) ? 10 : 40,
          right: Responsive.isMobile(context) ? 10 : 40,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
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
            Responsive.isMobile(context) ? Container() : Positioned(
              top: 20,
              left: 20,
              child: _buildMemberStackImageWidget(context, null, null, 'assets/images/member_section/ic_top_left.png'),
            ),
            Responsive.isMobile(context) ? Container() : Positioned(
              left: 10,
              bottom: 10,
              child: _buildMemberStackImageWidget(context, null, null, 'assets/images/member_section/ic_bottom_left.png'),
            ),
            Responsive.isMobile(context) ? Container() : Positioned(
              bottom: 4,
              right: 0,
              left: 0,
              child: _buildMemberStackImageWidget(context, 20, 20, 'assets/images/member_section/ic_bottom_center.png'),
            ),
            Responsive.isMobile(context) ? Container() : Positioned(
              top: 10,
              right: 10,
              child: _buildMemberStackImageWidget(context, null, null, 'assets/images/member_section/ic_top_right.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberStackImageWidget(BuildContext context, double? width, double? height, String imagePath) {
    return Image(
      width: width ?? 30,
      height: height ?? 30,
      fit: BoxFit.contain,
      image: AssetImage(
        imagePath,
      ),
    );
  }
}
