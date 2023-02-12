import 'package:flutter/material.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';
import '../models/testimonial_item.dart';

class TestimonialCardItem extends StatelessWidget {
  const TestimonialCardItem({
    required Key key,
    required this.testimonialItem,
    required this.itemWidth,
    required this.itemMargin,
    required this.press,
  }) : super(key: key);

  final TestimonialItem testimonialItem;
  final double itemWidth;
  final EdgeInsets itemMargin;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(Responsive.isMobile(context) ? 10 : 15);

    return Expanded(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          margin: itemMargin,
          child: Material(
            borderRadius: borderRadius,
            color: Colors.white,
            elevation: 0.0,
            child: InkWell(
              hoverColor: Colors.black12,
              borderRadius: borderRadius,
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      child: CircleAvatar(
                        radius: Responsive.isMobile(context) ? 30 : 40,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: kPrimaryColor,
                              radius: Responsive.isMobile(context) ? 12.5 : 15,
                              child: const Icon(
                                Icons.format_quote_sharp,
                                size: 10.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          radius: Responsive.isMobile(context) ? 30 : 40,
                          backgroundImage: AssetImage(
                            testimonialItem.customerImagePath,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Responsive.isDesktop(context) ? 15 : 10,
                    ),
                    RichTextTitle(
                      text: testimonialItem.review,
                      fontSize: Responsive.isMobile(context) ? 12 : 14,
                      fontWeight: FontWeight.normal,
                      textColor: kTextSecondaryColor,
                      alignStart: false,
                      coloredText: null,
                      coloredTextColor: null,
                      textScaleFactor: 1.5,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 50,
                      height: 2,
                      decoration: const BoxDecoration(
                          color: kPrimaryColor
                      ),
                    ),
                    SizedBox(
                      height: Responsive.isDesktop(context) ? 15 : 10,
                    ),
                    RichTextTitle(
                      text: testimonialItem.customerName,
                      fontSize: Responsive.isMobile(context) ? 14 : 16,
                      fontWeight: FontWeight.bold,
                      textColor: kTextLightColor,
                      alignStart: false,
                      coloredText: null,
                      coloredTextColor: null,
                      textScaleFactor: 1.5,
                    ),
                    SizedBox(
                      height: Responsive.isDesktop(context) ? 3 : 4,
                    ),
                    RichTextTitle(
                      text: testimonialItem.reviewedItem,
                      fontSize: Responsive.isMobile(context) ? 12 : 14,
                      fontWeight: FontWeight.normal,
                      textColor: kTextSecondaryColor,
                      alignStart: false,
                      coloredText: null,
                      coloredTextColor: null,
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}