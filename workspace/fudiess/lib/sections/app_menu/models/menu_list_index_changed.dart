import 'package:flutter/material.dart';
import 'menu_tabs.dart';

class MenuListIndexChanged extends Notification {
  final bool val;
  final int selectedMenuTabIndex;
  MenuListIndexChanged(this.val, this.selectedMenuTabIndex);
}