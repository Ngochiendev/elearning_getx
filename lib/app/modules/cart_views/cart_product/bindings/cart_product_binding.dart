import 'package:get/get.dart';

import '../controllers/cart_product_controller.dart';

class CartProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartProductController>(
      () => CartProductController(),
    );
  }
}
