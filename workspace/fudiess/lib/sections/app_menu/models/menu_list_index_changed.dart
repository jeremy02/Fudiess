import 'package:flutter/material.dart';

class MenuListIndexChanged extends Notification {
  final int selectedMenuTabIndex;
  final int selectedMenuTabId;
  MenuListIndexChanged(this.selectedMenuTabIndex, this.selectedMenuTabId);
}