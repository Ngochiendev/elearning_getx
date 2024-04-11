import 'package:elearning/app/modules/ebook_views.dart/ebook/controllers/ebook_controller.dart';
import 'package:get/get.dart';

class EbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookController>(
      () => EbookController(),
    );
  }
}
