import 'package:flutter/material.dart';
import 'package:fudiess/sections/app_bar/custom_app_bar.dart';
import 'package:fudiess/sections/app_top_section/components/food_company_item.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

import 'components/top_section_main.dart';
import 'models/food_company.dart';

class AppTopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;

    double calculatedWidth = sizes.width;
    double calculatedHeight = sizes.height * 0.90;

    // if isDesktop
    if (Responsive.isDesktop(context)) {
      calculatedWidth = calculatedWidth * 0.45;
    }

    // if isTablet
    if (Responsive.isTablet(context)) {
      calculatedWidth = calculatedWidth * 0.45;
    }

    // if mobile
    if (Responsive.isMobile(context)) {
      calculatedWidth = calculatedWidth * 1.5;
    }

    return SafeArea(
      child: Stack(
        children: [
          AnimatedContainer(
            constraints: BoxConstraints(
              minHeight: Responsive.isDesktop(context) ? 600 : 450,
            ),
            height: calculatedHeight,
            margin: const EdgeInsets.only(
              bottom: kDefaultPadding * 3.5,
            ),
            decoration: const BoxDecoration(
              color: kBackgroundColor,
            ),
            duration: const Duration(
              milliseconds: 500,
            ),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomAppBar(),
                SizedBox(
                  height: Responsive.isDesktop(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
                ),
                TopSectionMain(
                  key: UniqueKey(),
                  width: calculatedWidth,
                  height: calculatedHeight,
                ),
                SizedBox(
                  height: Responsive.isDesktop(context) ? kDefaultPadding * 5 : kDefaultPadding * 2,
                ),
              ],
            ),
          ),
          _foodCompaniesWidget(context, calculatedWidth)
        ],
      ),
    );
  }



  Widget _foodCompaniesWidget(BuildContext context, double calculatedWidth) {

    final FoodCompanyController _controller =
      Get.put(FoodCompanyController());

    return Positioned(
        bottom: 0,
        left: Responsive.isMobile(context) ? 16 : 32,
        right: Responsive.isMobile(context) ? 16 : 32,
        child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Responsive.isMobile(context) ? kDefaultPadding / 2 : kDefaultPadding,
                  horizontal: Responsive.isMobile(context) ? 0 : kDefaultPadding,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    _controller.foodCompanies.length,
                        (index) => FoodCompanyItem(
                      title: _controller.foodCompanies[index].title,
                      imagePath: _controller.foodCompanies[index].imagePath,
                      width: Responsive.isMobile(context) ? calculatedWidth * 0.08 : calculatedWidth * 0.12,
                      height: Responsive.isMobile(context) ? calculatedWidth * 0.10 : calculatedWidth * 0.12,
                      press: () => (index) {
                        // print(index);
                      },
                      key: ObjectKey(_controller.foodCompanies[index]),
                    ),
                  ),
                ),
            ),
        ),
    );
  }
}
