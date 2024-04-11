import 'package:get/get.dart';

class ExamDetailController extends GetxController {
  //TODO: Implement ExamDetailController
  var nameClasses = [1, 2, 3, 4].obs;

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
