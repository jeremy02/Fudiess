import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class TopSectionDiscountTextButton extends StatelessWidget {
  const TopSectionDiscountTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(
          kDefaultPadding * 0.25,
        ),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 107, 0, 0.1),
            border: Border.all(
                color: Colors.transparent,
            ),
            borderRadius: const BorderRadius.all(
                Radius.circular(kDefaultPadding * 0.60),
            ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultButton(
              buttonText: "New Menu",
              fontSize: 14.0,
              buttonPadding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context) ? kDefaultPadding * 1.5 : kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              fontWeight: FontWeight.normal,
              buttonPress: () => {},
            ),
            SizedBox(
              width: Responsive.isMobile(context) ? kDefaultPadding * 0.25 : kDefaultPadding * 0.5,
            ),
            Flexible(
              flex: 1,
              child: RichTextTitle(
                text: Responsive.isMobile(context) || !Responsive.isPortrait(context) ? "Get 20% discount purchases." : "Get 20% discount.",
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                textColor: kPrimaryColor,
                alignStart: false,
              ),
            ),
            SizedBox(
              width: Responsive.isMobile(context) ? kDefaultPadding * 0.25 : kDefaultPadding * 0.5,
            ),
            if (!Responsive.isMobile(context))
              RawMaterialButton(
                onPressed: () {},
                elevation: 1.0,
                constraints: const BoxConstraints(),
                shape: const CircleBorder(),
                splashColor: const Color.fromRGBO(255, 107, 0, 0.1),
                highlightColor: Colors.transparent,
                child: const Icon(
                  Icons.arrow_forward,
                  size: 32,
                  color: kPrimaryColor,
                ),
                padding: const EdgeInsets.all(
                  kDefaultPadding * 0.4,
                ),
              ),
          ],
        ),
    );
  }
}
