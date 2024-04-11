import 'package:get/get.dart';

import '../controllers/exercise_list_controller.dart';

class ExerciseListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExerciseListController>(ExerciseListController());
  }
}
