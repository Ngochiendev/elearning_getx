import 'package:get/get.dart';

import '../controllers/exam_detail_controller.dart';

class ExamDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamDetailController>(
      () => ExamDetailController(),
    );
  }
}
