import 'package:get/get.dart';

import '../controllers/notifyexam_controller.dart';

class NotifyexamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifyexamController>(
      () => NotifyexamController(),
    );
  }
}
