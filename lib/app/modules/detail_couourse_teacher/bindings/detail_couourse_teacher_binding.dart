import 'package:get/get.dart';

import '../controllers/detail_couourse_teacher_controller.dart';

class DetailCouourseTeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCouourseTeacherController>(
      () => DetailCouourseTeacherController(),
    );
  }
}
