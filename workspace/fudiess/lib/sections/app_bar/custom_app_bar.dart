import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudiess/controllers/menu_controller.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

import '../../components/default_button.dart';
import 'components/desktop_menu.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPadding,
        horizontal: Responsive.isDesktop(context)
            ? kDefaultPadding * 2
            : kDefaultPadding * 1.5,
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
            flex: 1,
          ),
          if (Responsive.isDesktop(context)) DeskTopMenu(),
          if (Responsive.isDesktop(context))
            const SizedBox(
              width: kDefaultPadding,
            ),
          DefaultButton(
            buttonText: "Sign Up",
            fontSize: Responsive.isDesktop(context) ? 14.0 : 12.0,
            horizontalPadding: Responsive.isDesktop(context)
                ? kDefaultPadding * 1.5
                : kDefaultPadding,
            fontWeight: FontWeight.normal,
            buttonPress: () => {},
          ),
          if (!Responsive.isDesktop(context))
            const SizedBox(
              width: kDefaultPadding,
            ),
          if (!Responsive.isDesktop(context)) DrawerIconButton(context)
        ],
      ),
    );
  }
}

Widget DrawerIconButton(BuildContext context) {
  final MenuController _controller = Get.put(MenuController());

  return Stack(
    children: <Widget>[
      Positioned.fill(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          child: Material(
            elevation: 8.0,
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.black.withOpacity(
                0.2,
              ),
              hoverColor: Colors.transparent,
              onTap: () {
                _controller.openOrCloseDrawer();
              },
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        child: GestureDetector(
          onTap: () {
            _controller.openOrCloseDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              12.0,
              12.0,
              8.0,
              12.0,
            ),
            child: SvgPicture.asset(
              "assets/icons/ic_menu.svg",
              height: 20.0,
              color: kPrimaryColor,
              alignment: Alignment.centerLeft,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  );
}
