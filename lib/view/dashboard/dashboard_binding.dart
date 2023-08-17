import 'package:flutter_application/Controller/auth_controller.dart';
import 'package:flutter_application/Controller/category_controller.dart';
import 'package:flutter_application/Controller/dashboard_controller.dart';
import 'package:flutter_application/Controller/home_controller.dart';
import 'package:flutter_application/Controller/training_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(TrainingController());
    Get.put(CategoryController());
    Get.put(AuthController());
  }
}
