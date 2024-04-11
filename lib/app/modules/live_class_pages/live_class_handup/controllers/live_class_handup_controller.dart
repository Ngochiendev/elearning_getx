import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/data/providers/liveclass_provider.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/controllers/live_class_home_controller.dart';
import 'package:get/get.dart';

class LiveClassHandupController extends GetxController {
  //TODO: Implement LiveClassHandupController

  final listHanddUp = List<ListNotificationModel>.empty(growable: true).obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    listHanddUp.value = Get.arguments ?? [];
    update();
  }

  @override
  void onClose() {}

  onTapDelete() async {
    if (listHanddUp != null && listHanddUp.length > 0) {
      final data = listHanddUp.first;
      final listDown = listHanddUp.map((element) => "${element.id}").toList();
      final response = await LiveClassProvider.instance.deleteHandDown(data.roomId ?? 0, listDown);
      if (response.error.isEmpty) {
        listHanddUp.clear();
        Get.find<LiveClassHomeController>().listReadHandUp.clear();
        appSnackbar("Đã Hạ thành công", type: SnackbarType.success);
        update();
      }
    }
  }
}
