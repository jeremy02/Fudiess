import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import '../../components/view_more_button.dart';
import 'components/app_articles_content_layout.dart';
import 'components/app_articles_title_layout.dart';

class AppArticlesSection extends StatelessWidget {
  const AppArticlesSection({
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
          vertical: 0,
          horizontal: Responsive.isMobile(context) ? 10 : 40,
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          children: [
            const AppArticlesTitleLayout(),
            const AppArticlesContentLayout(),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 3,
            ),
            const ViewMoreMenuButton(
              buttonText: 'More Articles',
            ),
          ],
        ),
      ),
    );
  }
}