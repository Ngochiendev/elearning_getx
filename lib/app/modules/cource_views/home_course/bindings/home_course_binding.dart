import 'package:elearning/app/modules/cource_views/home_course/controllers/home_course_controller.dart';
import 'package:get/get.dart';

class HomeCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeCourseController>(
      () => HomeCourseController(),
    );
  }
}
