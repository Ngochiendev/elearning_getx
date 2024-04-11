import 'package:get/get.dart';

import '../controllers/minigame_text_answer_controller.dart';

class MinigameTextAnswerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MinigameTextAnswerController>(MinigameTextAnswerController());
  }
}
