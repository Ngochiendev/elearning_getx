import 'dart:convert';

import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/config/event.dart';
import 'package:elearning/app/data/models/liveclass_models/room_model.dart';
import 'package:elearning/app/data/models/teacher_model.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/providers/liveclass_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class LiveClassLoginController extends GetxController {
  //TODO: Implement LiveClassLoginController
  final box = GetStorage();
  final idTextField = TextEditingController();
  // final passTextField = TextEditingController();
  final room = RoomModel().obs;
  final buttonState = AppElevatedButtonState.inactive.obs;
  final tokenUser = "".obs;
  final userCurrent = UserModel().obs;
  final teachCurrent = TeacherModel().obs;
  final avatar = "".obs;
  final isTeacher = false.obs;
  final isCancel = false.obs;
  final isOnCamera = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    isTeacher.value = StorageBox.dataStorage.read<bool>(StorageBox.IsStudent) ?? false;
    final value = box.read<String>(StorageBox.User);
    if (value != null) {
      final user = jsonDecode(value);
      userCurrent.value = UserModel.fromJson(user);
      avatar.value = userCurrent.value.attributes?.avatar ?? "";
    }
    final teacher = StorageBox.dataStorage.read<String>(StorageBox.Teacher);
    if (teacher != null) {
      final teacherValue = jsonDecode(teacher);
      teachCurrent.value = TeacherModel.fromJson(teacherValue);
    }
  }

  @override
  void onReady() {
    super.onReady();
    // Get.find<LiveClassService>().eventBus.on<CancelRequireEvent>().listen((event) async {
    //   isCancel.value = event.isCannceled != null;
    //   buttonState.value = AppElevatedButtonState.active;
    //   Get.back();

    //   // if (event.chat != null) {
    //   //   listChat.add(event.chat!);
    //   //   dataListChats.value = listChat.reversed.toList();
    //   // }
    //   update();
    // });
  }

  @override
  void onClose() {}

  onTapCamera(bool value) {
    // isOnCamera.value = !isOnCamera.value;
    isOnCamera.value = value;
  }

  void onChangeValue() {
    final username = idTextField.text.trim();
    // final password = passwordCtrl.text.trim();
    if (username.length > 0) {
      buttonState.value = AppElevatedButtonState.active;
    } else {
      buttonState.value = AppElevatedButtonState.inactive;
    }
  }

  Future<void> onJoin() async {
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    final idRoom = int.parse(idTextField.text);
    tokenUser.value = isTeacher.value ? await getTokenHost(idRoom) ?? "" : await getTokenUser(idRoom) ?? "";

    if (tokenUser.value == "") {
      return;
    }
    await getRoom(idRoom);
  }

  Future getTokenUser(int id) async {
    final response = await LiveClassProvider.instance.getUserRtcToken(id);
    if (response.error.isEmpty) {
      buttonState.value = AppElevatedButtonState.active;
      final statusCode = response.data['status'];
      if (statusCode != 200) {
        room.value = RoomModel();
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: "Sai thông tin phòng hoặc mạng không ổn định, vui lòng thử lại ",
          ),
        );
        return;
      }
      final data = response.data['data'];
      return data;
    } else {
      buttonState.value = AppElevatedButtonState.active;
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: "Sai thông tin phòng hoặc mạng không ổn định, vui lòng thử lại ",
        ),
      );

      return "";
    }
  }

  Future getTokenHost(int id) async {
    final response = await LiveClassProvider.instance.getHostRtcToken(id);
    if (response.error.isEmpty) {
      buttonState.value = AppElevatedButtonState.active;
      final statusCode = response.data['status'];
      if (statusCode != 200) {
        room.value = RoomModel();
        buttonState.value = AppElevatedButtonState.active;

        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: "Sai thông tin phòng hoặc mạng không ổn định, vui lòng thử lại ",
          ),
        );
        return null;
      }
      final data = response.data['data'];
      return data;
    } else {
      buttonState.value = AppElevatedButtonState.active;

      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: "Sai thông tin phòng",
        ),
      );
      buttonState.value = AppElevatedButtonState.active;
      return null;
    }
  }

  Future getRoom(int id) async {
    buttonState.value = AppElevatedButtonState.loading;

    final response = await LiveClassProvider.instance.getRoom(id);
    if (response.error.isEmpty) {
      final statusCode = response.data['status'];
      if (statusCode != 200) {
        buttonState.value = AppElevatedButtonState.active;

        room.value = RoomModel();
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: "Sai thông tin phòng",
          ),
        );
        return;
      }
      room.value = RoomModel.fromJson(response.data['data']);

      final name = "${room.value.name}_$id";
      Get.find<LiveClassService>().room.value = room.value;
      Get.find<LiveClassService>().name.value = name;
      Get.find<LiveClassService>().isCamera.value = isOnCamera.value;
      Get.find<LiveClassService>().tokenUser.value = tokenUser.value;
      buttonState.value = AppElevatedButtonState.loading;
      await Get.find<LiveClassService>().connectSocket();
      update();
    } else {
      buttonState.value = AppElevatedButtonState.active;

      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: "Đường truyền không ổn định, Vui lòng thoát ra vào lại",
        ),
      );
      buttonState.value = AppElevatedButtonState.active;
      return;
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
