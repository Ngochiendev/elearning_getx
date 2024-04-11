import 'package:get/get.dart';

import '../controllers/live_class_handup_controller.dart';

class LiveClassHandupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveClassHandupController>(
      () => LiveClassHandupController(),
    );
  }
}
