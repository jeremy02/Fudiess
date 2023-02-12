import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

import 'components/expandable_faqs_list_section.dart';
import 'components/faqs_image_section.dart';
import 'controllers/faqs_item_controller.dart';

class AppFAQsSection extends StatefulWidget {

  const AppFAQsSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _AppFAQsSectionState createState() => _AppFAQsSectionState();
}

class _AppFAQsSectionState extends State<AppFAQsSection> {

  final FaqsItemController _faqsItemController = Get.put(FaqsItemController());

  @override
  void dispose() {
    _faqsItemController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double calculatedWidth = widget.screenSize.width;
    double calculatedHeight = widget.screenSize.height;

    double minTopSectionHeight = 500;

    calculatedHeight = (calculatedHeight * 0.60) <= minTopSectionHeight ? minTopSectionHeight : (calculatedHeight * 0.60);

    return SafeArea(
      child: AnimatedContainer(
        constraints: BoxConstraints(
          minHeight: minTopSectionHeight,
          maxWidth: kMaxWidth,
          maxHeight: calculatedHeight,
        ),
        padding: EdgeInsets.only(
          left: Responsive.isMobile(context) ? 10 : 0,
          right: Responsive.isMobile(context) ? 10 : 40,
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        height: 500,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.fastOutSlowIn,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                FaqsImageSection(
                  constraints: constraints,
                ),
                ExpandableFaqsList(
                  key: UniqueKey(),
                  faqItems: _faqsItemController.faqItems,
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
