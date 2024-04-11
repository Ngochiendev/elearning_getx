import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestJoinRoomView extends StatelessWidget {
  ListNotificationModel? studentNoti;
  RequestJoinRoomView({required this.studentNoti, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final student = studentNoti?.extraData?.sender;
    return Dialog(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        height: 120,
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
                      source: student?.attributes?.avatar != ""
                          ? "$baseUrlImage${student?.attributes?.avatar}"
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
                          text: student?.firstName ?? "",
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
                      await Get.find<LiveClassService>()
                          .acceptJoinRoom(studentNoti?.id ?? 0, "CANCEL");
                      Get.back();
                    },
                    child: Text(
                      "Từ chối",
                      style: typoBold16.copyWith(color: colorPrimaryBlue100),
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
                      await Get.find<LiveClassService>()
                          .acceptJoinRoom(studentNoti?.id ?? 0, "ACCEPT");
                      Get.back();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
