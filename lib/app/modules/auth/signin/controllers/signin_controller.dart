import 'dart:convert';

import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/teacher_model.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/user_service.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController
  final isSavePassword = false.obs;
  final isSecurePassword = true.obs;
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final buttonState = AppElevatedButtonState.inactive.obs;
  final isStudent = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    final currentUserName = GetStorage().read<String>(StorageBox.CurrentUser);
    final currentPass = GetStorage().read<String>(StorageBox.CurrentPass);
    final isSavedPassword = GetStorage().read<String>(StorageBox.CurrentSaved);
    if (isSavedPassword != null && isSavedPassword != "") {
      isSavePassword.value = isSavedPassword.toLowerCase() == 'true';

      if (isSavePassword.value) {
        if (currentUserName != null && currentUserName != "") {
          usernameCtrl.value = TextEditingValue(text: currentUserName);
        } else {
          usernameCtrl.value = TextEditingValue.empty;
        }
        if (currentPass != null && currentPass != "") {
          passwordCtrl.value = TextEditingValue(text: currentPass);
        } else {
          passwordCtrl.value = TextEditingValue.empty;
        }
        if (currentUserName != "" && currentPass != "") {
          buttonState.value = AppElevatedButtonState.active;
        }
      } else {
        usernameCtrl.value = TextEditingValue.empty;
        passwordCtrl.value = TextEditingValue.empty;
      }
    } else {
      isSavePassword.value = false;
      usernameCtrl.value = TextEditingValue.empty;
      passwordCtrl.value = TextEditingValue.empty;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void setIsSavePassword(bool isSavePass) {
    isSavePassword.value = isSavePass;
    if (isSavePass) {
      final username = usernameCtrl.text.trim();
      final password = passwordCtrl.text.trim();
      Get.find<UserService>().setUserNamePass(username, password);
    }
    Get.find<UserService>().setSavePassword(isSavePass.toString());
    update();
  }

  void setIsSecurePassword(bool isSecurePass) {
    isSecurePassword.value = isSecurePass;
    update();
  }

  void onChangeValue() {
    final username = usernameCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    if (username.length > 0 && password.length > 0) {
      buttonState.value = AppElevatedButtonState.active;
    } else {
      buttonState.value = AppElevatedButtonState.inactive;
    }
  }

  void saveUserNameAndPass() {}

  void userLogin() async {
    buttonState.value = AppElevatedButtonState.loading;
    final username = usernameCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    if (isSavePassword.value) {
      Get.find<UserService>().setUserNamePass(username, password);
    }
    if (checkPassLength(password)) {
      appSnackbar("Mật khẩu phải có ít nhất 8 kí tự", type: SnackbarType.error);
      buttonState.value = AppElevatedButtonState.active;
    } else {
      final response = await UserProvider.instance.userLogin(username, password);
      if (response.error.isEmpty) {
        Get.find<UserService>().setCurrentToken(response.data['data']['accessToken']);
        Get.find<UserService>().setUsers(UserModel.fromJson(response.data['data']['user']));
        // Get.find<UserService>().setIdUsers(response.data['data']['user']['id']);
        buttonState.value = AppElevatedButtonState.active;
        await GetStorage().write(StorageBox.IsStudent, isStudent.value);
        Get.offNamed(Routes.MAIN);
      } else {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: "Sai thông tin đăng nhập",
          ),
        );
        buttonState.value = AppElevatedButtonState.active;
      }
    }
  }

  void teacherLogin() async {
    buttonState.value = AppElevatedButtonState.loading;
    final username = usernameCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    Get.find<UserService>().setUserNamePass(username, password);
    final response = await UserProvider.instance.teacherLogin(username, password);
    if (response.error.isEmpty) {
      Get.find<UserService>().setCurrentToken(response.data['data']['accessToken']);
      Get.find<UserService>().setTeacher(TeacherModel.fromJson(response.data['data']['teacher']));
      buttonState.value = AppElevatedButtonState.active;
      await GetStorage().write(StorageBox.IsStudent, isStudent.value);
      Get.offNamed(Routes.MAIN);
    } else {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: "Sai thông tin đăng nhập",
        ),
      );
      buttonState.value = AppElevatedButtonState.active;
    }
  }
}
