import 'package:get/get.dart';

import '../controllers/live_class_onboard_controller.dart';

class LiveClassOnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveClassOnboardController>(
      () => LiveClassOnboardController(),
    );
  }
}
