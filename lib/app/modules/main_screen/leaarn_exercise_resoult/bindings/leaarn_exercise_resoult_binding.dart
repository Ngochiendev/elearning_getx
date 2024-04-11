import 'package:elearning/app/modules/main_screen/leaarn_exercise_resoult/controllers/leaarn_exercise_result_controller.dart';
import 'package:get/get.dart';

class LeaarnExerciseResoultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaarnExerciseResoultController>(
      () => LeaarnExerciseResoultController(),
    );
  }
}
