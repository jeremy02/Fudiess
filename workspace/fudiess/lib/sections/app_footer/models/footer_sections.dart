import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

// For demo list of footer sections
class FooterSectionsController extends GetxController {
  List<String> get footerPages => [
    'Product', 'FAQ', 'Career', 'Blog'
  ];

  String get footerPagesTitle => 'Pages';

  List<String> get footerServices => [
    'Transaction', 'Help Center', 'Delivery'
  ];

  String get footerServicesTitle => 'Our Services';

  List<String> get footerCompanies => [
    '2972 Westheimer Rd. Santa', 'Ana, Illinois 85486', '', ''
  ];
  String get footerCompaniesTitle => 'Companies';
}