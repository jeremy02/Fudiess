import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';
import 'package:get/get.dart';

import '../../components/rich_text_title.dart';
import 'components/order_step_item.dart';
import 'models/order_steps.dart';

class AppOrderSection extends StatelessWidget {
  const AppOrderSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {

    final OrderStepsController _controller = Get.put(OrderStepsController());

    return SafeArea(
      child:
      AnimatedContainer(
        constraints: BoxConstraints(
          minHeight: Responsive.isMobile(context) ? 450 : 600,
          maxWidth: kMaxWidth,
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastLinearToSlowEaseIn,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding,
            horizontal: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: kDefaultPadding,
              ),
              _orderSectionTitleLayout(context),
              SizedBox(
                height: Responsive.isMobile(context) ? kDefaultPadding : kDefaultPadding * 2,
              ),
              _orderSectionStepsLayout(context, _controller),
              SizedBox(
                height: Responsive.isMobile(context) ? kDefaultPadding : kDefaultPadding * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderSectionTitleLayout(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichTextTitle(
          text: "Order ",
          fontSize: Responsive.isMobile(context) ? 22 : 30,
          fontWeight: FontWeight.bold,
          textColor: kPrimaryColor,
          alignStart: false,
          coloredText: "in Just 30 \n Minutes",
          coloredTextColor: Colors.black,
          textScaleFactor: 1.5,
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        RichTextTitle(
          text: "By clicking on 3 steps",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          textColor: kTextSecondaryColor,
          alignStart: Responsive.isMobile(context) ? false : true,
          textScaleFactor: 1.5,
        ),
      ],
    );
  }

  Widget _orderSectionStepsLayout(BuildContext context, OrderStepsController _controller) {
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
