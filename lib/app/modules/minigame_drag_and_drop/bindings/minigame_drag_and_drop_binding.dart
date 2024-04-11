import 'package:get/get.dart';

import '../controllers/minigame_drag_and_drop_controller.dart';

class MinigameDragAndDropBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MinigameDragAndDropController>(MinigameDragAndDropController());
  }
}
