import 'package:get/get.dart';

class MyEbookController extends GetxController {
  //TODO: Implement MyEbookController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
