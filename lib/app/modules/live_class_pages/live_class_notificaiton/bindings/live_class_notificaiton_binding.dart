import 'package:get/get.dart';

import '../controllers/live_class_notificaiton_controller.dart';

class LiveClassNotificaitonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveClassNotificaitonController>(
      () => LiveClassNotificaitonController(),
    );
  }
}
