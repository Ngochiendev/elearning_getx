import 'package:get/get.dart';

class MainController extends GetxController {
  final tabIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTabIndex(int index) async {
    tabIndex.value = index;
  }
}
