import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:get/get.dart';

import '../controllers/coure_learn_controller.dart';

class CoureLearnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoureLearnController>(
      () => CoureLearnController(),
    );
    Get.lazyPut<CartProductController>(
          () => CartProductController(),  
    );
  }
}
