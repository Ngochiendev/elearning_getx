import 'package:get/get.dart';

import '../controllers/empty_view_controller.dart';

class EmptyViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmptyViewController>(
      () => EmptyViewController(),
    );
  }
}
