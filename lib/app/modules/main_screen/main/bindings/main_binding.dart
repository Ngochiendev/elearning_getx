import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/cource_views/search/controllers/search_controller.dart';
import 'package:elearning/app/modules/main_screen/home/controllers/home_controller.dart';
import 'package:elearning/app/modules/main_screen/notification/controllers/notification_controller.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<HomeController>(HomeController());
    Get.put<SearchController>(SearchController());
    Get.put<NotificationController>(NotificationController());
    Get.put<ProfileController>(ProfileController());
  }
}
