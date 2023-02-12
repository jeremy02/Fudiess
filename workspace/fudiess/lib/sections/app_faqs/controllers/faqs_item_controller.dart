import 'package:get/get.dart';

import '../models/faqs_item.dart';

class FaqsItemController extends GetxController {
  List<FaqsItem> get faqItems => [
    FaqsItem(
        expanded: true,
        title: 'How to order food?',
        description: "Open repair of infrarenal aortic \nanuerysm or dissection, plus repair.",
    ),
    FaqsItem(
        expanded: false,
        title: 'How to track an order?',
        description: "Open repair of infrarenal aortic \nanuerysm or dissection, plus repair.",
    ),
    FaqsItem(
        expanded: false,
        title: 'How to pay?',
        description: "Open repair of infrarenal aortic \nanuerysm or dissection, plus repair.",
    ),
  ];
}