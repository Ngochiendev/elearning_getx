import 'package:get/get.dart';

import '../controllers/result_search_exam_controller.dart';

class ResultSearchExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultSearchExamController>(
      () => ResultSearchExamController(),
    );
  }
}
