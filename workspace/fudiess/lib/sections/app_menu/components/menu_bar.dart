import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';
import '../models/menu_tabs.dart';
import 'menu_section_menu_layout.dart';
import 'menu_section_tab_item.dart';

class MenuBar extends StatefulWidget {
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
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) ?
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                kDefaultPadding
            ),
            color: kBgColor
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.menuTabsList.map<MenuSectionTabItem>((item) =>
              MenuSectionTabItem(
                key: UniqueKey(),
                name: item.name,
                imagePath: item.imagePath,
                onSelectedMenuTab: (){
                  widget.parentOnMenuTabSelected(widget.menuTabsList.indexOf(item), true, item.id);
                },
                isActive: widget.activeMenuTabIndex == widget.menuTabsList.indexOf(item),
                borderRadius: BorderRadius.circular(
                  kDefaultPadding * 1.15,
                ),
                menuPadding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding * 0.5,
                  horizontal: kDefaultPadding * 0.80,
                ),
              )
          ).toList(),
        ),
      )
          :
      Expanded(
        child: Column(
            children: widget.menuTabsList.map<MenuSectionTabItem>((item) =>
                MenuSectionTabItem(
                  key: UniqueKey(),
                  name: item.name,
                  imagePath: item.imagePath,
                  onSelectedMenuTab: (){
                    widget.parentOnMenuTabSelected(widget.menuTabsList.indexOf(item), true, item.id);
                  },
                  isActive: widget.activeMenuTabIndex == widget.menuTabsList.indexOf(item),
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding * 0.60,
                  ),
                  menuPadding: const EdgeInsets.all(
                      kDefaultPadding * 0.30
                  ),
                )
            ).toList()
        ),
      );
  }
}