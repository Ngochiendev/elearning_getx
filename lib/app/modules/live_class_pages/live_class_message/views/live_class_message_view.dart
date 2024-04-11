import 'dart:io';

import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/liveclass_models/message_models.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/live_class_message_controller.dart';

class LiveClassMessageView extends GetView<LiveClassMessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF4F5),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Tin nhắn ',
            style: typoBold24,
          ),
          centerTitle: true,
          leading: BackButton(
            color: colorBlack,
          )),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Color(0xFFFCF4F5), boxShadow: boxShadow),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: listMessage(context),
                  )),
            ),
            Obx(() => Container(
                decoration: BoxDecoration(color: colorWhite, boxShadow: boxShadow),
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: controller.heightChatBottom.value,
                child: typingChatLayout(context)))
          ],
        ),
      ),
    );
  }

  listMessage(BuildContext context) => Obx(
        () => ListView.builder(
          reverse: true,
          controller: controller.scrollController,
          itemCount: controller.dataListChats.length,
          itemBuilder: (context, id) => Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: controller.dataListChats[id].sender!.id! == controller.myId.value
                ? myItem(controller.dataListChats[id])
                : otherPersonItem(controller.dataListChats[id]),
          ),
        ),
      );

  otherPersonItem(ChatModel chat) {
    List<AttachmentModel>? images;
    if (chat.attachments != null && chat.attachments!.length > 0) {
      images = chat.attachments;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: 40,
            height: 40,
            child: chat.sender?.attributes?.avatar == "" || chat.sender?.attributes?.avatar == null
                ? SvgPicture.asset(R.ASSETS_SVG_AVATAR_DEFAULT_SVG)
                : AppNetworkImage(
                    source: "$baseUrlImage${chat.sender?.attributes?.avatar}",
                    // source:
                    //     "https://images.squarespace-cdn.com/content/v1/573e57871bbee0d6dea60fff/1551203818326-Y2YY9W2OHZT2R28UZ2UC/what-is-teacher-burnout.jpg",
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${chat.sender?.firstName ?? ""} ${chat.sender?.lastName ?? ""}",
                      style: typoRegular14.copyWith(color: colorSecondaryNeutralWhite),
                    ),
                  ),
                  Text(
                    fullStringTimerAMPMFormat(chat.createdAt ?? ""),
                    style: typoRegular12.copyWith(color: colorNeutralGray60),
                  ),
                ],
              ),
              chat.text == "" || chat.text == null
                  ? Ink()
                  : Container(
                      padding: EdgeInsets.all(9),
                      decoration:
                          BoxDecoration(color: colorNeutralGray5, borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(chat.text,
                          maxLines: 100,
                          softWrap: true,
                          style: typoRegular14.copyWith(color: colorSecondaryNeutralWhite)),
                    ),
              images != null
                  ? Wrap(
                      children: images
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                showImage(e.url ?? "");
                              },
                              child: Container(
                                margin: EdgeInsets.all(8),
                                width: 80,
                                height: 80,
                                child: AppNetworkImage(
                                  source: e.url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                          .toList())
                  : Ink()
            ],
          ),
        )
      ],
    );
  }

  myItem(ChatModel chat) {
    List<AttachmentModel>? images;
    if (chat.attachments != null && chat.attachments!.length > 0) {
      images = chat.attachments;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              fullStringTimerAMPMFormat(chat.createdAt ?? ""),
              style: typoRegular12.copyWith(color: colorNeutralGray60),
            ),
            Text(
              "Bạn",
              style: typoRegular14.copyWith(color: colorSecondaryNeutralWhite),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        chat.text == "" || chat.text == null
            ? Ink()
            : Container(
                padding: EdgeInsets.all(9),
                decoration:
                    BoxDecoration(color: colorPrimaryBlue100, borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(chat.text,
                    maxLines: 100,
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: typoRegular14.copyWith(color: colorWhite)),
              ),
        images != null
            ? Wrap(
                children: images
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          showImage(e.url ?? "");
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 80,
                          height: 80,
                          child: AppNetworkImage(
                            source: e.url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList())
            : Ink()
      ],
    );
  }

  showImage(String url) => showDialog(
        useSafeArea: true,
        context: Get.context!,
        builder: (BuildContext context) => Container(
          margin: EdgeInsets.symmetric(vertical: 100, horizontal: 15),
          child: AppNetworkImage(
            source: url,
            fit: BoxFit.cover,
          ),
        ),
      );

  typingChatLayout(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Visibility(
              visible: controller.xfiles.length > 0,
              child: Container(
                color: colorPrimaryBlue5,
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.xfiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => controller.removeImage(index),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Wrap(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.file(
                                      File(controller.xfiles[index].path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Image.asset(
                              R.ASSETS_PNG_IC_REMOVEIMAGE_PNG,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // margin: EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      await controller.selectImage();
                    },
                    child: SvgPicture.asset(R.ASSETS_SVG_IC_IMAGEDEFAULT_SVG, width: 20, height: 20),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 8 / 10,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        onChanged: (text) {
                          // if (text.length > 0) {
                          //   controller.isTypingSearch.value = true;

                          //   print(text);
                          // } else {
                          //   controller.isTypingSearch.value = false;
                          // }
                        },
                        controller: controller.messageTextField,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Nhập nội dung ... ",
                          hintStyle: typoRegular14.copyWith(color: colorNeutralGray40),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Obx(() => Container(
                        width: controller.widthButtonSend.value,
                        height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: ElevatedButtonBase(
                          state: controller.buttonState.value,
                          mainColor: colorSemanticRed100,
                          height: 50,
                          size: 16,
                          buttonTitle: "Gửi",
                          onPressed: () async {
                            await controller.onTapSendMessage();
                          },
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      );
}
