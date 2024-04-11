import 'package:get/get.dart';

import '../controllers/cart_discount_code_controller.dart';

class CartDiscountCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartDiscountCodeController>(
      () => CartDiscountCodeController(),
    );
  }
}
