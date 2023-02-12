import 'package:fudiess/sections/app_articles/models/article_item.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ArticleItemsController extends GetxController {
  List<ArticleItem> get articles => [
    ArticleItem(
      id: 1,
      title: "Why isn't pizza boxed?",
      description: "Open repair of infrarenal aortic\nanuerysm or dissection,plus\nrepair.",
      date: '12 Aug 2021',
      imagePath: 'assets/images/articles/ic_article_img_1.png',
      isRead: false,
    ),
    ArticleItem(
      id: 1,
      title: "How can burgers be\nstacked?",
      description: "Open repair of infrarenal aortic \nanuerysm or dissection.",
      date: '12 Aug 2021',
      imagePath: 'assets/images/articles/ic_article_img_2.png',
      isRead: true,
    ),
  ];
}