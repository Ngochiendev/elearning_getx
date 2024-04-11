import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/services/user_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Get.find<LiveClassService>().connectSocket();
  }

  @override
  void onReady() {
    super.onReady();

    _showApp();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _showApp() async {
    final value = GetStorage().read<String>(StorageBox.ShowOnboarding);
    if (value == 'shown') {
      final token = GetStorage().read<String>(StorageBox.CurrentToken);
      final idUser = GetStorage().read<String>(StorageBox.IdUser);
      if (token != null && token.length > 0) {
        await Get.find<UserService>().setCurrentToken(token);
        await Get.find<UserService>().setCurrentId(idUser ?? "");
        if (!Get.find<UserService>().isAuthentication()) {
          Get.offAndToNamed(Routes.SIGNIN);
          return;
        } else {
          StorageBox.isExpired = "false";
          Get.offAndToNamed(Routes.MAIN);
        }
      } else {
        Get.offAndToNamed(Routes.SIGNIN);
      }
    } else {
      Get.offAndToNamed(Routes.ONBOARDING);
      GetStorage().write(StorageBox.ShowOnboarding, 'shown');
    }
    // Future.delayed(const Duration(seconds: 2), () {
    //   Get.offAndToNamed(Routes.MAIN);
    // });
    // if (kDebugMode) {
    //   Get.offAndToNamed(Routes.EXERCISE_INFO);
    // } else {
    //   Get.offAndToNamed(Routes.MAIN);
    // }
  }
}
