import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/controllers/live_class_home_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RequestTurnOnCameraDialog extends StatelessWidget {
  final controller = Get.find<LiveClassHomeController>();
  // int idRoom;
  RequestTurnOnCameraDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      backgroundColor: colorWhite,
      content: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        height: 232,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              width: 56,
              height: 56,
              padding: EdgeInsets.all(14),
              decoration:
                  BoxDecoration(color: colorSemanticBlue20, borderRadius: BorderRadius.all(Radius.circular(28))),
              child: SvgPicture.asset(R.ASSETS_SVG_IC_CAMERA_REQUIREONVIDEO_SVG, color: colorSemanticBlue100),
            ),
            Text("Yêu cầu bật Camera", style: typoBold16.copyWith(color: colorSecondaryNeutralWhite)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Giáo viên '${controller.room.value.nameTeacher ?? ''}' yêu cầu bạn bật mic",
                style: typoRegular16.copyWith(color: colorNeutralGray60),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: TextButton(
                    onPressed: () async {
                      Get.back();
                    },
                    child: Text(
                      "Từ chối",
                      style: typoBold16.copyWith(color: colorPrimaryBlue100),
                    ),
                  ),
                )),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.find<LiveClassHomeController>().tapVideo();
                    Get.back();
                    // Get.toNamed(Routes.LIVE_CLASS_REQUIRE_JOINCLASS, arguments: idRoom);
                  },
                  child: Container(
                    height: 50,
                    decoration:
                        BoxDecoration(color: colorPrimaryBlue100, borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(R.ASSETS_SVG_IC_CAMERA_REQUIREONVIDEO_SVG, color: colorWhite),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Bật Camera", style: typoBold16.copyWith(color: colorWhite))
                      ],
                    ),
                  ),
                )
                    // ElevatedButtonBase(
                    //   icon:,
                    //   height: 40,
                    //   size: 14,
                    //   weight: FontWeight.w700,
                    //   buttonTitle: "Bật Mic",
                    //   onPressed: () async {

                    //   },
                    // ),
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
