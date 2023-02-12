import 'package:flutter/material.dart';
import 'package:fudiess/sections/app_articles/models/article_item.dart';

import '../../../components/default_button.dart';
import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class ArticleCardItem extends StatelessWidget {
  const ArticleCardItem({
    required Key key,
    required this.articleItem,
    required this.itemMargin,
    required this.press,
  }) : super(key: key);

  final ArticleItem articleItem;
  final EdgeInsets itemMargin;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) ?
        _buildArticleCardItem(context)
        :
        Expanded(
            child: _buildArticleCardItem(context),
        );
  }


  Widget _buildArticleCardItem(BuildContext context) {

    final borderRadius = Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 0.75;

    return Container(
      margin: itemMargin,
      child: Card(
        elevation: 2.0,
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top : Radius.circular(borderRadius),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      articleItem.imagePath
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
                    RichTextTitle(
                      text: articleItem.date,
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
                                text: articleItem.title,
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
                                text: articleItem.description,
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
                      buttonPress: press,
                      buttonWidth: double.infinity,
                      isOutlined: articleItem.isRead,
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
    );
  }
}