import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:get/get.dart';

import '../../../components/custom_scroll_behavior.dart';
import '../../../components/list_scroll_to_index.dart';
import '../../../utils/responsive.dart';
import '../controllers/menu_tab_items_controller.dart';
import '../controllers/menu_tabs_controller.dart';
import '../models/menu_list_index_changed.dart';
import '../models/menu_tab_items.dart';
import 'menu_section_tab_item.dart';
import 'menu_tab_indicator_item.dart';

const double borderRadius = 25.0;

class MenuSectionMenuLayout extends StatefulWidget {
  const MenuSectionMenuLayout({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollToIndexController scrollController;

  @override
  _MenuSectionMenuLayoutState createState() => _MenuSectionMenuLayoutState();
}

class _MenuSectionMenuLayoutState extends State<MenuSectionMenuLayout> with SingleTickerProviderStateMixin {

  final PageController _pageController = PageController();
  final MenuTabsController _menuTabController = Get.put(MenuTabsController());
  final MenuTabItemsController _menuTabItemsController = Get.put(MenuTabItemsController());
  int activeMenuTabIndex = 0;
  List _menuTabsList = [];
  List<MenuTabItems> _menuTabMenuItems = [];

  @override
  void dispose() {
    _pageController.dispose();
    _menuTabController.dispose();
    _menuTabItemsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _menuTabsList = _menuTabController.menuTabs;
    int selectedMenuTabId = _menuTabsList[activeMenuTabIndex].id;
    _menuTabMenuItems = _menuTabItemsController.menuTabItems.where((i) => i.menuTabId == selectedMenuTabId).toList();
    MenuListIndexChanged(activeMenuTabIndex, selectedMenuTabId, _menuTabMenuItems).dispatch(context);
    super.initState();
  }

  void onMenuTabSelected(int selectedMenuTabIndex, bool isScroll, int selectedMenuId) {
    if(activeMenuTabIndex != selectedMenuTabIndex) {
      setState(() {
        activeMenuTabIndex = selectedMenuTabIndex;
        _menuTabMenuItems = _menuTabItemsController.menuTabItems.where((i) => i.menuTabId == selectedMenuId).toList();
      });

      if(isScroll) {
        FocusScope.of(context).requestFocus(FocusNode());
        _pageController.animateToPage(selectedMenuTabIndex,
            duration: const Duration(milliseconds: 500), curve: Curves.decelerate);

        // pass the selected menu index back to parent widget
        MenuListIndexChanged(selectedMenuTabIndex, selectedMenuId, _menuTabMenuItems).dispatch(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 240,
        maxHeight: 260
      ),
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildMenuBar(context),
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
          ],
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Expanded(
        child: Column(
          children: _menuTabsList.map<MenuSectionTabItem>((item) =>
              MenuSectionTabItem(
                  key: UniqueKey(),
                  name: item.name,
                  imagePath: item.imagePath,
                  onSelectedMenuTab: (){
                    onMenuTabSelected(_menuTabsList.indexOf(item), true, item.id);
                  },
                  isActive: activeMenuTabIndex == _menuTabsList.indexOf(item)
              )
          ).toList()
        ),
    );
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
            children: _menuTabsList.map<MenuTabIndicatorItem>((item) =>
                MenuTabIndicatorItem(
                    key: UniqueKey(),
                    isActive: activeMenuTabIndex == _menuTabsList.indexOf(item)
                )
            ).toList()
        ),
      ),
    );
  }

  Widget _buildMenuPageViews(BuildContext context) {
    
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (int menuSelectedIndex) {
        onMenuTabSelected(menuSelectedIndex, false, _menuTabsList[menuSelectedIndex].id);
      },
      children: _menuTabsList.map<ConstrainedBox>((item) =>

          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: ListScrollToIndex(
                      controller: widget.scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _menuTabsList.length,
                      itemWidth: constraints.maxWidth,
                      itemHeight: constraints.maxHeight,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: constraints.maxWidth / 2.08,
                          margin: EdgeInsets.only( // no margin if its the last item
                            left: index == 0 ? 0 : (Responsive.isTablet(context) ? kDefaultPadding * 0.70 : kDefaultPadding * 1.25),
                          ),
                          color: Colors.purpleAccent,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 6.0, bottom: 2.0),
                            child: Center(child: Text(constraints.maxWidth.toString() + ':::' + _menuTabsList[index].name, style: TextStyle(fontSize: 14, color: Colors.black54),)),
                          ),
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