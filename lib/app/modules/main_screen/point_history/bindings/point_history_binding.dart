import 'package:get/get.dart';

import '../controllers/point_history_controller.dart';

class PointHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointHistoryController>(
      () => PointHistoryController(),
    );
  }
}
