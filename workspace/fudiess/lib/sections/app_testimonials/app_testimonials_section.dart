import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import '../../components/rich_text_title.dart';
import 'components/app_testimonials_section_title_layout.dart';

class AppTestimonialsSection extends StatelessWidget {
  const AppTestimonialsSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        constraints: const BoxConstraints(
          maxWidth: kMaxWidth,
        ),
        padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding * 0.5,
          horizontal: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 2,
        ),
        decoration: const BoxDecoration(
          color: kBackgroundColor,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 2 : kDefaultPadding * 4,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Responsive.isMobile(context) ? _buildMobileTestimonialLayout(context) : _buildTabletDeskTopTestimonialLayout(context),
            ),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 2.5 : kDefaultPadding * 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileTestimonialLayout(BuildContext context) {

    final doubleListMarginSpacing = (Responsive.isDesktop(context) ? kDefaultPadding * 1.7 : kDefaultPadding * 0.70);
    final borderRadius = BorderRadius.circular(kDefaultPadding * 0.5);
    Size size = MediaQuery.of(context).size;

    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppTestimonialsSectionTitleLayout(
            key: UniqueKey()
        ),
        Row(
          children: [
            Expanded(
              child: _buildTestimonialCard(context)
            ),
            SizedBox(
              width: doubleListMarginSpacing,
            ),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletDeskTopTestimonialLayout(BuildContext context) {

    final doubleListMarginSpacing = (Responsive.isDesktop(context) ? kDefaultPadding * 1.7 : kDefaultPadding * 0.70);

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 2,
          child: AppTestimonialsSectionTitleLayout(
              key: UniqueKey()
          ),
        ),
        Flexible(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                  child: _buildTestimonialCard(context)
              ),
              SizedBox(
                width: doubleListMarginSpacing,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTestimonialCard(BuildContext context) {

    final doubleListMarginSpacing = (Responsive.isDesktop(context) ? kDefaultPadding * 1.7 : kDefaultPadding * 0.70);

    return Material(
      borderRadius: BorderRadius.circular(kDefaultPadding * 0.75),
      color: Colors.white,
      elevation: 2.0,
      child: InkWell(
        splashColor: Colors.black12,
        highlightColor: Colors.black12,
        focusColor: Colors.black12,
        borderRadius: BorderRadius.circular(kDefaultPadding * 0.75),
        onTap: () {

        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: Responsive.isMobile(context) ? kDefaultPadding : kDefaultPadding * 1.5
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
                    backgroundImage: const AssetImage(
                      'assets/images/testimonials/ic_testimonials_1.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Responsive.isDesktop(context) ? kDefaultPadding * 0.75 : kDefaultPadding * 0.5,
              ),
              const RichTextTitle(
                text: '\"Very quick and\neasy!"',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                textColor: kTextSecondaryColor,
                alignStart: false,
                coloredText: null,
                coloredTextColor: null,
                textScaleFactor: 1.5,
              ),
              SizedBox(
                height: Responsive.isDesktop(context) ? kDefaultPadding * 1.25 : kDefaultPadding,
              ),
              Container(
                width: kDefaultPadding * 2.5,
                height: kDefaultPadding * 0.10,
                decoration: const BoxDecoration(
                    color: kPrimaryColor
                ),
              ),
              SizedBox(
                height: Responsive.isDesktop(context) ? kDefaultPadding * 0.75 : kDefaultPadding * 0.5,
              ),
              const RichTextTitle(
                text: "Kristin Watson",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textColor: kTextLightColor,
                alignStart: false,
                coloredText: null,
                coloredTextColor: null,
                textScaleFactor: 1.5,
              ),
              SizedBox(
                height: Responsive.isDesktop(context) ? kDefaultPadding * 0.15 : kDefaultPadding * 0.25,
              ),
              const RichTextTitle(
                text: "Louis Vuitton",
                fontSize: 16,
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
    );
  }
}