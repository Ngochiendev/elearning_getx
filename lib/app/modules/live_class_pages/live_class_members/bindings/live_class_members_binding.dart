import 'package:elearning/app/services/live_class_service.dart';
import 'package:get/get.dart';

import '../controllers/live_class_members_controller.dart';

class LiveClassMembersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LiveClassService());
    Get.lazyPut<LiveClassMembersController>(
      () => LiveClassMembersController(),
    );
  }
}
