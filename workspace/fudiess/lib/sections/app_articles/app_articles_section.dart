import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

import '../../components/default_button.dart';
import '../../components/rich_text_title.dart';
import '../../components/view_more_button.dart';

class AppArticlesSection extends StatelessWidget {
  const AppArticlesSection({
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
          vertical: 0,
          horizontal: Responsive.isMobile(context) ? 10 : 40,
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastOutSlowIn,
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildArticlesTitleLayoutSection(context),
            _buildArticlesContentMobileLayoutSection(context),
            SizedBox(
              height: Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 3,
            ),
            const ViewMoreMenuButton(
              buttonText: 'More Articles',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticlesContentMobileLayoutSection(BuildContext context) {
    return Flex(
      direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        if(Responsive.isMobile(context))
          _buildArticlesCardSection(context)
        else
          Expanded(
            child: _buildArticlesCardSection(context),
          ),
        if(Responsive.isMobile(context))
          _buildArticlesCardSection(context)
        else
          Expanded(
            child: _buildArticlesCardSection(context),
          ),
      ],
    );
  }

  Widget _buildArticlesCardSection(BuildContext context) {
    final doubleListMarginSpacing = Responsive.isDesktop(context) ? kDefaultPadding * 1.7 : kDefaultPadding * 0.70;

    String captionText = 'Open repair of infrarenal aortic\nanuerysm or dissection,plus\nrepair.';

    if(Responsive.isMobile(context)) {
      captionText = 'Open repair of infrarenal aortic \nanuerysm or dissection.';
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: EdgeInsets.only(
          left: Responsive.isMobile(context) ? 0 : doubleListMarginSpacing,
          bottom: Responsive.isMobile(context) ? kDefaultPadding : 0,
        ),
        child: Card(
          elevation: 2.0,
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 0.0,),
              Container(
                width: double.maxFinite,
                height: Responsive.isMobile(context) ? 170 : 186,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top : Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/articles/ic_article_img_1.png'
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16.0,
                      ),
                      const RichTextTitle(
                        text: '12 Aug 2021',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        textColor: kTextSecondaryColor,
                        alignStart: true,
                        textScaleFactor: 0.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 16.0,
                                ),
                                RichTextTitle(
                                  text: "Why isn't pizza boxed?",
                                  fontSize: Responsive.isMobile(context) ? 18 : 20,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.black,
                                  alignStart: true,
                                  coloredText: null,
                                  coloredTextColor: kPrimaryColor,
                                  coloredTextFontSize: Responsive.isMobile(context) ? 18 : 20,
                                  coloredTextFontWeight: FontWeight.bold,
                                  textScaleFactor: 0.0,
                                  isResponsiveText: true, // Text not responsive if is desktop
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                RichTextTitle(
                                  text: captionText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  textColor: kTextSecondaryColor,
                                  alignStart: true,
                                  textScaleFactor: 0.0,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                          Flexible( // helps in affecting the responsive text scale factor
                            flex: 2,
                            child: Container(),
                          ),
                        ],
                      ),
                      DefaultButton(
                        buttonText: "Read More",
                        fontSize: 14.0,
                        buttonPadding: EdgeInsets.symmetric(
                          horizontal: Responsive.isDesktop(context) ? kDefaultPadding * 1.5 : kDefaultPadding,
                          vertical: kDefaultPadding,
                        ),
                        fontWeight: FontWeight.normal,
                        buttonPress: () => {},
                        buttonWidth: double.infinity,
                        isOutlined: true,
                      ),
                    ]
                  ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticlesTitleLayoutSection(BuildContext context) {

    String captionText = 'Open repair of infrarenal aortic anuerysm or dissection,\nplus repair of associated arterial trauma.';
    if(Responsive.isMobile(context)) {
      captionText = 'Open repair of infrarenal aortic \nanuerysm or dissection.';
    }

    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Responsive.isMobile(context) ?  40 :  60,
        ),
        const RichTextTitle(
          text: "Article",
          fontSize: 14,
          fontWeight: FontWeight.normal,
          textColor: kPrimaryColor,
          alignStart: false,
          textScaleFactor: 1.0,
        ),
        const SizedBox(
          height: 10,
        ),
        RichTextTitle(
          text: "Recent ",
          fontSize: Responsive.isMobile(context) ? 30 : 40,
          fontWeight: FontWeight.bold,
          textColor: Colors.black,
          alignStart: false,
          coloredText: "Post",
          coloredTextColor: kPrimaryColor,
          textScaleFactor: 1.5,
          isResponsiveText: false,
        ),
        const SizedBox(
          height: 10,
        ),
        RichTextTitle(
          text: captionText,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          textColor: kTextSecondaryColor,
          alignStart: false,
          textScaleFactor: 1.5,
        ),
        SizedBox(
          height: Responsive.isMobile(context) ?  10 :  60,
        ),
      ],
    );
  }
}