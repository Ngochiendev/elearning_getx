import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:get/get.dart';

import '../controllers/coure_trail_page_controller.dart';

class CoureTrailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoureTrailPageController>(
      () => CoureTrailPageController(),
    );
    Get.lazyPut<CartProductController>(
      () => CartProductController(),
    );
  }
}
