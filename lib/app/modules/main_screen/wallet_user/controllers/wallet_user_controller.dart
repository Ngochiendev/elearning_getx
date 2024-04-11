import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/history_payment_model.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/modules/main_screen/home/controllers/home_controller.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WalletUserController extends GetxController {
  //TODO: Implement WalletUserController

  final count = 0.obs;
  final RxInt walletUser = 0.obs;
  final codeCtrl = TextEditingController();
  final buttonState = AppElevatedButtonState.inactive.obs;
  final profileController = Get.find<ProfileController>();
  final homeController = Get.find<HomeController>();
  final historyModel = PaymentHistory().obs;
  RefreshController? refreshController;
  final listHistory = List<Wallet>.empty(growable: true).obs;
  final list = List<Wallet>.empty(growable: true).obs;
  final page = 1.obs;
  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void onReady() async {
    super.onReady();
    getWallet();
    await gethistory(page.value);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void getWallet() async {
    final response = await UserProvider.instance.getWalletUser();
    if (response.error.isEmpty) {
      print("point ${response.data['data']['balance']}");
      walletUser.value = response.data['data']['balance'].toInt();
    } else {
      walletUser.value = 0;
    }
  }

  void loaDing() async {
    await gethistory(page.value + 1);
    refreshController!.loadComplete();
  }

  Future gethistory(int pages) async {
    final response =
        await UserProvider.instance.getHistoryWallet(pages, "DESC");
    if (response.error.isEmpty) {
      historyModel.value = PaymentHistory.fromJson(response.data);
      final list1 = historyModel.value.data?.wallet!;
      if (list1 != null && list1.length > 0) {
        for (var item in list1) {
          list.add(item);
        }
        listHistory.value = list;
      }
      page.value = historyModel.value.data!.pagination!.page ?? 1;
    } else {
      listHistory.value = [];
    }
  }

  void onchange(String value) {
    final code = codeCtrl.value.text.trim();
    if (value.length > 0) {
      buttonState.value = AppElevatedButtonState.active;
    } else {
      buttonState.value = AppElevatedButtonState.inactive;
    }
  }

  void rechargeCodes() async {
    buttonState.value = AppElevatedButtonState.loading;
    final code = codeCtrl.value.text.trim();
    final response = await UserProvider.instance.rechargeCodes(code);
    if (response.error.isEmpty) {
      // print("point ${response.data['data']['balance']}");
      // pointCtrl.value = response.data['data']['balance'];
      codeCtrl.clear();
      Get.close(2);
      profileController.getEPoint();
      profileController.getWallet();
      homeController.getEPoint();
      homeController.getWallet();
      buttonState.value = AppElevatedButtonState.active;
      appSnackbar("Nạp tiền thành công", type: SnackbarType.success);
    } else {
      // pointCtrl.value = 0;
      buttonState.value = AppElevatedButtonState.active;
      appSnackbar("Nạp tiền không thành công, mã nạp không hợp lệ ",
          type: SnackbarType.error);
    }
  }
}
