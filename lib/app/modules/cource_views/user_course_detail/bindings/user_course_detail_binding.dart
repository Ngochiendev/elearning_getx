import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:get/get.dart';

import '../controllers/user_course_detail_controller.dart';

class UserCourseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCourseDetailController>(
      () => UserCourseDetailController(),
    );
    Get.lazyPut<CartProductController>(
          () => CartProductController(),
    );
  }
}
