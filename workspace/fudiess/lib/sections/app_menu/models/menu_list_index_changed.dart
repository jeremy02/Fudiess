import 'package:flutter/material.dart';

import 'menu_tab_items.dart';

class MenuListIndexChanged extends Notification {
  final int selectedMenuTabIndex;
  final int selectedMenuTabId;
  final List<MenuTabItems> selectedMenuTabItems;
  MenuListIndexChanged(this.selectedMenuTabIndex, this.selectedMenuTabId, this.selectedMenuTabItems);
}