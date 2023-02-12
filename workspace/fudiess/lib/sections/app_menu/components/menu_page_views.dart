import 'package:flutter/material.dart';

import '../../../components/custom_scroll_behavior.dart';
import '../../../components/list_scroll_to_index.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';
import '../models/menu_tab_items.dart';
import '../models/menu_tabs.dart';
import 'menu_card_item.dart';
import 'menu_section_menu_layout.dart';

class MenuPageViews extends StatelessWidget {
  const MenuPageViews({
    Key? key,
    required this.scrollController,
    required this.pageController,
    required this.activeMenuTabIndex,
    required this.menuTabsList,
    required this.menuTabMenuItemsList,
    required this.parentOnMenuTabSelected,
  }) : super(key: key);

  final ScrollToIndexController scrollController;
  final PageController pageController;
  final int activeMenuTabIndex;
  final List <MenuTabs> menuTabsList;
  final List <MenuTabItems> menuTabMenuItemsList;
  final ParentOnMenuTabSelectedCallback parentOnMenuTabSelected;

  @override
  Widget build(BuildContext context) {

    final doubleListMarginSpacing = (Responsive.isDesktop(context) ? kDefaultPadding * 1.75 : kDefaultPadding * 0.70);

    return PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int menuSelectedIndex) {
          parentOnMenuTabSelected(menuSelectedIndex, false, menuTabsList[menuSelectedIndex].id);
        },
        children: menuTabsList.map<ConstrainedBox>((item) =>
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return ScrollConfiguration(
                      behavior: CustomScrollBehavior(),
                      child: ListScrollToIndex(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemHorizontalMargin: doubleListMarginSpacing,
                        itemCount: menuTabMenuItemsList.length,
                        itemWidth: constraints.maxWidth,
                        itemHeight: constraints.maxHeight,
                        itemBuilder: (BuildContext context, int index) {
                          return MenuCardItem(
                            menuItem: menuTabMenuItemsList[index],
                            itemWidth: ((constraints.maxWidth) / 2) - (doubleListMarginSpacing / 2),
                            itemLeftMargin: index == 0 ? 0 : doubleListMarginSpacing,
                            press: () => (index) {

                            },
                            key: UniqueKey(),
                          );
                        },
                      ),
                    );
                  }
              ),
            ),
        ).toList()
    );
  }
}