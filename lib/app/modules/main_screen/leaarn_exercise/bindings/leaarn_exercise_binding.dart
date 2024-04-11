import 'package:get/get.dart';

import '../controllers/leaarn_exercise_controller.dart';

class LeaarnExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaarnExerciseController>(
      () => LeaarnExerciseController(),
    );
  }
}
