import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';
import '../models/order_steps.dart';
import 'order_step_item.dart';

class OrderSectionStepsLayout extends StatelessWidget {
  const OrderSectionStepsLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderStepsController _controller = Get.put(OrderStepsController());

    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints) {
        var maxWidth = constraints.maxWidth * 0.28;
        return Flex(
          direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: Responsive.isMobile(context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          mainAxisAlignment: Responsive.isMobile(context) ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
          children: List.generate( //
            _controller.orderSteps.length,
                (index) => Responsive.isMobile(context) ?
            Column(
              children: [
                // Don't show this divider if its first item
                Container(
                  height: index == 0 ? 0 : kDefaultPadding * 0.75,
                  width: 1.5,
                  color: kPrimaryColor,
                  margin: EdgeInsets.only(
                      top: index == 0 ? 0 : kDefaultPadding * 0.30
                  ),
                ),
                OrderStepItem(
                  title: _controller.orderSteps[index].title,
                  caption: _controller.orderSteps[index].caption,
                  imagePath: _controller.orderSteps[index].imagePath,
                  maxWidth: Responsive.isMobile(context) ? constraints.maxWidth * 0.5 : maxWidth,
                  press: () => (index) {
                    // print(index);
                  },
                  key: ObjectKey(_controller.orderSteps[index]),
                ),
                // Don't show this divider if its last item
                Container(
                  height: (index == _controller.orderSteps.length - 1) ? 0 : kDefaultPadding * 0.75,
                  width: 1.5,
                  color: kPrimaryColor,
                  margin: EdgeInsets.only(
                      bottom: (index == _controller.orderSteps.length - 1) ? 0 : kDefaultPadding * 0.30
                  ),
                ),
              ],
            )
                :
            OrderStepItem(
              title: _controller.orderSteps[index].title,
              caption: _controller.orderSteps[index].caption,
              imagePath: _controller.orderSteps[index].imagePath,
              maxWidth: Responsive.isMobile(context) ? constraints.maxWidth * 0.5 : maxWidth,
              press: () => (index) {
                // print(index);
              },
              key: ObjectKey(_controller.orderSteps[index]),
            ),
          ),
        );
      },
    );
  }
}