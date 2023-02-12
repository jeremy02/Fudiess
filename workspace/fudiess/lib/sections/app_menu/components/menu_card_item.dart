import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';
import '../models/menu_tab_items.dart';

class MenuCardItem extends StatelessWidget {
  const MenuCardItem({
    required Key key,
    required this.menuItem,
    required this.itemWidth,
    required this.itemLeftMargin,
    required this.press,
  }) : super(key: key);

  final MenuTabItems menuItem;
  final double itemWidth;
  final double itemLeftMargin;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {

    final borderRadius = BorderRadius.circular(kDefaultPadding * 0.5);

    return Container(
      width: itemWidth,
      margin: EdgeInsets.only( // no margin if its the last item
        left: itemLeftMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          fit: Responsive.isDesktop(context) ? BoxFit.cover : BoxFit.fill,
          image: AssetImage(
              menuItem.imagePath
          ), // Background image
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Material(
            borderRadius: borderRadius,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: press,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDefaultPadding * 0.5),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: const [0.1, 1.9],
                      colors: [
                        Colors.black.withOpacity(.8),
                        Colors.black.withOpacity(.1)
                      ],
                    ),
                ),
              ),
            ),
            color: Colors.transparent,
          ),
          Positioned(
            bottom: kDefaultPadding * 0.75,
            left: kDefaultPadding * 0.75,
            right: kDefaultPadding * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichTextTitle(
                  text: menuItem.name,
                  fontSize: Responsive.isMobile(context) ? 14 : 16,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                  alignStart: true,
                  textScaleFactor: 0.0,
                ),
                SizedBox(
                  height: Responsive.isMobile(context) ? kDefaultPadding * 0.35 : kDefaultPadding * 0.50,
                ),
                RichTextTitle(
                  text: menuItem.currency + " ",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  textColor: kPrimaryColor,
                  alignStart: true,
                  coloredText: menuItem.price,
                  coloredTextColor: Colors.white,
                  coloredTextFontSize: 18,
                  coloredTextFontWeight: FontWeight.bold,
                  textScaleFactor: 0.0,
                ),
                SizedBox(
                  height: Responsive.isMobile(context) ? kDefaultPadding * 0.35 : kDefaultPadding * 0.50,
                ),
                GestureDetector(
                  onTap: press,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      RichTextTitle(
                        text: 'Order Now',
                        fontSize: Responsive.isMobile(context) ? 14 : 16,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.white,
                        alignStart: true,
                        textScaleFactor: 0.0,
                      ),
                      SizedBox(
                        width: Responsive.isMobile(context) ? kDefaultPadding : kDefaultPadding * 0.50,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: Responsive.isMobile(context) ? 12 : 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          menuItem.isPremium ? Positioned(
            top: kDefaultPadding * 0.75,
            right: kDefaultPadding * 0.75,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: kDefaultPadding * 0.5,
              child: SvgPicture.asset(
                "assets/images/menu_section/ic_menu_premium.svg",
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}