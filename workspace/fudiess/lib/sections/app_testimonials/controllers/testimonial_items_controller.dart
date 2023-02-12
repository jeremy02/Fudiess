import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../models/testimonial_item.dart';

class TestimonialItemsController extends GetxController {
  List<TestimonialItem> get customerTestimonials => [
    TestimonialItem(
      id: 1,
      customerName: 'Kristin Watson',
      customerImagePath: 'assets/images/testimonials/ic_testimonials_1.png',
      review: '\"Very quick and\neasy!"',
      reviewedItem: 'Louis Vuitton',
    ),
    TestimonialItem(
      id: 2,
      customerName: 'Ronald Richards',
      customerImagePath: 'assets/images/testimonials/ic_testimonials_2.png',
      review: '\"Very quick and\neasy!"',
      reviewedItem: 'Louis Vuitton',
    ),
  ];
}