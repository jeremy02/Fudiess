import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';
import '../models/menu_tabs.dart';
import 'menu_section_menu_layout.dart';
import 'menu_section_tab_item.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({
    Key? key,
    required this.activeMenuTabIndex,
    required this.menuTabsList,
    required this.parentOnMenuTabSelected,
  }) : super(key: key);

  final int activeMenuTabIndex;
  final List <MenuTabs> menuTabsList;
  final ParentOnMenuTabSelectedCallback parentOnMenuTabSelected;

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) ?
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                kDefaultPadding
            ),
            color: kBgColor
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildMenuBarTabWidgets(context),
        ),
      )
          :
      Expanded(
        child: Column(
            children: _buildMenuBarTabWidgets(context),
        ),
      );
  }

  List <Widget> _buildMenuBarTabWidgets(BuildContext context) {
    return menuTabsList.map<MenuSectionTabItem>((item) =>
        MenuSectionTabItem(
          key: UniqueKey(),
          name: item.name,
          imagePath: item.imagePath,
          onSelectedMenuTab: (){
            parentOnMenuTabSelected(menuTabsList.indexOf(item), true, item.id);
          },
          isActive: activeMenuTabIndex == menuTabsList.indexOf(item),
          borderRadius: BorderRadius.circular(
            Responsive.isMobile(context) ? kDefaultPadding * 1.15 : kDefaultPadding * 0.60,
          ),
          menuPadding: EdgeInsets.symmetric(
            vertical: Responsive.isMobile(context) ? kDefaultPadding * 0.30 : kDefaultPadding * 0.30,
            horizontal: Responsive.isMobile(context) ? kDefaultPadding * 0.80 : kDefaultPadding * 0.30,
          ),
        )
    ).toList();
  }
}