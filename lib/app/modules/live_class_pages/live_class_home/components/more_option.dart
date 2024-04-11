import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/controllers/live_class_home_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MoreOptionBottomSheet extends StatelessWidget {
  final controller = Get.find<LiveClassHomeController>();
  MoreOptionBottomSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 60),
        decoration: decorContainerBox,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: decorContainerBox,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                          width: 72,
                          height: 5,
                          margin: EdgeInsets.only(top: 6, bottom: 16),
                          decoration: BoxDecoration(
                              color: colorNeutralGray40, borderRadius: BorderRadius.all(Radius.circular(2.5)))),
                    ),
                    Text(
                      'Mục',
                      style: typoBold18,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      color: Color(0xFFE8E9EA),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () async {
                          Get.back();
                          await Get.toNamed(Routes.LIVE_CLASS_TEXTBOOK, arguments: controller.room.value);
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              child: SvgPicture.asset(
                                R.ASSETS_SVG_IC_DOCUMENTLIV_SVG,
                                color: colorNeutralGray80,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Tài liệu',
                              style: typoRegular16.copyWith(color: colorNeutralGray80),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: GestureDetector(
                        onTap: () async {
                          Get.back();
                          await Get.toNamed(Routes.LIVE_CLASS_MESSAGE,
                              arguments: {"idUser": controller.idUser.value, "roomInfor": controller.room.value});
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              child: SvgPicture.asset(R.ASSETS_SVG_IC_MESSAGE_SVG),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Tin nhắn',
                              style: typoRegular16.copyWith(color: colorNeutralGray80),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Tương tác',
                      style: typoBold16,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      color: Color(0xFFE8E9EA),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              print("Đã vỗ tay");
                              Get.back();
                              await Get.find<LiveClassService>()
                                  .pushRequestNotification(controller.room.value.id ?? 0, "CLAP");
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(R.ASSETS_SVG_IC_CLAPPING_HANDS_SVG),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Vỗ tay',
                                  style: typoRegular16.copyWith(color: colorSecondaryNeutralWhite),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                            visible: controller.isTeach.value == false,
                            child: Expanded(
                              child: InkWell(
                                onTap: () async {
                                  print("Đã Giơ tay");
                                  Get.back();
                                  if (controller.isHandown.value == false) {
                                    await Get.find<LiveClassService>()
                                        .pushRequestNotification(controller.room.value.id ?? 0, "HAND_UP");
                                    controller.isHandown.value = true;
                                  } else {
                                    await Get.find<LiveClassService>()
                                        .pushRequestNotification(controller.room.value.id ?? 0, "HAND_DOWN");
                                    controller.isHandown.value = false;
                                  }
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(R.ASSETS_SVG_IC_HANDUP1_SVG),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      controller.isHandown.value ? 'Hạ tay' : 'Giơ tay',
                                      style: typoRegular16.copyWith(color: colorSecondaryNeutralWhite),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              print("Thả tim");
                              Get.back();
                              await Get.find<LiveClassService>()
                                  .pushRequestNotification(controller.room.value.id ?? 0, "LOVE");
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(R.ASSETS_SVG_IC_REDHEART_SVG),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Thả tim',
                                  style: typoRegular16.copyWith(color: colorSecondaryNeutralWhite),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Visibility(
                      visible: controller.isTeach.value == true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hành động',
                            style: typoBold16,
                          ),
                          InkWell(
                            onTap: () async {
                              await Get.find<LiveClassService>().teacherRollCall(controller.room.value.id ?? 0);
                              Get.back();
                              appSnackbar("Bạn đã điểm danh thành công", type: SnackbarType.success);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    child: SvgPicture.asset(R.ASSETS_SVG_IC_ATTENDANCE_SVG),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Điểm danh',
                                    style: typoRegular16.copyWith(color: colorNeutralGray80),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Thông báo',
                      style: typoBold16,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24, bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          if (controller.listNotis.length == 0) {
                            return;
                          }
                          Get.back();
                          Get.toNamed(Routes.LIVE_CLASS_NOTIFICAITON, arguments: controller.listNotis);
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              child: SvgPicture.asset(R.ASSETS_SVG_IC_NOTIFICATION_SVG),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                'Thông báo',
                                style: typoRegular16.copyWith(color: colorNeutralGray80),
                              ),
                            ),
                            Text(
                              "(${controller.listNotis.length})",
                              style: typoRegular16.copyWith(color: colorSecondaryNeutralWhite),
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.isTeach.value,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: GestureDetector(
                          onTap: () {
                            if (controller.listReadHandUp.length == 0) {
                              return;
                            }
                            Get.back();
                            Get.toNamed(Routes.LIVE_CLASS_HANDUP, arguments: controller.listReadHandUp);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                child: SvgPicture.asset(R.ASSETS_SVG_IC_HANDUP_SVG),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  'Giơ tay',
                                  style: typoRegular16.copyWith(color: colorNeutralGray80),
                                ),
                              ),
                              Text(
                                "(${controller.listReadHandUp.length})",
                                style: typoRegular16.copyWith(color: colorSecondaryNeutralWhite),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.isTeach.value,
                      child: Container(
                        margin: EdgeInsets.only(top: 8, bottom: 24),
                        child: GestureDetector(
                          onTap: () {
                            if (controller.listRequireJoinClass.length == 0) {
                              return;
                            }
                            Get.back();
                            Get.toNamed(Routes.LIVE_CLASS_REQUIRE_JOINCLASS, arguments: controller.room.value.id ?? 0);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                child: SvgPicture.asset(R.ASSETS_SVG_IC_REQUIREJOIN_SVG),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  'Yêu cầu vào lớp',
                                  style: typoRegular16.copyWith(color: colorNeutralGray80),
                                ),
                              ),
                              Text(
                                "(${Get.find<LiveClassService>().listRequireJoinClass.length})",
                                style: typoRegular16.copyWith(color: colorSecondaryNeutralWhite),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16)
                  ],
                ),
              ),
              Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: boxShadow,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () async {
                              Get.back();
                            },
                            child: Text(
                              "Hủy bỏ",
                              style: typoBold16,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
