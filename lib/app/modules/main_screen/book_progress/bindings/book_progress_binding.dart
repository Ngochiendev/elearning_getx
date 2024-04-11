import 'package:get/get.dart';

import '../controllers/book_progress_controller.dart';

class BookProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookProgressController>(
      () => BookProgressController(),
    );
  }
}
