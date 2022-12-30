import 'package:flutter/material.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class FooterSectionPagesServiceLayout extends StatelessWidget {

  const FooterSectionPagesServiceLayout({
    required this.title,
    required this.pageServicesList,
    required this.addSpacing,
  }) : super();

  final String title;
  final List<String> pageServicesList;
  final bool addSpacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: kDefaultPadding
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichTextTitle(
            text: title,
            fontSize: Responsive.isMobile(context) ? 16 : 18,
            fontWeight: FontWeight.bold,
            textColor: Colors.black,
            alignStart: true,
            textScaleFactor: 1.2,
          ),
          SizedBox(
            height: Responsive.isMobile(context) ? kDefaultPadding * 0.75 : kDefaultPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: _buildFooterPageServiceItems(
                  context,
                  pageServicesList.asMap().containsKey(0) ? (pageServicesList[0].isNotEmpty ? pageServicesList[0] : null) : null,
                  pageServicesList.asMap().containsKey(1) ? (pageServicesList[1].isNotEmpty ? pageServicesList[1] : null) : null,
                ),
              ),
              _buildFooterPageServiceItems(
                  context,
                  pageServicesList.asMap().containsKey(2) ? (pageServicesList[2].isNotEmpty ? pageServicesList[2] : null) : null,
                pageServicesList.asMap().containsKey(3) ? (pageServicesList[3].isNotEmpty ? pageServicesList[3] : null) : null,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFooterPageServiceItems(BuildContext context, String? item1, String? item2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichTextTitle(
          text: item1 ?? '',
          fontSize: Responsive.isMobile(context) ? 14 : 16,
          fontWeight: FontWeight.bold,
          textColor: kTextSecondaryColor,
          alignStart: true,
          textScaleFactor: 1.2,
        ),
        SizedBox(
          height: addSpacing ? (Responsive.isMobile(context) ? kDefaultPadding * 0.75 : kDefaultPadding) : 0,
        ),
        RichTextTitle(
          text: item2 ?? '',
          fontSize: Responsive.isMobile(context) ? 14 : 16,
          fontWeight: FontWeight.bold,
          textColor: kTextSecondaryColor,
          alignStart: true,
          textScaleFactor: 1.2,
        ),
      ],
    );
  }

}