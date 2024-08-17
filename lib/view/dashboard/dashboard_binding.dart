import 'package:get/get.dart';
import 'package:my_app_ecommerce/controller/dashboard_controller.dart';
import 'package:my_app_ecommerce/controller/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
  }
}