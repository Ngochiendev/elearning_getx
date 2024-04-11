import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/city_model.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final count = 0.obs;
  final country = ''.obs;
  final usernameCtrl = TextEditingController();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final phoneNumberCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final yourEmailCtrl = TextEditingController();
  final otpCtrl = TextEditingController();
  final parentEmailCtrl = TextEditingController();
  final provinceCtrl = TextEditingController();
  final schoolCtrl = TextEditingController();
  final classCtrl = TextEditingController();
  final cityModel = CityModel().obs;
  final listProvince = List<Province>.empty(growable: true).obs;
  final selectProvince = false.obs;
  final nextStepButtonState = AppElevatedButtonState.inactive.obs;
  final submitOTPButtonState = AppElevatedButtonState.inactive.obs;
  final signUpButtonState = AppElevatedButtonState.active.obs;
  final isSecurePassword = true.obs;
  final nextStep = false.obs;
  final nextOTP = false.obs;
  final provinceId = 0.obs;
  final registerButtonState = AppElevatedButtonState.inactive.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getProvince();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void setIsSecurePassword(bool isSecurePass) {
    isSecurePassword.value = isSecurePass;
    update();
  }

  void onChangeValue() {
    final username = usernameCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    final phone = phoneNumberCtrl.text.trim();
    final firstName = firstNameCtrl.text.trim();
    final lastName = lastNameCtrl.text.trim();
    final otp = otpCtrl.text.trim();
    // final password = passwordCtrl.text.trim();
    if (username.length > 0 &&
        password.length > 0 &&
        phone.length > 0 &&
        firstName.length > 0 &&
        lastName.length > 0) {
      nextStepButtonState.value = AppElevatedButtonState.active;
    } else {
      nextStepButtonState.value = AppElevatedButtonState.inactive;
    }
  }

  void getProvince() async {
    final response = await UserProvider.instance.getProvince();
    if (response.error.isEmpty) {
      cityModel.value = CityModel.fromJson(response.data);
      listProvince.value = cityModel.value.data!.provinces!;
    } else {
      listProvince.value = [];
    }
  }

  void onChangeOtpValue() {
    final otp = otpCtrl.text.trim();
    // final password = passwordCtrl.text.trim();
    if (otp.length > 0) {
      submitOTPButtonState.value = AppElevatedButtonState.active;
    } else {
      submitOTPButtonState.value = AppElevatedButtonState.inactive;
    }
  }

  void onSelectCountry(String name, int id) {
    country.value = name;
    print(name);
    provinceCtrl.text = country.toString();
    provinceId.value = id;
  }

  void onNextStep() {
    final username = usernameCtrl.text.trim();
    // final fullNameCtrl = TextEditingController();
    // final phoneNumberCtrl = TextEditingController();
    String regexUsername = r'^[a-zA-Z0-9]+$';
    String regexPassWord = r'^[a-zA-Z0-9\S.]+$';
    String regexPhone = r'^((09|03|07|08|05)+([0-9]{8})\b)$';
    String regexFullname =
        r'^[a-zA-Z\sÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$';
    final password = passwordCtrl.text.trim();
    if (checkPassLength(password)) {
      signUpButtonState.value = AppElevatedButtonState.active;
      nextStep.value = false;
      return appSnackbar(LocaleKeys.notifi_password_length_error.tr,
          type: SnackbarType.error);
    } else {
      nextStep.value = true;
    }

    if (checkFormat(regexUsername, username) == false) {
      signUpButtonState.value = AppElevatedButtonState.active;
      nextStep.value = false;
      return appSnackbar(LocaleKeys.notifi_username_special_characters_error.tr,
          type: SnackbarType.error);
    } else {
      nextStep.value = true;
    }
    if (!checkFormat(regexPhone, phoneNumberCtrl.text.trim())) {
      signUpButtonState.value = AppElevatedButtonState.active;
      nextStep.value = false;
      return appSnackbar(LocaleKeys.notifi_phone_format_error.tr,
          type: SnackbarType.error);
    } else {
      nextStep.value = true;
    }
    if (!checkFormat(regexFullname, firstNameCtrl.text.trim())) {
      signUpButtonState.value = AppElevatedButtonState.active;
      nextStep.value = false;
      return appSnackbar(LocaleKeys.notifi_firstname_format_error.tr,
          type: SnackbarType.error);
    } else {
      nextStep.value = true;
    }
    if (!checkFormat(regexFullname, lastNameCtrl.text.trim())) {
      signUpButtonState.value = AppElevatedButtonState.active;
      nextStep.value = false;
      return appSnackbar(LocaleKeys.notifi_lastname_format_error.tr,
          type: SnackbarType.error);
    } else {
      nextStep.value = true;
    }
    if (!checkFormat(regexPassWord, password)) {
      signUpButtonState.value = AppElevatedButtonState.active;
      nextStep.value = false;
      return appSnackbar(LocaleKeys.notifi_password_format_error.tr,
          type: SnackbarType.error);
    } else {
      nextStep.value = true;
    }
  }

  void registerNewUser() async {
    nextStepButtonState.value = AppElevatedButtonState.loading;
    signUpButtonState.value = AppElevatedButtonState.loading;

    final yourEmail = yourEmailCtrl.text.trim();
    final parrentEmail = parentEmailCtrl.text.trim();
    final province = provinceId.value == 0 ? 0 : provinceId.value;
    final school = schoolCtrl.text.trim();
    final classTf = classCtrl.text.trim();
    String regex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    if (yourEmail.isEmpty) {
      signUpButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_email_format_error.tr,
          type: SnackbarType.error);
    }
    if (checkFormat(regex, yourEmail) == false) {
      signUpButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_invalid_youremail_error.tr,
          type: SnackbarType.error);
    }
    if (parrentEmail.isEmpty) {
      signUpButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_partentemail_format_error.tr,
          type: SnackbarType.error);
    }
    if (checkFormat(regex, parrentEmail) == false) {
      signUpButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_invalid_partentemail_error.tr,
          type: SnackbarType.error);
    }
    if (provinceId.value == 0) {
      signUpButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_province_invalid.tr,
          type: SnackbarType.error);
    }

    print(usernameCtrl.text.trim());
    final response = await UserProvider.instance.registerNewUser(
        usernameCtrl.text.trim(),
        firstNameCtrl.text.trim(),
        lastNameCtrl.text.trim(),
        phoneNumberCtrl.text.trim(),
        passwordCtrl.text.trim(),
        yourEmail,
        parrentEmail,
        province,
        school,
        classTf);
    if (response.error.isEmpty) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlertSignUp(context,
            assets: R.ASSETS_SVG_POPUP_RESSULT_HIGH_SVG,
            onPressed: () {},
            title: LocaleKeys.notifi_singup_success_title.tr,
            subTitle: LocaleKeys.notifi_singup_success_subtitle.tr),
      );
      // appSnackbar("Đăng kí thành công.", type: SnackbarType.success);
      nextStepButtonState.value = AppElevatedButtonState.active;
      signUpButtonState.value = AppElevatedButtonState.active;
      // Get.back();
    } else {
      List<String> coded = ["{username: [", "{email: [", "]}"]; //ABV list
      List<String> decoded = ["", "", ""]; //corresponding list
      Map<String, String> map = new Map.fromIterables(coded, decoded);

      final error = response.data['error']['messages'].toString();
      final errors = map.entries
          .fold(error, (p, e) => p!.toString().replaceAll(e.key, e.value));
      print(errors);
      nextStep.value = false;
      nextOTP.value = false;
      signUpButtonState.value = AppElevatedButtonState.active;
      nextStepButtonState.value = AppElevatedButtonState.active;
      appSnackbar(errors, type: SnackbarType.error);
    }
  }

  void verifyOTP() async {
    submitOTPButtonState.value = AppElevatedButtonState.loading;
    final yourEmail = yourEmailCtrl.text.trim();
    final otp = otpCtrl.text.trim();

    final response = await UserProvider.instance.verifyOtp(yourEmail, otp);
    if (response.error.isEmpty) {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlertSignUp(context,
            showButon: true,
            png: true,
            titleButton: "Đăng Nhập", onPressed: () {
          Get.toNamed(Routes.SIGNIN);
        },
            assets: R.ASSETS_PNG_BANNER_4_PNG,
            title: LocaleKeys.notifi_active_account_success_title.tr,
            subTitle: LocaleKeys.notifi_active_account_success_subtitle.tr),
      );
      submitOTPButtonState.value = AppElevatedButtonState.active;

      // Get.back();
    } else {
      final error = response.data['error'];
      submitOTPButtonState.value = AppElevatedButtonState.active;
      appSnackbar(error, type: SnackbarType.error);
    }
  }
}
