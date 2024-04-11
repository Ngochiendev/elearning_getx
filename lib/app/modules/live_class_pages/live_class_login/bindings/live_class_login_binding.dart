import 'package:elearning/app/services/live_class_service.dart';
import 'package:get/get.dart';

import '../controllers/live_class_login_controller.dart';

class LiveClassLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LiveClassService());
    Get.lazyPut<LiveClassLoginController>(
      () => LiveClassLoginController(),
    );
  }
}
