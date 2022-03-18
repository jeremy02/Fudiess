import 'package:flutter/material.dart';
import 'package:fudiess/controllers/menu_controller.dart';
import 'package:fudiess/sections/app_bar/components/drawer_menu.dart';
import 'package:fudiess/sections/app_bar/custom_app_bar.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController _controller = Get.put(MenuController());

    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: _controller.scaffoldkey,
      endDrawer: DrawerMenu(),
      body: SafeArea(
        child: SafeArea(
          child: Responsive(
            mobile: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(),
                ],
              ),
            ),
            tablet: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(),
                ],
              ),
            ),
            desktop: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
