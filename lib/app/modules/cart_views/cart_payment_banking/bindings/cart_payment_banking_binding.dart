import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/cource_views/course_homework_minigame/controllers/course_homework_minigame_controller.dart';
import 'package:elearning/app/modules/main_screen/home/controllers/home_controller.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/cart_payment_banking_controller.dart';

class CartPaymentBankingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartPaymentBankingController>(CartPaymentBankingController());
    Get.put<CourseHomeworkMinigameController>(CourseHomeworkMinigameController());
    Get.put<CartProductController>(CartProductController());
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
