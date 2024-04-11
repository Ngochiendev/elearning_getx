import 'package:get/get.dart';

import '../controllers/learning_progress_controller.dart';

class LearningProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearningProgressController>(
      () => LearningProgressController(),
    );
  }
}
