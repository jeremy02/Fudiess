import 'package:flutter/material.dart';
import 'package:fudiess/controllers/menu_controller.dart';
import 'package:fudiess/sections/app_bar/components/drawer_menu.dart';
import 'package:fudiess/sections/app_footer/app_footer_section.dart';
import 'package:fudiess/sections/app_member_section/app_members_section.dart';
import 'package:fudiess/sections/app_order_section/app_order_section.dart';
import 'package:fudiess/sections/app_top_section/app_top_section.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    final MenuController _controller = Get.put(MenuController());

    return Scaffold(
      backgroundColor: Colors.white,
      key: _controller.scaffoldkey,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: SafeArea(
          child: Center(
            child: Responsive(
              mobile: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTopSection(screenSize: screenSize),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    AppOrderSection(screenSize: screenSize),
                    AppMemberSection(screenSize: screenSize),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    AppFooterSection(screenSize: screenSize),
                  ],
                ),
              ),
              tablet: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTopSection(screenSize: screenSize),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    AppOrderSection(screenSize: screenSize),
                    AppMemberSection(screenSize: screenSize),
                    AppFooterSection(screenSize: screenSize),
                  ],
                ),
              ),
              desktop: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTopSection(screenSize: screenSize),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    AppOrderSection(screenSize: screenSize),
                    AppMemberSection(screenSize: screenSize),
                    AppFooterSection(screenSize: screenSize),
                    const SizedBox(
                      height: kDefaultPadding * 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
