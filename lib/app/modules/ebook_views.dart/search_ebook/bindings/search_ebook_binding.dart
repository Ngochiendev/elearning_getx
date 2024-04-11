import 'package:get/get.dart';

import '../controllers/search_ebook_controller.dart';

class SearchEbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchEbookController>(
      () => SearchEbookController(),
    );
  }
}
