import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RollCallView extends StatelessWidget {
  int idRollcall;
  RollCallView({required this.idRollcall, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      backgroundColor: colorWhite,
      content: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Điểm danh", style: typoBold16.copyWith(color: colorSecondaryNeutralWhite)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Nhấn vào nút bên dưới để xác nhận điểm danh random học sinh của bạn",
                style: typoRegular16.copyWith(color: colorNeutralGray60),
              ),
            ),
            Container(
              child: ElevatedButtonBase(
                height: 50,
                mainColor: colorPrimaryBlue100,
                size: 16,
                weight: FontWeight.bold,
                buttonTitle: "Điểm danh",
                onPressed: () async {
                  Get.back();
                  Get.find<LiveClassService>().isShowRollCall.value = false;

                  await Get.find<LiveClassService>().acceptRollCall(idRollcall);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
