import 'package:elearning/app/data/models/point_history.dart';
import 'package:elearning/app/data/providers/profile_provider.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class PointHistoryController extends GetxController {
  //TODO: Implement PointHistoryController
  final listPointHistory = List<Wallet>.empty(growable: true).obs;
  final point = 0.obs;
  final pointHistoryModel = PointHistory().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    point.value = Get.find<ProfileController>().pointCtrl.toInt();
    getPointHistory();
  }

  @override
  void onClose() {}
  void getPointHistory() async {
    final response = await ProfileProvider.instance.getHistoryEPoint();
    if (response.error.isEmpty) {
      pointHistoryModel.value = PointHistory.fromJson(response.data);

      listPointHistory.value = pointHistoryModel.value.data!.wallet!;
      // update();
      print(listPointHistory.length);
    } else {
      listPointHistory.value = [];
    }
  }
}
