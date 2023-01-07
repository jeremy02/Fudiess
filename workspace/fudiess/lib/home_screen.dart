import 'package:flutter/material.dart';
import 'package:fudiess/controllers/menu_controller.dart';
import 'package:fudiess/sections/app_articles/app_articles_section.dart';
import 'package:fudiess/sections/app_bar/components/drawer_menu.dart';
import 'package:fudiess/sections/app_faqs/app_faqs_section.dart';
import 'package:fudiess/sections/app_footer/app_footer_section.dart';
import 'package:fudiess/sections/app_member_section/app_members_section.dart';
import 'package:fudiess/sections/app_menu/app_menu_section.dart';
import 'package:fudiess/sections/app_order_section/app_order_section.dart';
import 'package:fudiess/sections/app_testimonials/app_testimonials_section.dart';
import 'package:fudiess/sections/app_top_section/app_top_section.dart';
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
                primary: true,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTopSection(screenSize: screenSize),
                    const SizedBox(
                      height: 10,
                    ),
                    AppOrderSection(screenSize: screenSize),
                    const SizedBox(
                      height: 10,
                    ),
                    AppMenuSection(screenSize: screenSize),
                    AppTestimonialsSection(screenSize: screenSize),
                    AppArticlesSection(screenSize: screenSize),
                    const SizedBox(
                      height: 40,
                    ),
                    AppFAQsSection(screenSize: screenSize),
                    const SizedBox(
                      height: 20,
                    ),
                    AppMemberSection(screenSize: screenSize),
                    const SizedBox(
                      height: 20,
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
                      height: 10,
                    ),
                    AppOrderSection(screenSize: screenSize),
                    const SizedBox(
                      height: 10,
                    ),
                    AppMenuSection(screenSize: screenSize),
                    AppTestimonialsSection(screenSize: screenSize),
                    AppArticlesSection(screenSize: screenSize),
                    const SizedBox(
                      height: 40,
                    ),
                    AppFAQsSection(screenSize: screenSize),
                    const SizedBox(
                      height: 20,
                    ),
                    AppMemberSection(screenSize: screenSize),
                    const SizedBox(
                      height: 0,
                    ),
                    AppFooterSection(screenSize: screenSize),
                  ],
                ),
              ),
              desktop: SingleChildScrollView(
                primary: true,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTopSection(screenSize: screenSize),
                    const SizedBox(
                      height: 10,
                    ),
                    AppOrderSection(screenSize: screenSize),
                    const SizedBox(
                      height: 10,
                    ),
                    AppMenuSection(screenSize: screenSize),
                    AppTestimonialsSection(screenSize: screenSize),
                    AppArticlesSection(screenSize: screenSize),
                    const SizedBox(
                      height: 40,
                    ),
                    AppFAQsSection(screenSize: screenSize),
                    const SizedBox(
                      height: 20,
                    ),
                    AppMemberSection(screenSize: screenSize),
                    const SizedBox(
                      height: 0,
                    ),
                    AppFooterSection(screenSize: screenSize),
                    const SizedBox(
                      height: 60,
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
