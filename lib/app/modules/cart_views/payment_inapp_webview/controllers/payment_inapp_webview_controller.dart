import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/data/models/cart_model.dart';
import 'package:elearning/app/modules/cart_views/cart_payment_banking/controllers/cart_payment_banking_controller.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PaymentInappWebviewController extends GetxController {
  //TODO: Implement PaymentInappWebviewController
  final progress = 0.0.obs;

  final url = "".obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    url.value = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void checkStatus(Uri url) {
    final controllerPay = Get.find<CartPaymentBankingController>();
    print("onloadTop $url");
    final code = url.queryParameters['vnp_ResponseCode'];
    if (code != null) {
      if (code == "00") {
        controllerPay.stateButton.value = AppElevatedButtonState.active;
        controllerPay.coursePackages.clear();
        controllerPay.bookPackages.clear();
        controllerPay.isPaymentDone.value = true;
        Get.find<CartProductController>().listCart.clear();

        Get.find<CartProductController>().cartCource.value = CartClass();
        Get.find<CartProductController>().cartBook.value = CartClass();
        controllerPay.profileController.getEPoint();
        controllerPay.profileController.getWallet();
        controllerPay.homeController.getEPoint();
        controllerPay.homeController.getWallet();
        Get.back();
      } else {
        controllerPay.stateButton.value = AppElevatedButtonState.active;
        controllerPay.isPaymentError.value = true;
        Get.back();
      }
    }
    print("onloadTop $code");
  }
}
