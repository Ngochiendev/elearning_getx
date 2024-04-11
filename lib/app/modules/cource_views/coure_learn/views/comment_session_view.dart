import 'dart:io';

import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/components/app_text_form_field.dart';
import 'package:elearning/app/modules/cource_views/coure_learn/controllers/coure_learn_controller.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';

class CommentSessionView extends StatelessWidget {
  final controller = Get.find<CoureLearnController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(color: colorNeutralGray20),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: controller.avatarUser.value == ""
                        ? SvgPicture.asset(R.ASSETS_SVG_AVATAR_DEFAULT_SVG)
                        : AppNetworkImage(
                            source:
                                "$baseUrlImage${controller.avatarUser.value}",
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: colorNeutralGray40),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Center(
                      child: TextField(
                        controller: controller.commentCtrl,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        // style: typoRegular14,
                        decoration: InputDecoration(
                          hintText: "Hãy để lại ý kiến của bạn ",
                          hintStyle:
                              typoRegular14.copyWith(color: colorNeutralGray40),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: colorPrimaryBlue100,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  height: 40,
                  child: AppElevatedButton(
                    state: controller.buttonState.value,
                    buttonTitle: "Gửi",
                    onPressed: () {
                      controller
                          .onTabSendComment(controller.commentCtrl.value.text);
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              controller.pickImage();
            },
            child: Row(
              children: [
                SizedBox(
                  width: 56,
                ),
                SvgPicture.asset(R.ASSETS_SVG_CAMERA_COMMENT_SVG),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Thêm hình ảnh",
                  style: typoRegular14Blue,
                )
              ],
            ),
          ),
          Obx(() => Visibility(
                visible: controller.listImage.length > 0,
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                      color: colorPrimaryBlue5,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListView.builder(
                      itemCount: controller.listImage.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                useSafeArea: true,
                                context: Get.context!,
                                builder: (BuildContext context) => Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 100, horizontal: 15),
                                  child: Container(
                                    height: 100,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        image: DecorationImage(
                                            image: FileImage(File(
                                                controller.listImage[i].path)),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                              );
                            },
                            child: Container(
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
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.file(
                                              File(
                                                  controller.listImage[i].path),
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
                                    child: InkWell(
                                      onTap: () {
                                        controller.listImage.removeWhere((p) =>
                                            p.path ==
                                            controller.listImage[i].path);
                                      },
                                      child: Image.asset(
                                        R.ASSETS_PNG_IC_REMOVEIMAGE_PNG,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray20,
              boxShadow: boxShadow,
            ),
          ),
          Wrap(
            children: controller.listComment
                .map(
                  (e) => Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                              width: 40,
                              height: 40,
                              child: e.commentable?.attributes?.avatar == ""
                                  ? SvgPicture.asset(
                                      R.ASSETS_SVG_AVATAR_DEFAULT_SVG)
                                  : AppNetworkImage(
                                      source:
                                          "$baseUrlImage${e.commentable?.attributes?.avatar}",
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
                                Text(
                                  e.commentable == null
                                      ? "Ẩn danh"
                                      : "${e.commentable?.firstName} ${e.commentable?.lastName}",
                                  style: typoBold16,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            e.content!,
                                            style: typoRegular14.copyWith(
                                                color: colorNeutralGray100),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                      //  crossAxisAlignment:  WrapCrossAlignment.center,
                                      children: e.commentImages!
                                          .map((image) => Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        showDialog(
                                                          useSafeArea: true,
                                                          context: Get.context!,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        100,
                                                                    horizontal:
                                                                        15),
                                                            child:
                                                                AppNetworkImage(
                                                              source: image
                                                                      .source ??
                                                                  "",
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child:
                                                          e.commentImages!
                                                                      .length ==
                                                                  1
                                                              ? AppNetworkImage(
                                                                  source: image
                                                                          .source ??
                                                                      "",
                                                                )
                                                              : SizedBox(
                                                                  width: 50,
                                                                  height: 75,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    child: Image
                                                                        .network(
                                                                      image.source ??
                                                                          "",
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: InkWell(
                                              onTap: () {
                                                controller.onTapReply(controller
                                                        .onTapRepply.value =
                                                    !controller
                                                        .onTapRepply.value);
                                                e.showRepply = !e.showRepply!;
                                                controller.clear();
                                                controller.update();
                                              },
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      R.ASSETS_SVG_CHAT_SVG),
                                                  SizedBox(
                                                    width: 9,
                                                  ),
                                                  Text(
                                                    "Trả lời",
                                                    style: typoBold14,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${fullStringDateTimerCommentFormat(e.createdAt.toString())}",
                                            style: typoRegular14.copyWith(
                                                color: colorNeutralGray60),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Obx(
                                      () => Visibility(
                                          visible: e.showRepply!,
                                          child: Column(
                                            children: [
                                              Visibility(
                                                  visible: controller
                                                      .onTapRepply.value,
                                                  child: Container()),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      child: controller
                                                                  .avatarUser
                                                                  .value ==
                                                              ""
                                                          ? SvgPicture.asset(R
                                                              .ASSETS_SVG_AVATAR_DEFAULT_SVG)
                                                          : AppNetworkImage(
                                                              source:
                                                                  "$baseUrlImage${controller.avatarUser.value}",
                                                              fit: BoxFit.cover,
                                                            ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 40,
                                                      child: AppTextFormField(
                                                        controller: controller
                                                            .repplyCtrl,
                                                        textInputAction:
                                                            TextInputAction
                                                                .send,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        onSubmitted:
                                                            (value) async {
                                                          print(value);

                                                          await controller
                                                              .onTabSendRepply(
                                                                  value,
                                                                  "${e.id!}");
                                                        },
                                                        hintText:
                                                            "Nhập nội dung",
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            colorPrimaryBlue100,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    8))),
                                                    height: 40,
                                                    child: AppElevatedButton(
                                                      state: controller
                                                          .buttonReppyState
                                                          .value,
                                                      buttonTitle: "Gửi",
                                                      onPressed: () async {
                                                        await controller
                                                            .onTabSendRepply(
                                                                controller
                                                                    .repplyCtrl
                                                                    .text,
                                                                "${e.id!}");
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          new FocusNode());
                                                  controller.pickImageRepply();
                                                },
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 56,
                                                    ),
                                                    SvgPicture.asset(R
                                                        .ASSETS_SVG_CAMERA_COMMENT_SVG),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Thêm hình ảnh",
                                                      style: typoRegular14Blue,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Obx(() => Visibility(
                                                    visible: controller
                                                            .listImageRepply
                                                            .length >
                                                        0,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              colorPrimaryBlue5,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10,
                                                              horizontal: 20),
                                                      child: ListView.builder(
                                                          itemCount: controller
                                                              .listImageRepply
                                                              .length,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  i) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0.0),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  showDialog(
                                                                    useSafeArea:
                                                                        true,
                                                                    context: Get
                                                                        .context!,
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        Container(
                                                                      margin: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              100,
                                                                          horizontal:
                                                                              15),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            100,
                                                                        width:
                                                                            64,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(8)),
                                                                            image: DecorationImage(image: FileImage(File(controller.listImageRepply[i].path)), fit: BoxFit.fill)),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  child: Stack(
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                8),
                                                                        child:
                                                                            Wrap(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                child: Image.file(
                                                                                  File(controller.listImageRepply[i].path),
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        top: 0,
                                                                        right:
                                                                            0,
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            controller.listImageRepply.removeWhere((p) =>
                                                                                p.path ==
                                                                                controller.listImageRepply[i].path);
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            R.ASSETS_PNG_IC_REMOVEIMAGE_PNG,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Wrap(
                        children: e.children!
                            .map(
                              (e2) => Padding(
                                padding: EdgeInsets.only(left: 24),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            child: e.commentable?.attributes
                                                        ?.avatar ==
                                                    ""
                                                ? SvgPicture.asset(R
                                                    .ASSETS_SVG_AVATAR_DEFAULT_SVG)
                                                : AppNetworkImage(
                                                    source:
                                                        "$baseUrlImage${e.commentable?.attributes?.avatar}",
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e2.commentableType == "admin"
                                                    ? "ADMIN"
                                                    : e.commentable == null
                                                        ? "Ẩn danh"
                                                        : "${e.commentable?.firstName} ${e.commentable?.lastName}",
                                                style: typoBold16,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      e2.content!,
                                                      style: typoRegular14.copyWith(
                                                          color:
                                                              colorNeutralGray100),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${fullStringDateTimerCommentFormat(e.createdAt.toString())}",
                                                      style: typoRegular14.copyWith(
                                                          color:
                                                              colorNeutralGray60),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        height: 1,
                        decoration: BoxDecoration(
                          color: colorNeutralGray5,
                          boxShadow: boxShadow,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
