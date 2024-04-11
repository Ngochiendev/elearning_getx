import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/data/providers/liveclass_provider.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/controllers/live_class_home_controller.dart';
import 'package:get/get.dart';

class LiveClassNotificaitonController extends GetxController {
  //TODO: Implement LiveClassNotificaitonController

  final listNotis = List<ListNotificationModel>.empty(growable: true).obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    listNotis.value = Get.arguments ?? [];
    update();
  }

  @override
  void onClose() {}

  onTapDelete() async {
    final response = await LiveClassProvider.instance.deleteAllNotification();
    if (response.error.isEmpty) {
      listNotis.clear();
      Get.find<LiveClassHomeController>().listNotis.clear();
      appSnackbar("Đã xóa thành công.", type: SnackbarType.success);
      update();
    }
  }
}
