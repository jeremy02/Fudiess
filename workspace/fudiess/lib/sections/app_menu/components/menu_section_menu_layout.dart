import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:get/get.dart';

import '../../../components/custom_scroll_behavior.dart';
import '../../../components/list_scroll_to_index.dart';
import '../../../utils/responsive.dart';
import '../models/menu_tabs.dart';
import 'menu_tab_indicator_item.dart';
import 'menu_tab_item.dart';

const double borderRadius = 25.0;

class MenuSectionMenuLayout extends StatefulWidget {
  const MenuSectionMenuLayout({Key? key}) : super(key: key);

  @override
  _MenuSectionMenuLayoutState createState() => _MenuSectionMenuLayoutState();
}

class _MenuSectionMenuLayoutState extends State<MenuSectionMenuLayout> with SingleTickerProviderStateMixin {

  final PageController _pageController = PageController();
  int activePageIndex = 0;
  final MenuTabsController _controller = Get.put(MenuTabsController());
  int activeMenuTabIndex = 0;

  final ScrollToIndexController _scrollController = ScrollToIndexController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void onMenuTabSelected(int menuTabIndex, bool isScroll) {
    setState(() {
      activeMenuTabIndex = menuTabIndex;
    });
    if(isScroll) {
      FocusScope.of(context).requestFocus(FocusNode());
      _pageController.animateToPage(menuTabIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List menuTabsList = _controller.orderSteps;

    return SizedBox(
      height: 240,
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildMenuBar(context, menuTabsList),
                    SizedBox(
                      width: Responsive.isTablet(context) ? kDefaultPadding : kDefaultPadding * 2,
                    ),
                    _buildMenuBarIndicator(context, menuTabsList),
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
              child: _buildMenuPageViews(context, menuTabsList),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context, List menuTabsList) {
    return Expanded(
        child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _scrollController.listScrollToIndex(index: 0);
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              _scrollController.listScrollToIndex(index: 3);
            },
          ),

          Column(
              children: menuTabsList.map<MenuTabItem>((item) =>
                  MenuTabItem(
                      key: UniqueKey(),
                      name: item.name,
                      imagePath: item.imagePath,
                      onSelectedMenuTab: (){
                        onMenuTabSelected(menuTabsList.indexOf(item), true);
                      },
                      isActive: activeMenuTabIndex == menuTabsList.indexOf(item)
                  )
              ).toList()
          ),
        ]
        )
    );
  }

  Widget _buildMenuBarIndicator(BuildContext context, List menuTabsList) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        kDefaultPadding,
      ),
      child: Container(
        width: kDefaultPadding * 0.30,
        color: kBgColor,
        child: Column(
            children: menuTabsList.map<MenuTabIndicatorItem>((item) =>
                MenuTabIndicatorItem(
                    key: UniqueKey(),
                    isActive: activeMenuTabIndex == menuTabsList.indexOf(item)
                )
            ).toList()
        ),
      ),
    );
  }

  Widget _buildMenuPageViews(BuildContext context, List menuTabsList) {
    
    return PageView(
      controller: _pageController,
      physics: const ClampingScrollPhysics(),
      onPageChanged: (int menuSelectedIndex) {
        onMenuTabSelected(menuTabsList[menuSelectedIndex], false);
      },
      children: menuTabsList.map<ConstrainedBox>((item) =>
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: ListScrollToIndex(
                      controller: _scrollController,            // ScrollToIndexController
                      scrollDirection: Axis.horizontal,   // default Axis.vertical
                      itemCount: menuTabsList.length,                     // itemCount
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
                            child: Center(child: Text(constraints.maxWidth.toString() + ':::' + menuTabsList[index].name, style: TextStyle(fontSize: 14, color: Colors.black54),)),
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