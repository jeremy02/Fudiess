import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class FooterSectionAboutFoodiesLayout extends StatelessWidget {
  const FooterSectionAboutFoodiesLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String captionText =
        "Fudiess is fast food \ndelivery service with the \nfastest service.";

    if (Responsive.isMobile(context)) {
      captionText = "Fudiess is fast \nfood delivery \nservice.";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          "assets/images/ic_logo.svg",
          height: 30,
          alignment: Alignment.centerLeft,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        RichTextTitle(
          text: captionText,
          fontSize: Responsive.isMobile(context) ? 14 : 16,
          fontWeight: FontWeight.normal,
          textColor: kTextSecondaryColor,
          alignStart: true,
          textScaleFactor: 1.2,
        ),
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        Container(
          height: 2.0,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        Row(
          children: [
            _buildSocialMediaButtons(context, 'assets/images/ic_facebook.png'),
            SizedBox(
              width: Responsive.isMobile(context) ? kDefaultPadding * 0.25 : kDefaultPadding * 0.5,
            ),
            _buildSocialMediaButtons(context, 'assets/images/ic_twitter.png'),
            SizedBox(
              width: Responsive.isMobile(context) ? kDefaultPadding * 0.25 : kDefaultPadding * 0.5,
            ),
            _buildSocialMediaButtons(context, 'assets/images/ic_instagram.png'),
          ],
        )
      ],
    );
  }
  Widget _buildSocialMediaButtons(BuildContext context, String imagePath) {
    return Material(
      shape: const CircleBorder(),
      color: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        splashColor: Colors.black26,
        onTap: (){},
        child: Ink.image(
          image: AssetImage(
            imagePath,
          ),
          fit: BoxFit.contain,
          height: Responsive.isMobile(context) ? 24 : 36,
          width: Responsive.isMobile(context) ? 24 : 36,
        ),
      ),
    );
  }

}