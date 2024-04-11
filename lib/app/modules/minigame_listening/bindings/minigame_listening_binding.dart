import 'package:get/get.dart';

import '../controllers/minigame_listening_controller.dart';

class MinigameListeningBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MinigameListeningController>(MinigameListeningController());
  }
}
