import 'package:fudiess/sections/app_menu/models/menu_tab_items.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class MenuTabItemsController extends GetxController {
  List<MenuTabItems> get menuTabItems => [
    MenuTabItems(
      id: 1,
      menuTabId: 1,
      name: "Cheese Burger",
      price: "12",
      currency: "\$",
      imagePath: "assets/images/menu_section/cheese_burger.png",
      isPremium: false,
    ),
    MenuTabItems(
      id: 2,
      menuTabId: 1,
      name: "Cheese Burger (truffle)",
      price: "30",
      currency: "\$",
      imagePath: "assets/images/menu_section/cheese_truffle_burger.png",
      isPremium: true,
    ),
    MenuTabItems(
      id: 3,
      menuTabId: 2,
      name: "Hawaiian Pizza",
      price: "40",
      currency: "\$",
      imagePath: "assets/images/menu_section/hawaiian_pizza.png",
      isPremium: true,
    ),
    MenuTabItems(
      id: 4,
      menuTabId: 1,
      name: "Portobello Mushroom Burger",
      price: "27",
      currency: "\$",
      imagePath: "assets/images/menu_section/portobello_mushroom_burger.png",
      isPremium: false,
    ),
    MenuTabItems(
      id: 5,
      menuTabId: 1,
      name: "Wild Salmon Burger",
      price: "25",
      currency: "\$",
      imagePath: "assets/images/menu_section/wild_salmon_burger.png",
      isPremium: true,
    ),
    MenuTabItems(
      id: 6,
      menuTabId: 2,
      name: "Napoletana Pizza",
      price: "32",
      currency: "\$",
      imagePath: "assets/images/menu_section/napoletana_pizza.png",
      isPremium: false,
    ),
    MenuTabItems(
      id: 7,
      menuTabId: 2,
      name: "Pepperoni Pizza",
      price: "41",
      currency: "\$",
      imagePath: "assets/images/menu_section/pepperoni_pizza.png",
      isPremium: false,
    ),
    MenuTabItems(
      id: 8,
      menuTabId: 1,
      name: "Turkey Burger",
      price: "17",
      currency: "\$",
      imagePath: "assets/images/menu_section/turkey_burger.png",
      isPremium: true,
    ),
  ];
}