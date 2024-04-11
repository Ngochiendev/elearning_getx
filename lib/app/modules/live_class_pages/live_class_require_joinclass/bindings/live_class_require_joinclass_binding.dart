import 'package:elearning/app/services/live_class_service.dart';
import 'package:get/get.dart';

import '../controllers/live_class_require_joinclass_controller.dart';

class LiveClassRequireJoinclassBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LiveClassService());
    Get.lazyPut<LiveClassRequireJoinclassController>(
      () => LiveClassRequireJoinclassController(),
    );
  }
}
