import 'package:elearning/app/modules/cart_views/cart_payment_banking/controllers/cart_payment_banking_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';

import '../controllers/payment_inapp_webview_controller.dart';

class PaymentInappWebviewView extends GetView<PaymentInappWebviewController> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late InAppWebViewController webcontroller;

  @override
  Widget build(BuildContext context) {
    final controllerPay = Get.find<CartPaymentBankingController>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Thanh toán',
          style: typoBold24,
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Container(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest:
                  URLRequest(url: Uri.parse(controller.url.value)),
              onWebViewCreated: (InAppWebViewController controller) {
                webcontroller = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controllers, int progress) {
                controller.progress.value = progress / 100;
              },
              onLoadStop: (InAppWebViewController controllers, Uri? url) {
                // hideLoading();
                controller.checkStatus(url!);
              },
              // shouldOverrideUrlLoading: (InAppWebViewController controller,
              //     NavigationAction? navigationAction) {
              //   return true;
              // },
            ),
            controller.progress.value < 1
                ? SizedBox(
                    height: 3,
                    child: LinearProgressIndicator(
                        value: controller.progress.value,
                        backgroundColor: colorPrimaryBlue100),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
