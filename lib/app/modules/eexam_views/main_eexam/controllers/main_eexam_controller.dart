import 'package:get/get.dart';

class MainEexamController extends GetxController {
  //TODO: Implement MainEexamController
  final tabIndex = 0.obs;

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
  void changeTabIndex(int index) async {
    tabIndex.value = index;
  }
}
