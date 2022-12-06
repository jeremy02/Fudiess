import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import 'components/footer_section_about_fudiess_layout.dart';

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
        constraints: const BoxConstraints(
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
        child: Padding(
          padding: EdgeInsets.only(
            top: Responsive.isMobile(context)
                ? kDefaultPadding * 4
                : kDefaultPadding * 8,
            bottom: Responsive.isMobile(context)
                ? kDefaultPadding * 2
                : kDefaultPadding * 4,
            left: Responsive.isMobile(context)
                ? kDefaultPadding
                : kDefaultPadding * 2,
            right: Responsive.isMobile(context)
                ? kDefaultPadding
                : kDefaultPadding * 2,
          ),
          child: Responsive.isMobile(context) ? _buildFooterMobileLayout(
              context) : _buildFooterLayout(context),
        ),
      ),
    );
  }

  Widget _buildFooterMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Flexible(
              flex: 1,
              child: FooterSectionAboutFoodiesLayout(),
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.yellow,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildFooterLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Flexible(
          flex: 1,
          child: FooterSectionAboutFoodiesLayout(),
        ),
        const SizedBox(
          width: kDefaultPadding * 2,
        ),
        Flexible(
          flex: 2,
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
