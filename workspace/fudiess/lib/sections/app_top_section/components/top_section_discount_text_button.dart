import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class TopSectionDiscountTextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 107, 0, 0.1),
            border: Border.all(
                color: Colors.transparent,
            ),
            borderRadius: const BorderRadius.all(
                Radius.circular(kDefaultPadding * 0.60),
            ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(
                kDefaultPadding * 0.25,
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: Responsive.isMobile(context) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceBetween,
                children: [
                  DefaultButton(
                    buttonText: "New Menu",
                    fontSize: 14.0,
                    horizontalPadding: Responsive.isDesktop(context)
                        ? kDefaultPadding * 1.5
                        : kDefaultPadding,
                    fontWeight: FontWeight.normal,
                    buttonPress: () => {},
                  ),
                  SizedBox(
                    width: Responsive.isMobile(context) ? kDefaultPadding * 0.25 : kDefaultPadding * 0.5,
                  ),
                  Flexible(
                    flex: 1,
                    child: RichTextTitle(
                      text: Responsive.isMobile(context) ? "Get 20% discount purchases." : "Get 20% discount.",
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
        ),
    );
  }
}
