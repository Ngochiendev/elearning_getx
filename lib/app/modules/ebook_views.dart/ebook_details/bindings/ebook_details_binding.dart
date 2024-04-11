import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/main_screen/book_progress/controllers/book_progress_controller.dart';
import 'package:get/get.dart';

import '../controllers/ebook_details_controller.dart';

class EbookDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookDetailsController>(
      () => EbookDetailsController(),
    );
    Get.lazyPut<BookProgressController>(
          () => BookProgressController(),
    );
     Get.lazyPut<CartProductController>(
      () => CartProductController(),
    );
  }
}
