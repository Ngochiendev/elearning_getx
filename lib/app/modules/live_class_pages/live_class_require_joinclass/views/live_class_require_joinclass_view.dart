import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/app_text_field.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/require_join_room_view.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/controllers/live_class_home_controller.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/live_class_require_joinclass_controller.dart';

class LiveClassRequireJoinclassView
    extends GetView<LiveClassRequireJoinclassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF4F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Obx(
          () => Text(
            'Yêu cầu vào lớp (${controller.listNotisRequirejoin.length})',
            style: typoBold24.copyWith(color: colorNeutralGray100),
          ),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () async {
            Get.back();
            await Get.find<LiveClassService>()
                .getListNotification(controller.idRoom.value);
          },
          color: colorBlack,
        ),
      ),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.listNotisRequirejoin.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final studentNoti = controller
                        .listNotisRequirejoin[index].extraData?.sender;
                    return Container(
                      decoration: BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      height: 150,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: AppNetworkImage(
                                    source: studentNoti?.attributes?.avatar !=
                                            ""
                                        ? "$baseUrlImage${studentNoti?.attributes?.avatar}"
                                        : "https://images.squarespace-cdn.com/content/v1/573e57871bbee0d6dea60fff/1551203818326-Y2YY9W2OHZT2R28UZ2UC/what-is-teacher-burnout.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: studentNoti?.firstName ?? "",
                                        style: typoBold16.copyWith(
                                            color: colorSecondaryNeutralWhite)),
                                    TextSpan(
                                        text: " muốn tham gia lớp học của bạn ",
                                        style: typoRegular16.copyWith(
                                            color: colorSecondaryNeutralWhite)),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 40,
                                child: TextButton(
                                  onPressed: () async {
                                    await controller.deleteItem(index);
                                  },
                                  child: Text(
                                    "Từ chối",
                                    style: typoBold16.copyWith(
                                        color: colorPrimaryBlue100),
                                  ),
                                ),
                              )),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: ElevatedButtonBase(
                                  height: 40,
                                  size: 14,
                                  weight: FontWeight.w700,
                                  buttonTitle: "Chấp nhận",
                                  onPressed: () async {
                                    await controller.acceptItem(index);
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorWhite,
                boxShadow: boxShadow,
              ),
              height: 80,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                        await controller.onTapDeleteAll();
                      },
                      child: Text(
                        "Từ chối tất cả",
                        style: typoBold16.copyWith(color: colorPrimaryBlue100),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButtonBase(
                      height: 50,
                      size: 14,
                      weight: FontWeight.w700,
                      buttonTitle: "Chấp nhận tất cả",
                      onPressed: () async {
                        await controller.onTapAcceptAll();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
