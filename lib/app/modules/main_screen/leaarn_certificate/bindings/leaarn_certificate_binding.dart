import 'package:elearning/app/modules/main_screen/leaarn_exercise_resoult/controllers/leaarn_exercise_result_controller.dart';
import 'package:get/get.dart';

import '../controllers/leaarn_certificate_controller.dart';

class LeaarnCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaarnCertificateController>(
      () => LeaarnCertificateController(),
    );
  }
}
