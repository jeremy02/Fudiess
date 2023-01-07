import 'package:flutter/material.dart';

import '../../../components/forward_back_button.dart';
import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';
import '../models/faqs_item.dart';
import 'expandable_faqs_list_item.dart';

typedef ParentFaqListExpandedCallback = void Function(int item, bool status);

class ExpandableFaqsList extends StatefulWidget {

  const ExpandableFaqsList({
    Key? key,
    required this.faqItems,
  }) : super(key: key);

  final List <FaqsItem> faqItems;

  @override
  _ExpandableFaqsListState createState() => _ExpandableFaqsListState();
}

class _ExpandableFaqsListState extends State<ExpandableFaqsList> {

  @override
  void initState() {
    super.initState();
  }

  void onFaqsListItemExpanded(int listIndex, int item, bool status) {
    setState(() {
      widget.faqItems[listIndex].expanded = !widget.faqItems[listIndex].expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RichTextTitle(
            text: "FAQ",
            fontSize: 14,
            fontWeight: FontWeight.normal,
            textColor: kPrimaryColor,
            alignStart: true,
            textScaleFactor: 1.5,
          ),
          const SizedBox(
            height: 20,
          ),
          RichTextTitle(
            text: "Find The ",
            fontSize: Responsive.isMobile(context) ? 22 : 30,
            fontWeight: FontWeight.bold,
            textColor: Colors.black,
            alignStart: true,
            coloredText: "Answer",
            coloredTextColor: kPrimaryColor,
            coloredTextFontSize: Responsive.isMobile(context) ? 22 : 30,
            coloredTextFontWeight: FontWeight.bold,
            textScaleFactor: 0.0,
            isResponsiveText: !Responsive.isMobile(context), // Text not responsive if is mobile
          ),
          RichTextTitle(
            text: "to Your Confusion ",
            fontSize: Responsive.isMobile(context) ? 22 : 30,
            fontWeight: FontWeight.bold,
            textColor: Colors.black,
            alignStart: true,
            textScaleFactor: 0.0,
            isResponsiveText: !Responsive.isMobile(context), // Text not responsive if is mobile
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.faqItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ExpandableFaqsListSection(
                  faqItem: widget.faqItems[index],
                  parentFaqListExpandedCallback: (int item, bool status) {
                      onFaqsListItemExpanded(index, item, status);
                  }
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ForwardBackButton(
                bgColor: kPrimaryColor,
                padding: 10,
                radius: 10,
                elevation: 2.0,
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20,
                  color: Colors.white,
                ),
                buttonPress: () {}
            ),
          ),
        ],
      ),
    );
  }
}