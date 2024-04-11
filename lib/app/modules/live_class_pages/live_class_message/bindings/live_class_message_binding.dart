import 'package:elearning/app/services/live_class_service.dart';
import 'package:get/get.dart';

import '../controllers/live_class_message_controller.dart';

class LiveClassMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LiveClassService());
    Get.lazyPut<LiveClassMessageController>(
      () => LiveClassMessageController(),
    );
  }
}
