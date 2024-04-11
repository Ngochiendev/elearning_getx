import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/controllers/live_class_home_controller.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveClassRequireJoinclassController extends GetxController {
  //TODO: Implement LiveClassRequireJoinclassController

  final count = 0.obs;
  final listNotisRequirejoin =
      List<ListNotificationModel>.empty(growable: true).obs;
  final listNotis = List<ListNotificationModel>.empty(growable: true).obs;
  final idRoom = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    listNotis.clear();
    listNotisRequirejoin.clear();
    idRoom.value = Get.arguments ?? 0;

    listNotis.value =
        await Get.find<LiveClassService>().getListNotification(idRoom.value);
    listNotisRequirejoin.value =
        // ignore: unrelated_type_equality_checks
        listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  deleteItem(int index) async {
    await Get.find<LiveClassService>()
        .acceptJoinRoom(listNotisRequirejoin[index].id ?? 0, "CANCEL");
    listNotisRequirejoin.removeAt(index);
    Get.find<LiveClassService>()
        .listNotis
        .where((e) => e.action == "REQUEST_JOIN_ROOM")
        .toList()
        .removeWhere((e) =>
            e.userId ==
            Get.find<LiveClassService>()
                .listNotis
                .where((e) => e.action == "REQUEST_JOIN_ROOM")
                .toList()[index]
                .userId);
    Get.find<LiveClassHomeController>().listRequireJoinClass.removeAt(index);
    Get.find<LiveClassHomeController>().listRequireJoinClass.value =
        listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
  }

  acceptItem(int index) async {
    await Get.find<LiveClassService>()
        .acceptJoinRoom(listNotisRequirejoin[index].id ?? 0, "ACCEPT");
    listNotisRequirejoin.removeAt(index);

    Get.find<LiveClassService>()
        .listNotis
        .where((e) => e.action == "REQUEST_JOIN_ROOM")
        .toList()
        .removeWhere((e) =>
            e.userId ==
            Get.find<LiveClassService>()
                .listNotis
                .where((e) => e.action == "REQUEST_JOIN_ROOM")
                .toList()[index]
                .userId);
    if (Get.find<LiveClassHomeController>().listRequireJoinClass.length > 0) {
      Get.find<LiveClassHomeController>().listRequireJoinClass.removeAt(index);
    }

    Get.find<LiveClassHomeController>().listRequireJoinClass.value =
        listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
  }

  onTapDeleteAll() async {
    final ids = listNotisRequirejoin.map((element) => element.id).toList();
    for (var i in ids) {
      await Get.find<LiveClassService>().acceptJoinRoom(i!, "CANCEL");
    }
    listNotisRequirejoin.clear();
    Get.find<LiveClassHomeController>().listRequireJoinClass.clear();
    Get.find<LiveClassService>()
        .listNotis
        .removeWhere((e) => e.action == "REQUEST_JOIN_ROOM");
    Get.find<LiveClassHomeController>().listRequireJoinClass.value =
        listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
    Get.back();
  }

  onTapAcceptAll() async {
    final ids = listNotisRequirejoin.map((element) => element.id).toList();
    for (var i in ids) {
      await Get.find<LiveClassService>().acceptJoinRoom(i!, "ACCEPT");
    }
    listNotisRequirejoin.clear();
    Get.find<LiveClassHomeController>().listRequireJoinClass.clear();
    Get.find<LiveClassService>()
        .listNotis
        .removeWhere((e) => e.action == "REQUEST_JOIN_ROOM");
    Get.find<LiveClassHomeController>().listRequireJoinClass.value =
        listNotis.where((e) => e.action == "REQUEST_JOIN_ROOM").toList();
    Get.back();
  }
}
