import 'package:get/get.dart';

import '../controllers/minigame_reorder_controller.dart';

class MinigameReorderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MinigameReorderController>(MinigameReorderController());
  }
}
