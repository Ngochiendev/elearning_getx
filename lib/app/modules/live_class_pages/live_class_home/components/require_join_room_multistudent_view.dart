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

class RequestJoinRoomMultilStudentView extends StatelessWidget {
  List<ListNotificationModel>? listNotisRequest;
  int idRoom;
  RequestJoinRoomMultilStudentView(
      {required this.listNotisRequest, required this.idRoom, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      backgroundColor: colorWhite,
      content: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        height: 140,
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  child: Container(
                    width: 80,
                    height: 56,
                    child:
                        Image.asset(R.ASSETS_PNG_IC_MULTISTUDENT_JOINCLASS_PNG),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Nhiều học sinh",
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
                  child: TextButton(
                    onPressed: () async {
                      if (listNotisRequest != null &&
                          listNotisRequest!.length > 0) {
                        final ids = listNotisRequest!
                            .map((element) => element.id)
                            .toList();
                        for (var i in ids) {
                          await Get.find<LiveClassService>().acceptJoinRoom(
                              i!, "CANCEL",
                              typeB: "CANCELMULTI");
                        }
                      }

                      //listNotis.clear();
                      Get.find<LiveClassHomeController>()
                          .listRequireJoinClass
                          .clear();
                      Get.back();
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
                    height: 40,
                    size: 14,
                    weight: FontWeight.w700,
                    buttonTitle: "Xem chi tiết",
                    onPressed: () async {
                      Get.back();
                      Get.toNamed(Routes.LIVE_CLASS_REQUIRE_JOINCLASS,
                          arguments: idRoom);
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
