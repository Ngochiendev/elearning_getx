import 'package:elearning/app/modules/main_screen/book_progress/controllers/book_progress_controller.dart';
import 'package:get/get.dart';

import '../controllers/my_ebook_controller.dart';

class MyEbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyEbookController>(
      () => MyEbookController(),
    );
    Get.lazyPut<BookProgressController>(
          () => BookProgressController(),
    );
  }
}
