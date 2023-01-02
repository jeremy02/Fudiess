import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';

import '../../../components/list_scroll_to_index.dart';
import '../../../utils/responsive.dart';
import '../models/menu_list_index_changed.dart';
import '../models/menu_tab_items.dart';
import '../models/menu_tabs.dart';
import 'menu_bar.dart';
import 'menu_bar_indicator.dart';
import 'menu_page_views.dart';
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
        child: MenuPageViews(
          scrollController: widget.scrollController,
          pageController: _pageController,
          activeMenuTabIndex: widget.activeMenuTabIndex,
          menuTabsList: widget.menuTabsList,
          menuTabMenuItemsList: widget.menuTabMenuItemsList,
          parentOnMenuTabSelected: onMenuTabSelected,
        ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            MenuBarIndicator(
              key: UniqueKey(),
              activeMenuTabIndex: widget.activeMenuTabIndex,
              menuTabsList: widget.menuTabsList,
            ),
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
        child: MenuPageViews(
          scrollController: widget.scrollController,
          pageController: _pageController,
          activeMenuTabIndex: widget.activeMenuTabIndex,
          menuTabsList: widget.menuTabsList,
          menuTabMenuItemsList: widget.menuTabMenuItemsList,
          parentOnMenuTabSelected: onMenuTabSelected,
        ),
      ),
    ];
  }
}