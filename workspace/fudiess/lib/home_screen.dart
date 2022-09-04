import 'package:flutter/material.dart';
import 'package:fudiess/controllers/menu_controller.dart';
import 'package:fudiess/sections/app_bar/components/drawer_menu.dart';
import 'package:fudiess/sections/app_top_section/app_top_section.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController _controller = Get.put(MenuController());

    return Scaffold(
      backgroundColor: Colors.white,
      key: _controller.scaffoldkey,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: SafeArea(
          child: Responsive(
            mobile: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppTopSection(),
                ],
              ),
            ),
            tablet: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppTopSection(),
                ],
              ),
            ),
            desktop: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppTopSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
