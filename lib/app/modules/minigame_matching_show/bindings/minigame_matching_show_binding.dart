import 'package:get/get.dart';

import '../controllers/minigame_matching_show_controller.dart';

class MinigameMatchingShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MinigameMatchingShowController>(MinigameMatchingShowController());
  }
}
