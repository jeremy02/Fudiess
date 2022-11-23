import 'package:flutter/material.dart';
import 'package:fudiess/sections/app_bar/custom_app_bar.dart';
import 'package:fudiess/sections/app_top_section/components/food_company_item.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

import 'models/food_company.dart';

class AppTopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;

    double calculatedHeight = sizes.width;

    // if isDesktop
    if (Responsive.isDesktop(context)) {
      calculatedHeight = calculatedHeight * 0.45;
    }

    // if isTablet
    if (Responsive.isTablet(context)) {
      calculatedHeight = calculatedHeight * 0.60;
    }

    // if mobile
    if (Responsive.isMobile(context)) {
      calculatedHeight = calculatedHeight * 1.5;
    }

    return SafeArea(
      child: Stack(
        children: [
          AnimatedContainer(
            height: calculatedHeight,
            margin: const EdgeInsets.only(
              bottom: kDefaultPadding * 2,
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
              children: [
                CustomAppBar(),
              ],
            ),
          ),
          _foodCompaniesWidget(context, calculatedHeight)
        ],
      ),
    );
  }



  Widget _foodCompaniesWidget(BuildContext context, double calculatedHeight) {

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
                      width: Responsive.isMobile(context) ? calculatedHeight * 0.08 : calculatedHeight * 0.16,
                      height: Responsive.isMobile(context) ? calculatedHeight * 0.08 : calculatedHeight * 0.16,
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
