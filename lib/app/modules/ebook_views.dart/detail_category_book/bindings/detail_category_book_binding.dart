import 'package:get/get.dart';

import '../controllers/detail_category_book_controller.dart';

class DetailCategoryBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCategoryBookController>(
      () => DetailCategoryBookController(),
    );
  }
}
