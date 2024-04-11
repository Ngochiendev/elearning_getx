import 'package:get/get.dart';

import '../controllers/live_class_textbook_controller.dart';

class LiveClassTextbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveClassTextbookController>(
      () => LiveClassTextbookController(),
    );
  }
}
