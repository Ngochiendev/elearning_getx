import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/cource_views/coure_learn/controllers/coure_learn_controller.dart';
import 'package:get/get.dart';

import '../controllers/course_homework_minigame_controller.dart';

class CourseHomeworkMinigameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseHomeworkMinigameController>(
      () => CourseHomeworkMinigameController(),
    );
    Get.lazyPut<CartProductController>(
          () => CartProductController(),
    );
    Get.lazyPut<CoureLearnController>(
          () => CoureLearnController(),
    );
  }
}
