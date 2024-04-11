import 'package:get/get.dart';

import '../controllers/payment_inapp_webview_controller.dart';

class PaymentInappWebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentInappWebviewController>(
      () => PaymentInappWebviewController(),
    );
  }
}
