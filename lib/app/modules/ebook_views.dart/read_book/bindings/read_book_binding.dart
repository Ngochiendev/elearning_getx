import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/controllers/ebook_details_controller.dart';
import 'package:get/get.dart';

import '../controllers/read_book_controller.dart';

class ReadBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadBookController>(
      () => ReadBookController(),
    );
    Get.lazyPut<EbookDetailsController>(
          () => EbookDetailsController(),
    );
    Get.put<CartProductController>(CartProductController());
  }
}
