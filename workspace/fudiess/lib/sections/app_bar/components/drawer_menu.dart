import 'package:flutter/material.dart';
import 'package:fudiess/controllers/menu_controller.dart';
import 'package:get/get.dart';

class DrawerMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        color: Colors.white,
      ),
    );
  }
}
