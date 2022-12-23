import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../models/menu_tabs.dart';

class MenuTabsController extends GetxController {
  List<MenuTabs> get menuTabItems => [
    MenuTabs(
      id: 1,
      name: "Burger",
      imagePath: "assets/images/menu_section/ic_burger.png",
    ),
    MenuTabs(
      id: 2,
      name: "Pizza",
      imagePath: "assets/images/menu_section/ic_pizzaslice.png",
    ),
    MenuTabs(
      id: 3,
      name: "Ramen",
      imagePath: "assets/images/menu_section/ic_ramen.png",
    ),
    MenuTabs(
      id: 4,
      name: "Fried Chicken",
      imagePath: "assets/images/menu_section/ic_fried-chicken.png",
    ),
  ];
}