import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/responsive.dart';

class AppFooterSection extends StatelessWidget {
  const AppFooterSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      AnimatedContainer(
        constraints: BoxConstraints(
          minHeight: Responsive.isMobile(context) ? 450 : 600,
          maxWidth: kMaxWidth,
        ),
        decoration: const BoxDecoration(
          color: kBackgroundColor,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }
}