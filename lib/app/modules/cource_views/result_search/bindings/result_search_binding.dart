import 'package:get/get.dart';

import '../controllers/result_search_controller.dart';

class ResultSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultSearchController>(
      () => ResultSearchController(),
    );
  }
}
