import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../models/menu_tabs.dart';
import 'menu_tab_indicator_item.dart';

class MenuBarIndicator extends StatelessWidget {
  const MenuBarIndicator({
    Key? key,
    required this.activeMenuTabIndex,
    required this.menuTabsList,
  }) : super(key: key);

  final int activeMenuTabIndex;
  final List <MenuTabs> menuTabsList;

  @override
  Widget build(BuildContext context) {
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
}