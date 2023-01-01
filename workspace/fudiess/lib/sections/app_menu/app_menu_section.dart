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
  List<MenuTabItems> _menuTabMenuItemsList = [];

  // forward and back buttons active state
  int _menuTabMenuItemsListIndex = 0;

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
    _menuTabMenuItemsList = _menuTabItemsController.menuTabItems.where((i) => i.menuTabId == selectedMenuTabId).toList();

    super.initState();
  }

  void menuTabMenuItemsListScrollToIndex(bool isForward) {
    int calculatedListIndex = (_menuTabMenuItemsListIndex * 0.5).floor();
    int nextScrollIndex = (calculatedListIndex < 0) ? 0 : calculatedListIndex;
    bool isScroll = true;

    if(isForward) {
      calculatedListIndex = calculatedListIndex + 1;
      if(((calculatedListIndex * 2) + 1) <= (_menuTabMenuItemsList.length - 1)) {  // the next item that can be scrolled can allow scroll to +two items
        nextScrollIndex = (calculatedListIndex * 2) + 1;
      } else {
        if(((calculatedListIndex * 2)) == (_menuTabMenuItemsList.length - 1)) { // the next item that can be scrolled is only +one item
          nextScrollIndex = (calculatedListIndex * 2);
        } else {
          isScroll = false;
        }
      }
    } else {
      calculatedListIndex = calculatedListIndex - 1;
      if(calculatedListIndex < 0) {
        nextScrollIndex = 0;
        isScroll = false;
      }else{
        nextScrollIndex = calculatedListIndex <=0 ? 0 : (calculatedListIndex * 2) + 1;
      }
    }

    if(isScroll){
      setState(() {
        _menuTabMenuItemsListIndex = nextScrollIndex;
      });
      _scrollController.listScrollToIndex(index: calculatedListIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        constraints: const BoxConstraints(
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
            _buildMenuSectionContentLayout(context),
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
                    bgColor: _menuTabMenuItemsListIndex - 1 <= 0 ? Colors.white : kPrimaryColor,
                    padding: kDefaultPadding * 0.70,
                    radius: kDefaultPadding*0.75,
                    elevation: 2.0,
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 22,
                      color: _menuTabMenuItemsListIndex - 1 <= 0 ? kDarkBlackColor : Colors.white,
                    ),
                    buttonPress: () {
                      menuTabMenuItemsListScrollToIndex(false);
                    }
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                ForwardBackButton(
                    bgColor: _menuTabMenuItemsListIndex + 1 <= (_menuTabMenuItemsList.length - 1) ? kPrimaryColor : Colors.white,
                    padding: kDefaultPadding * 0.70,
                    radius: kDefaultPadding*0.75,
                    elevation: 2.0,
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 22,
                      color: _menuTabMenuItemsListIndex + 1 <= (_menuTabMenuItemsList.length - 1) ? Colors.white : kDarkBlackColor,
                    ),
                    buttonPress: () {
                      menuTabMenuItemsListScrollToIndex(true);
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

  Widget _buildMenuSectionContentLayout(BuildContext context) {
    return NotificationListener<MenuListIndexChanged>(
        child: MenuSectionMenuLayout(
            scrollController: _scrollController,
            activeMenuTabIndex: activeMenuTabIndex,
            menuTabsList: _menuTabsList,
            menuTabMenuItemsList: _menuTabMenuItemsList
        ),
        onNotification: (res) {
          setState(() {
            activeMenuTabIndex = res.selectedMenuTabIndex;
            _menuTabMenuItemsList = _menuTabItemsController.menuTabItems.where((i) => i.menuTabId == res.selectedMenuTabId).toList();
            _menuTabMenuItemsListIndex = 0;
          });
          return true;
        }
    );
  }
}
