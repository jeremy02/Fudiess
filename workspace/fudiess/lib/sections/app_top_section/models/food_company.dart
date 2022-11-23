import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class FoodCompany {
  final int id;
  final String title, imagePath;

  FoodCompany({required this.id, required this.title, required this.imagePath});
}

// For demo list of food companies
class FoodCompanyController extends GetxController {
  List<FoodCompany> get foodCompanies => [
    FoodCompany(
      id: 1,
      title: "MacDonald",
      imagePath: "assets/images/ic_mcdonalds.png",
    ),
    FoodCompany(
      id: 2,
      title: "Pizza Hut",
      imagePath: "assets/images/ic_pizzahut.png",
    ),
    FoodCompany(
      id: 3,
      title: "Burger King",
      imagePath: "assets/images/ic_burgerking.png",
    ),
    FoodCompany(
      id: 4,
      title: "KFC",
      imagePath: "assets/images/ic_kfc.png",
    )
  ];
}