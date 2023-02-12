import 'package:flutter/material.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class OrderStepItem extends StatelessWidget {
  const OrderStepItem({
    required Key key,
    required this.title,
    required this.caption,
    required this.imagePath,
    required this.maxWidth,
    required this.press,
  }) : super(key: key);

  final String title;
  final String caption;
  final String imagePath;
  final double maxWidth;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Duration duration = const Duration(milliseconds: 200);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          kDefaultPadding * 0.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          kDefaultPadding * 0.5,
        ),
        onTap: press,
        child: AnimatedContainer(
          duration: duration,
          width: maxWidth,
          constraints: BoxConstraints(
              minHeight: maxWidth
          ),
          padding: EdgeInsets.symmetric(
              vertical: Responsive.isMobile(context) ? kDefaultPadding * 2 : kDefaultPadding * 3,
              horizontal: Responsive.isMobile(context) ? kDefaultPadding * 1.5 : kDefaultPadding * 2
          ),
          child: Column(
            children: [
              Image(
                width: maxWidth * 0.30,
                height: maxWidth * 0.30,
                fit: BoxFit.contain,
                image: AssetImage(
                    imagePath,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              LimitedBox(
                maxWidth: maxWidth * 0.80,
                child:
                RichTextTitle(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.black,
                  alignStart: false,
                  textScaleFactor: 1.5,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              RichTextTitle(
                text: caption,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                textColor: kTextColor,
                alignStart: false,
                textScaleFactor: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}