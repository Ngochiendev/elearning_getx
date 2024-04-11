import 'package:get/get.dart';

import '../controllers/read_ebook_controller.dart';

class ReadEbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadEbookController>(
      () => ReadEbookController(),
    );
  }
}
