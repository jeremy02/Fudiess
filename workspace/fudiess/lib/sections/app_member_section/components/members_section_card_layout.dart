import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import '../../../components/default_button.dart';
import '../../../components/rich_text_title.dart';

class MembersSectionCardLayout extends StatelessWidget {
  const MembersSectionCardLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          kDefaultPadding * 0.75,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          kDefaultPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichTextTitle(
              text: 'Become a member',
              fontSize: Responsive.isMobile(context) ? 10 : 12,
              fontWeight: FontWeight.normal,
              textColor: kPrimaryColor,
              alignStart: false,
              textScaleFactor: 1.2,
            ),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding : kDefaultPadding * 2,
            ),
            RichText(
              textAlign: TextAlign.center,
              // textScaleFactor: textScaleFactor ?? 0.0,
              text: TextSpan(
                text: 'Become a ',
                style: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 30 : 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: 'member',
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? 30 : 40,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: ' and get',
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? 30 : 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            RichTextTitle(
              text: 'all services',
              fontSize: Responsive.isMobile(context) ? 24 : 40,
              fontWeight: FontWeight.bold,
              textColor: Colors.black,
              alignStart: false,
              textScaleFactor: 1.2,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            _buildSubscribeTextAndButtonLayout(context),
            SizedBox(
              width: double.infinity,
              height: Responsive.isMobile(context) ? kDefaultPadding : kDefaultPadding * 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscribeTextAndButtonLayout(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    TextEditingController _textController = TextEditingController();

    const border = OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kDefaultPadding * 0.5),
        bottomLeft: Radius.circular(kDefaultPadding * 0.5),
      ),
      borderSide: BorderSide(
        width: 0,
        color: kBackgroundColor,
      ),
    );

    return Container(
      width: Responsive.isMobile(context) ? double.infinity : screenSize.width * 0.60,
      constraints: const BoxConstraints(
        maxWidth: 750,
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(
          kDefaultPadding,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: kDefaultPadding * 0.25,
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(
                  Responsive.isMobile(context) ? kDefaultPadding * 0.25 : kDefaultPadding,
                ),
                filled: true,
                fillColor: kBackgroundColor,
                focusColor: kBackgroundColor,
                hintText: 'joshua@gmail.com',
                labelStyle: const TextStyle(
                  color: kTextColor,
                  fontSize: 14.0,
                ),
                hintStyle: const TextStyle(
                  color: kTextSecondaryColor,
                  fontSize: 14.0,
                ),
                border: InputBorder.none,
                enabledBorder: border,
                focusedBorder: border,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: kBackgroundColor,
            ),
            margin: const EdgeInsets.fromLTRB(
                kDefaultPadding * 0.25, kDefaultPadding * 0.25, 0, kDefaultPadding * 0.25
            ),
            child: DefaultButton(
              buttonText: "Subscribe Now",
              fontSize: 14.0,
              buttonPadding: const EdgeInsets.all(
                  kDefaultPadding * 0.85
              ),
              fontWeight: FontWeight.normal,
              buttonPress: () => {},
              buttonBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 0.75,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: kDefaultPadding * 0.25,
          )
        ],
      ),
    );
  }
}
