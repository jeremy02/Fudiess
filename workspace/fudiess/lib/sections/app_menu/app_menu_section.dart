import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import '../../components/forward_back_button.dart';
import '../../components/list_scroll_to_index.dart';
import '../../components/rich_text_title.dart';
import 'components/menu_section_menu_layout.dart';
import 'models/menu_list_index_changed.dart';

class AppMenuSection extends StatelessWidget {
  AppMenuSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  final ScrollToIndexController _scrollController = ScrollToIndexController();

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMenuSectionHeaderLayout(context),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 0.8,
            ),
            if(Responsive.isTablet(context) || Responsive.isDesktop(context))
              const RichTextTitle(
                text: "Our menu which is popular lately.",
                fontSize: 12,
                fontWeight: FontWeight.normal,
                textColor: kTextSecondaryColor,
                alignStart: true,
                coloredText: null,
                coloredTextColor: null,
                textScaleFactor: 1.5,
              ),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 0.8,
            ),
            NotificationListener<MenuListIndexChanged>(
                child: MenuSectionMenuLayout(
                  scrollController: _scrollController,
                ),
                onNotification: (n) {
                  print(n.selectedMenuTabIndex.toString());
                  print(n.selectedMenuTabId.toString());
                  print(n.selectedMenuTabItems.toString());
                  return true;
                }
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSectionHeaderLayout(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichTextTitle(
          text: "Menu ",
          fontSize: Responsive.isMobile(context) ? 22 : 30,
          fontWeight: FontWeight.bold,
          textColor: kPrimaryColor,
          alignStart: true,
          coloredText: "That Make\nYou Fall In Love",
          coloredTextColor: Colors.black,
          textScaleFactor: 1.5,
        ),
        const Spacer(),
        Responsive.isMobile(context) ? Container()
            :
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ForwardBackButton(
                bgColor: Colors.white,
                padding: kDefaultPadding * 0.70,
                radius: kDefaultPadding*0.75,
                elevation: 2.0,
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 22,
                  color: kDarkBlackColor,
                ),
                buttonPress: () {
                  print('uko fiti');
                }
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            ForwardBackButton(
              bgColor: kPrimaryColor,
              padding: kDefaultPadding * 0.70,
              radius: kDefaultPadding*0.75,
              elevation: 2.0,
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 22,
                color: Colors.white,
              ),
              buttonPress: () {
                print('uko fiti');
              }
            ),
          ],
        ),
      ],
    );
  }
}
