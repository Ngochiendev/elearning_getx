import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/cource_views/coure_trail_page/controllers/coure_trail_page_controller.dart';
import 'package:get/get.dart';

import '../controllers/cource_details_controller.dart';

class CourceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourceDetailsController>(
      () => CourceDetailsController(),
    );
    Get.lazyPut<CartProductController>(
      () => CartProductController(),
    );
    // Get.lazyPut<CoureTrailPageController>(
    //   () => CoureTrailPageController(),
    // );
  }
}
