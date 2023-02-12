import 'package:flutter/material.dart';
import 'package:fudiess/sections/app_testimonials/components/testimonial_card_item.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:get/get.dart';

import '../../../utils/responsive.dart';
import '../controllers/testimonial_items_controller.dart';
import '../models/testimonial_item.dart';

class AppTestimonialsSectionContentLayout extends StatefulWidget {

  const AppTestimonialsSectionContentLayout({
    Key? key,
  }) : super(key: key);

  @override
  _AppTestimonialsSectionContentLayoutState createState() => _AppTestimonialsSectionContentLayoutState();
}

class _AppTestimonialsSectionContentLayoutState extends State<AppTestimonialsSectionContentLayout> {

  final TestimonialItemsController _testimonialItemsController = Get.put(TestimonialItemsController());

  @override
  void dispose() {
    // _testimonialItemsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Flexible(
      flex: Responsive.isMobile(context) ? 0: 3,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double constraintsMaxWidth = constraints.maxWidth;

            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: _buildTestimonialsWidgets(context, _testimonialItemsController.customerTestimonials, constraintsMaxWidth),
                  ),
                ),
            );
          },
      ),
    );
  }

  List <Widget> _buildTestimonialsWidgets(BuildContext context, List<TestimonialItem> testimonialItems, double constraintsMaxWidth) {
    final doubleListMarginSpacing = Responsive.isDesktop(context) ? kDefaultPadding * 1.7 : kDefaultPadding * 0.70;

    // TODO
    // for now we have limited the testimonials to two items and can sort and have a list later
    return testimonialItems.take(2).map<TestimonialCardItem>((item) =>
        TestimonialCardItem(
          key: UniqueKey(),
          testimonialItem: item,
          itemWidth: (constraintsMaxWidth / 2) - (doubleListMarginSpacing / 2),
          itemMargin: EdgeInsets.only(
            left: item.id == testimonialItems[0].id
                ? 0 : doubleListMarginSpacing,  // add margin except on the first item,
          ),
          press: () {},
        ),
    ).toList();
  }
}