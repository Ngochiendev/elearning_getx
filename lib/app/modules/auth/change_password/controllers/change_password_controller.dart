import 'dart:convert';

import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordController extends GetxController {
  //TODO: Implement ChangePasswordController
  final changePasswordButtonState = AppElevatedButtonState.inactive.obs;
  final passwordCtrl = TextEditingController();
  final newPasswordCtrl = TextEditingController();
  final conFimPasswordCtrl = TextEditingController();
  final count = 0.obs;
  final box = GetStorage();
  final userCurrent = UserModel().obs;
  final IdUser = "".obs;
  final isSecureOldPassword = true.obs;
  final isSecureNewPassword = true.obs;
  final isSecureConFirmPassword = true.obs;
  @override
  void onInit() {
    super.onInit();
    final value = box.read<String>(StorageBox.IdUser);

    if (value != null) {
      IdUser.value = value;
      print("useModel$value");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void onChangeValue() {
    final password = passwordCtrl.text.trim();
    final newPassword = passwordCtrl.text.trim();
    final conFirmPassword = conFimPasswordCtrl.text.trim();
    if (password.length > 0 &&
        newPassword.length > 0 &&
        conFirmPassword.length > 0) {
      changePasswordButtonState.value = AppElevatedButtonState.active;
    } else {
      changePasswordButtonState.value = AppElevatedButtonState.inactive;
    }
  }

  void setIsSecureOldPassword(bool isSecurePass) {
    isSecureOldPassword.value = isSecurePass;
    update();
  }

  void setIsSecureNewPassword(bool isSecurePass) {
    isSecureNewPassword.value = isSecurePass;
    update();
  }

  void setIsSecureConFirmPassword(bool isSecurePass) {
    isSecureConFirmPassword.value = isSecurePass;
    update();
  }

  void changePass() async {
    changePasswordButtonState.value = AppElevatedButtonState.loading;
    final oldPassWord = passwordCtrl.text.trim();
    final newPassWord = newPasswordCtrl.text.trim();
    final confPassWord = conFimPasswordCtrl.text.trim();
    if (checkPassLength(newPassWord)) {
      changePasswordButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_password_length_error.tr,
          type: SnackbarType.error);
    }
    if (newPassWord != confPassWord) {
      appSnackbar(LocaleKeys.notifi_checkpass_confirmpass.tr,
          type: SnackbarType.error);
      changePasswordButtonState.value = AppElevatedButtonState.active;
    } else {
      print("uid ${userCurrent.value.roles}");
      final response = await UserProvider.instance
          .changePassWord(IdUser.value, oldPassWord, newPassWord, confPassWord);
      if (response.error.isEmpty) {

        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlertSignUp(context,
              showButon: true, png: false, onPressed: () {
            Get.back();
          },
              assets: R.ASSETS_SVG_POPUP_RESSULT_HIGH_SVG,
              titleButton: "Đóng",
              title: LocaleKeys.notifi_change_pass_success_title.tr,
              subTitle: LocaleKeys.notifi_change_pass_success_subtitle.tr),
        );
        changePasswordButtonState.value = AppElevatedButtonState.active;

      } else {
        final error = response.data['error']["message"];
        changePasswordButtonState.value = AppElevatedButtonState.active;
        appSnackbar(error, type: SnackbarType.error);
      }
    }
  }
}
