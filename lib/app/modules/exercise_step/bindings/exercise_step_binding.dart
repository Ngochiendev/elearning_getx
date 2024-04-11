import 'package:get/get.dart';

import '../controllers/exercise_step_controller.dart';

class ExerciseStepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExerciseStepController>(
      () => ExerciseStepController(),
    );
  }
}
