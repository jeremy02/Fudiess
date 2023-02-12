import 'package:flutter/material.dart';
import 'package:fudiess/controllers/menu_controller.dart';
import 'package:fudiess/sections/app_bar/components/desktop_menu_item.dart';
import 'package:get/get.dart';

class DeskTopMenu extends StatelessWidget {
  DeskTopMenu({Key? key}) : super(key: key);
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Row(
          children: List.generate(
            _controller.menuItems.length,
            (index) => DeskTopMenuItem(
              text: _controller.menuItems[index],
              isActive: index == _controller.selectedIndex,
              press: () => _controller.setMenuIndex(index),
            ),
          ),
        ),
      ),
    );
  }
}
