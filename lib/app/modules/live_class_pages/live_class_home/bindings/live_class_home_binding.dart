import 'package:elearning/app/services/live_class_service.dart';
import 'package:get/get.dart';

import '../controllers/live_class_home_controller.dart';

class LiveClassHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LiveClassService());
    Get.lazyPut<LiveClassHomeController>(
      () => LiveClassHomeController(),
    );
  }
}
