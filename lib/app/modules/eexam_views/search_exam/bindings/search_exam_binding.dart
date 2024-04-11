import 'package:get/get.dart';

import '../controllers/search_exam_controller.dart';

class SearchExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchExamController>(
      () => SearchExamController(),
    );
  }
}
