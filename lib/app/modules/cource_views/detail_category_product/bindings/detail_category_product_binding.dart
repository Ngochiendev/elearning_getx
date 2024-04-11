import 'package:get/get.dart';

import '../controllers/detail_category_product_controller.dart';

class DetailCategoryProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCategoryProductController>(
      () => DetailCategoryProductController(),
    );
  }
}
