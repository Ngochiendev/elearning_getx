import 'package:elearning/app/modules/eexam_views/eexam/controllers/eexam_controller.dart';
import 'package:get/get.dart';

class EexamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EexamController>(
      () => EexamController(),
    );
  }
}
