import 'package:flutter/material.dart';
import 'package:fudiess/utils/responsive.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../models/faqs_item.dart';
import 'expandable_faqs_list_section.dart';

class ExpandableFaqsListSection extends StatelessWidget {
  const ExpandableFaqsListSection({
    required this.faqItem,
    required this.parentFaqListExpandedCallback,
    Key? key,
  }) : super(key: key);

  final FaqsItem faqItem;
  final ParentFaqListExpandedCallback parentFaqListExpandedCallback;

  @override
  Widget build(BuildContext context) {

    final borderRadius = BorderRadius.circular(10);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Card(
        elevation: faqItem.expanded ? 2.0 : 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        clipBehavior: Clip.antiAlias,
        child: ExpansionPanelList(
          animationDuration: const Duration(milliseconds: 1000),
          dividerColor: Colors.white,
          elevation: faqItem.expanded ? 2.0 : 0.0,
          children: [
            ExpansionPanel(
              backgroundColor: faqItem.expanded ? Colors.white : kExpansionBgColor,
              body: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 25,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: faqItem.expanded ? kBgColor : Colors.transparent,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichTextTitle(
                      text: faqItem.description,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      textColor: kTextColor,
                      alignStart: true,
                      textScaleFactor: 0.0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: RichTextTitle(
                    text: faqItem.title,
                    fontSize: Responsive.isMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black,
                    alignStart: true,
                    textScaleFactor: 2.0,
                  ),
                );
              },
              isExpanded: faqItem.expanded,
            )
          ],
          expansionCallback: (int item, bool status) {
            parentFaqListExpandedCallback(item, status);
          },
        ),
      ),
    );
  }
}