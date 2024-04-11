import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/providers/liveclass_provider.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/controllers/live_class_home_controller.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveClassMembersController extends GetxController {
  //TODO: Implement LiveClassMembersController

  final count = 0.obs;
  final members = List<UserModel>.empty(growable: true).obs;
  final roomMember = UserModel().obs;
  final listReadHandUp = List<ListNotificationModel>.empty(growable: true).obs;

  // final users = List<UserModel>.empty(growable: true).obs;
  // final myMember = UserModel().obs;
  final offlineMember = List<UserModel>.empty(growable: true).obs;
  final isShowOff = false.obs;
  final isMember = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    roomMember.value = Get.arguments["member"] ?? UserModel();
    listReadHandUp.value = Get.arguments["listReadHandUp"] ?? ListNotificationModel();

    members.value = Get.arguments["members"] ?? [];
    if (roomMember.value != null && roomMember.value.id != null) {
      final item = members.firstWhere((element) => element.id == roomMember.value.id, orElse: () => UserModel());
      if (item.id != null) {
        return;
      }

      members.add(roomMember.value);
      update();
    }

    // final id = Get.arguments ?? 0;

    // getMembersRoom(id);
  }

  tapBackButton() {
    members.remove(roomMember.value);
    Get.back();
  }

  void onTapIsOff(bool tap) {
    isShowOff.value = tap;
  }

  @override
  void onClose() {
    // members.clear();
  }

  onTapMicro(int uid, bool? muted, String userId, int idRoom) async {
    if (Get.find<LiveClassService>().isTeacher.value == false) {
      return;
    }
    if (muted == true) {
      await teacherPushRequestNotification(idRoom, "REQUEST_TURN_ON_MIC", userId);
    } else {
      await rollController(idRoom, "MUTE_SELF", userId);
    }
  }

  onTapVideo(int uid, bool? muted, String userId, int idRoom) async {
    if (Get.find<LiveClassService>().isTeacher.value == false) {
      return;
    }
    if (muted == true) {
      await teacherPushRequestNotification(idRoom, "REQUEST_TURN_ON_CAMERA", userId);
    } else {
      await rollController(idRoom, "HOST_FORCE_MUTE", userId);
    }
  }

  rollController(int idRoom, String action, String userId) async {
    final response = await LiveClassProvider.instance.roomControl(idRoom, action, userId);
    if (response.error.isEmpty) {
      appSnackbar("Bạn đã tắt thành công", type: SnackbarType.success);
    }
  }

  Future teacherPushRequestNotification(int idRoom, String action, String userID) async {
    final response = await LiveClassProvider.instance.teacherPushRequestNotification(idRoom, action, userID);
    if (response.error.isEmpty) {
      final statusCode = response.data['status'];
      if (statusCode != 200) {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: "Yêu cầu không thành công, vui lòng thử lại",
          ),
        );
        return;
      }
      appSnackbar("Bạn đã yêu cầu thành công", type: SnackbarType.success);
    } else {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(context, message: "Yêu cầu không thành công, vui lòng thử lại"),
      );
      return;
    }
  }

  // getMembersRoom(int id) async {
  //   members.clear();
  //   final response = await LiveClassProvider.instance.getMembersRoom(id);
  //   if (response.error.isEmpty) {
  //     for (var data in response.data["data"]) {
  //       members.add(UserModel.fromJson(data));
  //     }
  //     offlineMember.value = members.where((e) => e.status == "OFFLINE").toList();
  //   }
  // }
}
