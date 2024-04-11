import 'dart:io';

import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/city_model.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:elearning/app/data/providers/profile_provider.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/modules/main_screen/main/controllers/main_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final RxInt pointCtrl = 0.obs;
  
  final RxInt walletUser = 0.obs;
  final userModel = UserModel().obs;
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final yourEmailCtrl = TextEditingController();
  final parentEmailCtrl = TextEditingController();
  final provinceCtrl = TextEditingController();
  final schoolCtrl = TextEditingController();
  final classCtrl = TextEditingController();
  final updateButtonState = AppElevatedButtonState.active.obs;
  final idUser = "".obs;
  final country = ''.obs;
  final box = GetStorage();
  final provinceId = 0.obs;
  final cityModel = CityModel().obs;
  final listProvince = List<Province>.empty(growable: true).obs;
  final file = File("").obs;
  @override
  void onInit() {
    super.onInit();
    print("onInit");
    final value = box.read<String>(StorageBox.IdUser);

    if (value != null) {
      idUser.value = value;
      print("useModel$value");
    }
  }

  @override
  void onReady() {
    super.onReady();
    print("onReady");
    getEPoint();
    getWallet();
    getUserProfile();
    getProvince();
  }

  @override
  void onClose() {}
  tapLogout() async {
    Get.find<UserService>().signOut();

    Get.find<MainController>().changeTabIndex(1);
    Get.until((route) => route.isFirst);
    // Get.offNamed(Routes.LOGIN);
    Get.offNamed(Routes.SIGNIN);

    // Get.until((Route<dynamic> route) => Get.currentRoute == Routes.LOGIN);
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

  void pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      file.value = imageTemp;
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  void pickImageFormCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      file.value = imageTemp;
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  void getEPoint() async {
    final response = await UserProvider.instance.getEPoint();
    if (response.error.isEmpty) {
      print("point ${response.data['data']['balance']}");
      pointCtrl.value = response.data['data']['balance'];
    } else {
      pointCtrl.value = 0;
    }
  }

 


  void onSelectCountry(String name, int id) {
    country.value = name;
    print(name);
    provinceCtrl.text = country.toString();
    provinceId.value = id;
  }

  void getWallet() async {
    final response = await UserProvider.instance.getWalletUser();
    if (response.error.isEmpty) {
      print("point ${response.data['data']['balance']}");
      walletUser.value = response.data['data']['balance'] == null ? 0 : response.data['data']['balance'];
    } else {
      walletUser.value = 0;
    }
  }

  void getUserProfile() async {
    final response = await UserProvider.instance.getUserProfile();
    print("profile ${response.data}");
    if (response.error.isEmpty) {
      userModel.value = UserModel.fromJson(response.data['data']);

      firstNameCtrl.value = TextEditingValue(text: "${userModel.value.firstName ?? ''}");
      lastNameCtrl.value = TextEditingValue(text: "${userModel.value.lastName ?? ''}");
      phoneCtrl.value = TextEditingValue(text: "${userModel.value.phone ?? ''}");
      yourEmailCtrl.value = TextEditingValue(text: "${userModel.value.email ?? ''}");
      parentEmailCtrl.value = TextEditingValue(text: "${userModel.value.attributes!.parentEmail ?? ''}");
      provinceCtrl.value = TextEditingValue(text: "${userModel.value.province?.title ?? ''}");
      provinceId.value = userModel.value.province?.id ?? 0;
      schoolCtrl.value = TextEditingValue(text: "${userModel.value.attributes?.school ?? ''}");
      classCtrl.value = TextEditingValue(text: "${userModel.value.attributes?.className ?? ''}");

      print("profile ${userModel.value.id}");
    } else {}
  }

  void updateProfile() async {
    updateButtonState.value = AppElevatedButtonState.loading;
    final firstName = firstNameCtrl.text.trim();
    final lastName = lastNameCtrl.text.trim();
    final phone = phoneCtrl.text.trim();
    final yourEmail = yourEmailCtrl.text.trim();
    final classs = classCtrl.text.trim();
    final school = schoolCtrl.text.trim();
    final province = provinceId.value == 0 ? 0 : provinceId.value;
    final parrentEmail = parentEmailCtrl.text.trim();
    String regex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    String regexPhone = r'^((09|03|07|08|05)+([0-9]{8})\b)$';
    String regexFullname =
        r'^[a-zA-Z\sÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$';
    if (!checkFormat(regexPhone, phoneCtrl.text.trim())) {
      updateButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_phone_format_error.tr, type: SnackbarType.error);
    }
    if (!checkFormat(regexFullname, firstNameCtrl.text.trim())) {
      updateButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_firstname_format_error.tr, type: SnackbarType.error);
    }
    if (!checkFormat(regexFullname, lastNameCtrl.text.trim())) {
      updateButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_lastname_format_error.tr, type: SnackbarType.error);
    }
    if (yourEmail.isEmpty) {
      updateButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_email_format_error.tr, type: SnackbarType.error);
    }
    if (checkFormat(regex, yourEmail) == false) {
      updateButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_invalid_youremail_error.tr, type: SnackbarType.error);
    }
    if (parrentEmail.isEmpty) {
      updateButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_partentemail_format_error.tr, type: SnackbarType.error);
    }
    if (checkFormat(regex, parrentEmail) == false) {
      updateButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_invalid_partentemail_error.tr, type: SnackbarType.error);
    }
    if (provinceId.value == 0) {
      updateButtonState.value = AppElevatedButtonState.active;
      return appSnackbar(LocaleKeys.notifi_province_invalid.tr, type: SnackbarType.error);
    }
    final response = await UserProvider.instance.updateProfile(
      idUser.value,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: yourEmail,
      classs: classs,
      school: school,
      province: province,
      parent_email: parrentEmail,
    );
   if(file.value.path!=''){
     final responseImage = await UserProvider.instance.uploadImage(
       file.value.path,
     );
     if(responseImage.error.isEmpty){
       Get.back();
       getUserProfile();
       updateButtonState.value = AppElevatedButtonState.active;
       appSnackbar("Cập nhật Avatar thành công", type: SnackbarType.success);
     }else{
       updateButtonState.value = AppElevatedButtonState.active;
       appSnackbar("Cập nhật Avatar không thành công", type: SnackbarType.error);
     }
   }
    if (response.error.isEmpty) {

      Get.back();
      getUserProfile();
      updateButtonState.value = AppElevatedButtonState.active;
      appSnackbar("Cập nhật thông tin thành công", type: SnackbarType.success);
    } else {
      updateButtonState.value = AppElevatedButtonState.active;
      appSnackbar("Cập nhật thông tin không thành công", type: SnackbarType.error);
    }
  }
}
