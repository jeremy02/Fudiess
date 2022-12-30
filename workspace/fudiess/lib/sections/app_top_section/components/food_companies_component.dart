import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';
import '../models/food_company.dart';
import 'food_company_item.dart';

class FoodCompaniesComponent extends StatelessWidget {
  const FoodCompaniesComponent({
    required Key key,
    required this.calculatedWidth,
  }) : super(key: key);

  final double calculatedWidth;

  @override
  Widget build(BuildContext context) {

    final FoodCompanyController _controller = Get.put(FoodCompanyController());

    return Positioned(
      bottom: 0,
      left: Responsive.isMobile(context) ? kDefaultPadding * 0.8 : kDefaultPadding * 2,
      right: Responsive.isMobile(context) ? kDefaultPadding * 0.8 : kDefaultPadding * 2,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            kDefaultPadding * 0.5,
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
                press: () => (index) {},
                key: ObjectKey(_controller.foodCompanies[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}