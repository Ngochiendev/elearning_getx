import 'package:get/get.dart';

import '../controllers/detal_teacher_controller.dart';

class DetalTeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetalTeacherController>(
      () => DetalTeacherController(),
    );
  }
}
