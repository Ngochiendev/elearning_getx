import 'package:elearning/app/modules/main_screen/main/controllers/main_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/user_service.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

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
  tapLogout() async {
    Get.find<UserService>().signOut();

    Get.find<MainController>().changeTabIndex(0);
    Get.until((route) => route.isFirst);
    Get.toNamed(Routes.SIGNIN);
  }
}
