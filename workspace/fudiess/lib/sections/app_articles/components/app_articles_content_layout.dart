import 'package:flutter/material.dart';
import 'package:fudiess/sections/app_articles/components/article_card_item.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:get/get.dart';

import '../../../utils/responsive.dart';
import '../controllers/article_items_controller.dart';
import '../models/article_item.dart';

class AppArticlesContentLayout extends StatefulWidget {

  const AppArticlesContentLayout({
    Key? key,
  }) : super(key: key);

  @override
  _AppArticlesContentLayoutState createState() => _AppArticlesContentLayoutState();
}

class _AppArticlesContentLayoutState extends State<AppArticlesContentLayout> {

  final ArticleItemsController _articleItemsController = Get.put(ArticleItemsController());

  @override
  void dispose() {
    _articleItemsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: _buildArticlesListWidget(context, _articleItemsController.articles),
    );
  }

  List <Widget> _buildArticlesListWidget(BuildContext context, List<ArticleItem> articleItems) {
    final doubleListMarginSpacing = Responsive.isDesktop(context) ? kDefaultPadding * 1.7 : kDefaultPadding * 0.70;

    // TODO
    // for now we have limited the article Items to two items and can sort and have a list later
    return articleItems.take(2).map<ArticleCardItem>((item) =>
        ArticleCardItem(
          key: UniqueKey(),
          articleItem: item,
          itemMargin: EdgeInsets.only(
            right: Responsive.isMobile(context) ? 0 : doubleListMarginSpacing,
            bottom: Responsive.isMobile(context) ? kDefaultPadding : 0,
          ),
          press: () {},
        ),
    ).toList();
  }

}