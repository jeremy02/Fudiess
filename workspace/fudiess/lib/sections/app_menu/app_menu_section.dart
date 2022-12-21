import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import 'components/menu_section_menu_layout.dart';

class AppMenuSection extends StatelessWidget {
  const AppMenuSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    double calculatedWidth = screenSize.width;
    double calculatedHeight = screenSize.height;

    return SafeArea(
      child: AnimatedContainer(
        constraints: BoxConstraints(
          minHeight: Responsive.isMobile(context) ? 450 : 600,
          maxWidth: kMaxWidth,
        ),
        padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding * 0.5,
          horizontal: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
        child: Column(
          children: const [
            MenuSectionMenuLayout()
          ],
        ),
      ),
    );
  }

  Widget _buildDeskTopMenuLayout(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.yellow,
          ),
        ),
        Flexible(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
