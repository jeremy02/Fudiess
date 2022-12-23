import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

import '../../components/forward_back_button.dart';
import '../../components/list_scroll_to_index.dart';
import '../../components/rich_text_title.dart';
import 'components/menu_section_menu_layout.dart';
import 'controllers/menu_tab_items_controller.dart';
import 'controllers/menu_tabs_controller.dart';
import 'models/menu_list_index_changed.dart';
import 'models/menu_tab_items.dart';
import 'models/menu_tabs.dart';


class AppMenuSection extends StatefulWidget {
  const AppMenuSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _AppMenuSectionState createState() => _AppMenuSectionState();
}
class _AppMenuSectionState extends State<AppMenuSection> {

  final ScrollToIndexController _scrollController = ScrollToIndexController();
  final MenuTabsController _menuTabController = Get.put(MenuTabsController());
  final MenuTabItemsController _menuTabItemsController = Get.put(MenuTabItemsController());
  int activeMenuTabIndex = 0;
  List <MenuTabs>_menuTabsList = [];
  List<MenuTabItems> _menuTabMenuItems = [];

  @override
  void dispose() {
    _menuTabController.dispose();
    _menuTabItemsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _menuTabsList = _menuTabController.menuTabs;
    int selectedMenuTabId = _menuTabsList[activeMenuTabIndex].id;
    _menuTabMenuItems = _menuTabItemsController.menuTabItems.where((i) => i.menuTabId == selectedMenuTabId).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            NotificationListener<MenuListIndexChanged>(
                child: MenuSectionMenuLayout(
                  scrollController: _scrollController,
                  activeMenuTabIndex: activeMenuTabIndex,
                  menuTabsList: _menuTabsList,
                  menuTabMenuItemsList: _menuTabMenuItems
                ),
                onNotification: (res) {
                  setState(() {
                    activeMenuTabIndex = res.selectedMenuTabIndex;
                    _menuTabMenuItems = _menuTabItemsController.menuTabItems.where((i) => i.menuTabId == res.selectedMenuTabId).toList();
                  });
                  return true;
                }
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSectionHeaderLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                      print('uko fiti>>>>' + activeMenuTabIndex.toString());
                      print('uko fiti>>>>' + _menuTabMenuItems.length.toString());
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
                      print('uko fiti::::' + activeMenuTabIndex.toString());
                      print('uko fiti::::' + _menuTabMenuItems.length.toString());
                    }
                ),
              ],
            ),
          ],
        ),
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
      ],
    );
  }
}
