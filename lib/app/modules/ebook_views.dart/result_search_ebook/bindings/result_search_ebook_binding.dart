import 'package:get/get.dart';

import '../controllers/result_search_ebook_controller.dart';

class ResultSearchEbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultSearchEbookController>(
      () => ResultSearchEbookController(),
    );
  }
}
