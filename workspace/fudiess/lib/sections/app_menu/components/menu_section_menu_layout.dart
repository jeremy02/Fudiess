import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';

import '../../../components/custom_scroll_behavior.dart';
import '../../../components/list_scroll_to_index.dart';
import '../../../utils/responsive.dart';
import '../models/menu_list_index_changed.dart';
import '../models/menu_tab_items.dart';
import '../models/menu_tabs.dart';
import 'menu_bar.dart';
import 'menu_card_item.dart';
import 'menu_tab_indicator_item.dart';
import 'more_menu_button.dart';

typedef ParentOnMenuTabSelectedCallback = void Function(int selectedMenuTabIndex, bool isScroll, int selectedMenuId);

class MenuSectionMenuLayout extends StatefulWidget {
  const MenuSectionMenuLayout({
    Key? key,
    required this.scrollController,
    required this.activeMenuTabIndex,
    required this.menuTabsList,
    required this.menuTabMenuItemsList,
  }) : super(key: key);

  final ScrollToIndexController scrollController;
  final int activeMenuTabIndex;
  final List <MenuTabs> menuTabsList;
  final List <MenuTabItems> menuTabMenuItemsList;

  @override
  MenuSectionMenuLayoutState createState() => MenuSectionMenuLayoutState();
}

class MenuSectionMenuLayoutState extends State<MenuSectionMenuLayout> with SingleTickerProviderStateMixin {

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void onMenuTabSelected(int selectedMenuTabIndex, bool isScroll, int selectedMenuId) {
    if(widget.activeMenuTabIndex != selectedMenuTabIndex) {
      if(isScroll) {
        FocusScope.of(context).requestFocus(FocusNode());
        _pageController.animateToPage(selectedMenuTabIndex,
            duration: const Duration(milliseconds: 500), curve: Curves.decelerate);

        // pass the selected menu index back to parent widget
        MenuListIndexChanged(selectedMenuTabIndex, selectedMenuId).dispatch(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: Responsive.isMobile(context) ? 350 : 260,
        maxHeight: Responsive.isMobile(context) ? 400 : 260
      ),
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        child: Flex(
          direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
          children: Responsive.isMobile(context) ? _buildMobileMenuWidgets(context) : _buildDesktopTabletMenuWidgets(context),
        ),
      ),
    );
  }

  List <Widget> _buildMobileMenuWidgets(BuildContext context) {
    return [
      MenuBar(
        key: UniqueKey(),
        activeMenuTabIndex: widget.activeMenuTabIndex,
        menuTabsList: widget.menuTabsList,
        parentOnMenuTabSelected: onMenuTabSelected,
      ),
      const SizedBox(
        height: kDefaultPadding,
      ),
      Expanded(
        child: _buildMenuPageViews(context),
      ),
      const SizedBox(
        height: kDefaultPadding,
      ),
      const MoreMenuButton(),
    ];
  }

  List <Widget> _buildDesktopTabletMenuWidgets(BuildContext context) {
    return [
      Flexible(
        flex: 2,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MenuBar(
              key: UniqueKey(),
              activeMenuTabIndex: widget.activeMenuTabIndex,
              menuTabsList: widget.menuTabsList,
              parentOnMenuTabSelected: onMenuTabSelected,
            ),
            SizedBox(
              width: Responsive.isTablet(context) ? kDefaultPadding : kDefaultPadding * 2,
            ),
            _buildMenuBarIndicator(context),
            SizedBox(
              width: Responsive.isTablet(context) ? kDefaultPadding : kDefaultPadding * 2,
            ),
          ],
        ),
      ),
      SizedBox(
        width: Responsive.isTablet(context) ? 0 : kDefaultPadding * 2,
      ),
      Flexible(
        flex: 3,
        child: _buildMenuPageViews(context),
      ),
    ];
  }

  Widget _buildMenuBarIndicator(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        kDefaultPadding,
      ),
      child: Container(
        width: kDefaultPadding * 0.30,
        color: kBgColor,
        child: Column(
            children: widget.menuTabsList.map<MenuTabIndicatorItem>((item) =>
                MenuTabIndicatorItem(
                    key: UniqueKey(),
                    isActive: widget.activeMenuTabIndex == widget.menuTabsList.indexOf(item)
                )
            ).toList()
        ),
      ),
    );
  }

  Widget _buildMenuPageViews(BuildContext context) {
    final doubleListMarginSpacing = (Responsive.isDesktop(context) ? kDefaultPadding * 1.75 : kDefaultPadding * 0.70);

    return PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int menuSelectedIndex) {
          onMenuTabSelected(menuSelectedIndex, false, widget.menuTabsList[menuSelectedIndex].id);
        },
        children: widget.menuTabsList.map<ConstrainedBox>((item) =>
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return ScrollConfiguration(
                      behavior: CustomScrollBehavior(),
                      child: ListScrollToIndex(
                        controller: widget.scrollController,
                        scrollDirection: Axis.horizontal,
                        itemHorizontalMargin: doubleListMarginSpacing,
                        itemCount: widget.menuTabMenuItemsList.length,
                        itemWidth: constraints.maxWidth,
                        itemHeight: constraints.maxHeight,
                        itemBuilder: (BuildContext context, int index) {
                          return MenuCardItem(
                            menuItem: widget.menuTabMenuItemsList[index],
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