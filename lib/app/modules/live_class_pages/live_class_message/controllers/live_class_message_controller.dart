import 'dart:convert';
import 'dart:io';

import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/event.dart';
import 'package:elearning/app/data/models/liveclass_models/message_models.dart';
import 'package:elearning/app/data/models/liveclass_models/room_model.dart';
import 'package:elearning/app/data/models/liveclass_models/upload_image_model.dart';
import 'package:elearning/app/data/providers/liveclass_provider.dart';
import 'package:elearning/app/data/providers/upload_image_provider.dart';
import 'package:elearning/app/data/providers/upload_image_with_http.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:elearning/app/services/globals.dart' as globals;

class LiveClassMessageController extends GetxController {
  //TODO: Implement LiveClassMessageController
  final listChat = List<ChatModel>.empty(growable: true).obs;
  final messageTextField = TextEditingController();
  final myId = "619e23dd1b3b4e22b54381cf".obs;
  final dataListChats = List<ChatModel>.empty(growable: true).obs;
  final imageUploads = List<UploadImageModel>.empty(growable: true).obs;
  final dataUploadModel = UploadImageModel().obs;
  final room = RoomModel().obs;
  final buttonState = AppElevatedButtonState.active.obs;
  final picker = ImagePicker();
  final xfiles = List<XFile>.empty(growable: true).obs;
  final heightChatBottom = 80.0.obs;
  final widthButtonSend = 76.0.obs;
  final hasChatting = (Get.find<LiveClassService>().currentChatting != null).obs;

  ScrollController scrollController = new ScrollController();

  @override
  void onInit() async {
    super.onInit();
    myId.value = globals.idUser;
    room.value = Get.arguments["roomInfor"] ?? "";
    await getlistChat(room.value.id ?? 0);
  }

  @override
  void onReady() {
    super.onReady();
    Get.find<LiveClassService>().eventBus.on<ChatChangeEvent>().listen((event) async {
      hasChatting.value = event.chat != null;
      if (event.chat != null) {
        listChat.add(event.chat!);
        dataListChats.value = listChat
            .where((e) => e.type!.contains("message") && e.text != null && e.attachments != null)
            .toList()
            .reversed
            .toList();
        // dataListChats.removeWhere((e) =>
        //     e.text == "" && e.attachments != null && e.attachments!.length > 0 ||
        //     e.text == null && e.attachments != null && e.attachments!.length > 0);
        print(dataListChats.length);
      }
      update();
    });
  }

  @override
  void onClose() {}
  selectImage() async {
    try {
      final pickedFile = await picker.pickMultiImage();
      if (pickedFile != null) {
        heightChatBottom.value = 170;
        xfiles.value = pickedFile;
        update();
      }
    } catch (error) {
      error.printError();
    }
  }

  removeImage(int index) {
    xfiles.removeAt(index);
    if (xfiles.length == 0) {
      heightChatBottom.value = 80;
    }
  }

  Future getlistChat(int id) async {
    dataListChats.clear();
    imageUploads.clear();
    xfiles.clear();
    final response = await LiveClassProvider.instance.getChats(id);
    if (response.error.isEmpty) {
      for (var item in response.data['data']) {
        listChat.add(ChatModel.fromJson(item));
      }
      dataListChats.value = listChat
          .where((e) => e.type!.contains("message") && e.text != null && e.attachments != null)
          .toList()
          .reversed
          .toList();
      // dataListChats.removeWhere((e) =>
      //     e.text == "" && e.attachments != null && e.attachments!.length > 0 ||
      //     e.text == null && e.attachments != null && e.attachments!.length > 0);
      print(dataListChats.length);
      update();
    }
  }

  onTapSendMessage() async {
    if (messageTextField.text.length == 0 && xfiles.length == 0) {
      return;
    }
    widthButtonSend.value = 92;
    buttonState.value = AppElevatedButtonState.loading;
    if (xfiles.length > 0) {
      final response = await UploadImageWithHttp.instance.uploadmultipleimageChatLive(xfiles);
      if (response != null && response != "") {
        final body = json.decode(response);
        for (var item in body['data']) {
          imageUploads.add(UploadImageModel.fromJson(item));
        }
        if (imageUploads.length > 0) {
          await sendApi();
        }
      } else {
        widthButtonSend.value = 76;
        buttonState.value = AppElevatedButtonState.active;
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: "Upload image không thành công, Kiểm tra lại mạng ",
          ),
        );
        return;
      }

      // for (var image in files) {
      //   Future.delayed(Duration(seconds: 2), () async {
      //     final response = await UploadImageProvider.instance.uploadImage(image.path);
      //     if (response.error.isEmpty) {
      //       imageUploads.add(UploadImageModel.fromJson(response.data["data"]));
      //       if (image == files[files.length - 1]) {
      //         await sendApi();
      //       }
      //     } else {
      //       widthButtonSend.value = 76;
      //       buttonState.value = AppElevatedButtonState.active;
      //       showDialog(
      //         context: Get.context!,
      //         builder: (BuildContext context) => dialogAlert(
      //           context,
      //           message: "Upload image không thành công, Kiểm tra lại mạng ",
      //         ),
      //       );
      //       return;
      //     }
      //   });
      // }
    } else {
      imageUploads.clear();
      xfiles.clear();
      await sendApi();
    }
  }

  sendApi() async {
    final response =
        await LiveClassProvider.instance.sendMessgae(room.value.id ?? 0, messageTextField.text, imageUploads);
    if (response.error.isEmpty) {
      imageUploads.clear();
      xfiles.clear();
      buttonState.value = AppElevatedButtonState.active;
      widthButtonSend.value = 76;
      messageTextField.text = "";
      heightChatBottom.value = 80;
      FocusScope.of(Get.context!).requestFocus(new FocusNode());
      // await getlistChat(room.value.id ?? 0);
    } else {
      widthButtonSend.value = 76;
      buttonState.value = AppElevatedButtonState.active;
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: "Gửi tin nhắn không thành công",
        ),
      );
      return;
    }
  }
}
