import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class ForgotPassController extends GetxController {
  //TODO: Implement ForgotPassController
  final submitOTPButtonState = AppElevatedButtonState.inactive.obs;
  final submitForgotButtonState = AppElevatedButtonState.inactive.obs;
  CountdownController? countdownController;
  final usernameCtrl = TextEditingController();
  final passwordCtrltwo = TextEditingController();
  final passwordCtrlthree = TextEditingController();
  final emailOtpCtrl = TextEditingController();
  final nextStep = false.obs;
  final showError = false.obs;
  final showResend = false.obs;
  final securePass = true.obs;
  final secureConfPass = true.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    countdownController = CountdownController(
        duration: Duration(minutes: 5, seconds: 0), onEnd: onEnd);
  }

  @override
  void onReady() {
    super.onReady();

    countdownController!.start();
  }

  @override
  void onClose() {
    countdownController!.stop();
  }

  void increment() => count.value++;
  void onEnd() {
    print('onEnd');
    showResend.value = true;
  }

  void onChangeValue() {
    final username = usernameCtrl.text.trim();
    final password = passwordCtrlthree.text.trim();
    final confPassword = passwordCtrltwo.text.trim();
    if (username.length > 0) {
      submitOTPButtonState.value = AppElevatedButtonState.active;
    } else {
      submitOTPButtonState.value = AppElevatedButtonState.inactive;
    }
  }

  void onChangePassValue() {
    final password = passwordCtrlthree.text.trim();
    final confPassword = passwordCtrltwo.text.trim();
    if (password.length > 0 && confPassword.length > 0) {
      submitForgotButtonState.value = AppElevatedButtonState.active;
    } else {
      submitForgotButtonState.value = AppElevatedButtonState.inactive;
    }
  }

  void onNextStep() {
    final username = usernameCtrl.text.trim();
    // final fullNameCtrl = TextEditingController();
    // final phoneNumberCtrl = TextEditingController();
    // final password = passwordCtrl.text.trim();
    // if (username.isEmpty || fullNameCtrl.isEmpty || phoneNumberCtrl.isEmpty || password.isEmpty) {
    //   showDialog(
    //     context: Get.context!,
    //     builder: (BuildContext context) => dialogAlert(
    //       context,
    //       message: "Vui lòng điền tên đăng nhập hoặc mật khẩu",
    //     ),
    //   );
    //   return;
    // }
    nextStep.value = true;
  }

  void onchangeSecurePass(bool check) {
    securePass.value = check;
    update();
  }

  void onchangeSecureConfPass(bool check) {
    secureConfPass.value = check;
    update();
  }

  void forgotPassWord() async {
    showResend.value = false;
    countdownController!.start();
    submitOTPButtonState.value = AppElevatedButtonState.loading;
    final yourEmail = usernameCtrl.text.trim();
    print(yourEmail);
    String regex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    if (checkFormat(regex, yourEmail) == false) {
      nextStep.value = false;
      submitOTPButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_invalid_youremail_error.tr,
          type: SnackbarType.error);
    } else {
      final response = await UserProvider.instance.changPasswordUser(yourEmail);

      if (response.error.isEmpty) {
        appSnackbar(LocaleKeys.notifi_otp_send.tr, type: SnackbarType.success);
        submitOTPButtonState.value = AppElevatedButtonState.active;
        nextStep.value = true;
        // Get.back();
      } else {
        submitOTPButtonState.value = AppElevatedButtonState.active;
        final error = response.data['error']['message'];
        if (error == "No data available")
          return appSnackbar(LocaleKeys.notifi_no_email_available.tr,
              type: SnackbarType.error);
      }
    }
  }

  void newPassword() async {
    submitForgotButtonState.value = AppElevatedButtonState.loading;
    final yourEmail = usernameCtrl.text.trim();
    final yourPassNew = passwordCtrltwo.text.trim();
    final yourCheckPass = passwordCtrlthree.text.trim();
    final yourOTP = emailOtpCtrl.text.trim();
    if (checkPassLength(yourPassNew)) {
      submitForgotButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_password_length_error.tr,
          type: SnackbarType.error);
    }
    if (yourPassNew == yourCheckPass) {
      showError.value = false;
      final response = await UserProvider.instance
          .newPasswordUser(yourEmail, yourOTP, yourPassNew);
      if (response.error.isEmpty) {
        appSnackbar(LocaleKeys.notifi_change_pass_success.tr,
            type: SnackbarType.success);
        submitForgotButtonState.value = AppElevatedButtonState.active;
        Future.delayed(Duration(seconds: 2));
        Get.toNamed(Routes.SIGNIN);
        appSnackbar(
            "Thay đổi mật khẩu mới thành công", type: SnackbarType.success
        );
        submitForgotButtonState.value=AppElevatedButtonState.active;
      } else {
        final error = response.data['error']['message'];
        appSnackbar(error, type: SnackbarType.error);
        submitForgotButtonState.value = AppElevatedButtonState.active;
      }
    } else {
      submitForgotButtonState.value = AppElevatedButtonState.active;
      showError.value = true;
    }
  }
}
