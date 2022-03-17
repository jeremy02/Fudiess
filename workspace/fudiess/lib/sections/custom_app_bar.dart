import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudiess/controllers/MenuController.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

import '../components/default_button.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: Responsive.isDesktop(context)
              ? kDefaultPadding
              : kDefaultPadding * 0.80,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/ic_logo.svg",
              height: 30,
              alignment: Alignment.centerLeft,
              fit: BoxFit.cover,
            ),
            const Spacer(
              flex: 2,
            ),
            DefaultButton(
              buttonText: "Sign Up",
              fontSize: 14.0,
              horizontalPadding: Responsive.isDesktop(context)
                  ? kDefaultPadding * 1.5
                  : kDefaultPadding,
              fontWeight: FontWeight.normal,
              buttonPress: () => {},
            ),
          ],
        ));
  }
}
