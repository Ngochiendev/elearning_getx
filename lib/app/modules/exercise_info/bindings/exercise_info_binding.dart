import 'package:get/get.dart';

import '../controllers/exercise_info_controller.dart';

class ExerciseInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExerciseInfoController>(ExerciseInfoController());
  }
}
