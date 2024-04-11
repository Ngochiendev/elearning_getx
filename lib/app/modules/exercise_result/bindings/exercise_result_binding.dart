import 'package:get/get.dart';

import '../controllers/exercise_result_controller.dart';

class ExerciseResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExerciseResultController>(
      () => ExerciseResultController(),
    );
  }
}
