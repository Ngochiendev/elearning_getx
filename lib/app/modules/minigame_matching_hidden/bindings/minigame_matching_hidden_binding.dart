import 'package:get/get.dart';

import '../controllers/minigame_matching_hidden_controller.dart';

class MinigameMatchingHiddenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MinigameMatchingHiddenController>(MinigameMatchingHiddenController());
  }
}
