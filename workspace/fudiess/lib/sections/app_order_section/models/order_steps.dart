import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class OrderSteps {
  final int id;
  final String title, caption, imagePath;

  OrderSteps({required this.id, required this.title, required this.caption, required this.imagePath});
}

// For demo list of ordering steps
class OrderStepsController extends GetxController {
  List<OrderSteps> get orderSteps => [
    OrderSteps(
      id: 1,
      title: "Order Your Food",
      caption: "Direct repair of \naneurysm,\n pseudoaneurysm.",
      imagePath: "assets/images/ic_order.png",
    ),
    OrderSteps(
      id: 1,
      title: "Delivery & Pickup",
      caption: "Direct repair of \naneurysm,\n pseudoaneurysm.",
      imagePath: "assets/images/ic_delivery.png",
    ),
    OrderSteps(
      id: 1,
      title: "DeliciousRecipe",
      caption: "Direct repair of \naneurysm,\n pseudoaneurysm.",
      imagePath: "assets/images/ic_recipe.png",
    ),
  ];
}