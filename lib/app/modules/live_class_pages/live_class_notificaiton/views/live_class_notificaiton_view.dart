import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';

import '../controllers/live_class_notificaiton_controller.dart';

class LiveClassNotificaitonView extends GetView<LiveClassNotificaitonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFCF4F5),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Obx(() => Text(
                  'Thông báo (${controller.listNotis.length})',
                  style: typoBold24,
                )),
            centerTitle: true,
            leading: BackButton(
              color: colorBlack,
            )),
        body: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCF4F5), boxShadow: boxShadow),
              child: Center(
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(16),
                  child: Obx(
                    () => ListView.builder(
                      reverse: true,
                      itemCount: controller.listNotis.length,
                      itemBuilder: (index, id) => item(controller.listNotis[id]),
                    ),
                  ),
                ),
              ),
            )),
            GestureDetector(
              onTap: () async {
                controller.onTapDelete();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
                  height: 80,
                  child: Center(
                    child: Text("Xóa tất cả", style: typoBold16.copyWith(color: colorPrimaryBlue100)),
                  )),
            )
          ],
        ));
  }

  item(ListNotificationModel notification) {
    final name = notification.extraData?.sender?.firstName ?? "";
    return typeNotification(notification, name);
  }

  typeNotification(ListNotificationModel notification, String name) {
    switch (notification.action) {
      case "CLAP":
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
              leading: Container(
                margin: EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: colorSemanticYellow20, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SvgPicture.asset(R.ASSETS_SVG_IC_CLAPPING_HANDS_SVG),
              ),
              title: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: notification.extraData?.sender?.firstName ?? "",
                    style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: " đã ", style: typoRegular12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: "Vỗ tay ", style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
              ])),
              subtitle: Text(
                convertStringTimetoTimeAgo(notification.updatedAt ?? ""),
              )),
        );
      case "HAND_UP":
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Container(
              margin: EdgeInsets.only(right: 16),
              width: 40,
              height: 40,
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: colorSemanticYellow20, borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SvgPicture.asset(R.ASSETS_SVG_IC_HANDUP1_SVG),
            ),
            title: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: notification.extraData?.sender?.firstName ?? "",
                  style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
              TextSpan(text: " đã ", style: typoRegular12.copyWith(color: colorSecondaryNeutralWhite)),
              TextSpan(text: "Giơ tay ", style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
            ])),
            subtitle: Text(
              convertStringTimetoTimeAgo(notification.updatedAt ?? ""),
            ),
          ),
        );
      case "HAND_DOWN":
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
              leading: Container(
                margin: EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: colorSemanticGreen20, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SvgPicture.asset(R.ASSETS_SVG_IC_CLAPPING_HANDS_SVG),
              ),
              title: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: notification.extraData?.sender?.firstName ?? "",
                    style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: " đã ", style: typoRegular12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: "Hạ tay ", style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
              ])),
              subtitle: Text(
                convertStringTimetoTimeAgo(notification.updatedAt ?? ""),
              )),
        );
      case "LOVE":
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
              leading: Container(
                margin: EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: colorSemanticRed20, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SvgPicture.asset(R.ASSETS_SVG_IC_REDHEART_SVG),
              ),
              title: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: notification.extraData?.sender?.firstName ?? "",
                    style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: " đã ", style: typoRegular12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: "Thả tim ", style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
              ])),
              subtitle: Text(
                convertStringTimetoTimeAgo(notification.updatedAt ?? ""),
              )),
        );
      case "LIKE":
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
              leading: Container(
                margin: EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: colorSemanticGreen20, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SvgPicture.asset(R.ASSETS_SVG_IC_CLAPPING_HANDS_SVG),
              ),
              title: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: notification.extraData?.sender?.firstName ?? "",
                    style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: " đã ", style: typoRegular12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: "LIKE", style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
              ])),
              subtitle: Text(
                convertStringTimetoTimeAgo(notification.updatedAt ?? ""),
              )),
        );

      case "ROLL_CALL":
        return itemNotification(notification, name, "Đã điểm danh");
        ;
      case "REQUEST_TURN_ON_MIC":
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
              leading: Container(
                margin: EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: colorSemanticBlue20, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SvgPicture.asset(R.ASSETS_SVG_IC_MICRORED_SVG, color: colorSemanticBlue20),
              ),
              title: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: notification.extraData?.sender?.firstName ?? "",
                    style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: " đã ", style: typoRegular12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: "Bật MIC", style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
              ])),
              subtitle: Text(
                convertStringTimetoTimeAgo(notification.updatedAt ?? ""),
              )),
        );
      case "REQUEST_JOIN_ROOM":
        return itemNotification(notification, name, "Đã yêu cầu tham gia phòng");

      case "CANCEL_JOIN_ROOM":
        return itemNotification(notification, name, "Đã từ chối cho tham gia phòng");
      case "ACCEPT_JOIN_ROOM":
        return itemNotification(notification, name, "Đã chấp nhận cho tham gia phòng");
      case "REQUEST_TURN_ON_CAMERA":
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
              leading: Container(
                margin: EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: colorSemanticBlue20, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SvgPicture.asset(R.ASSETS_SVG_IC_CAMERA_SVG, color: colorSemanticBlue100),
              ),
              title: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: notification.extraData?.sender?.firstName ?? "",
                    style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: " đã yêu cầu bạn ", style: typoRegular12.copyWith(color: colorSecondaryNeutralWhite)),
                TextSpan(text: "bật Camera ", style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
              ])),
              subtitle: Text(
                convertStringTimetoTimeAgo(notification.updatedAt ?? ""),
              )),
        );
      case "END_ROOM":
        return itemNotification(notification, name, "Đã thoát khỏi phòng");

      default:
        return itemNotification(notification, name, "Đã ra khỏi màn hình");
    }
  }

  itemNotification(ListNotificationModel notification, String name, String description) => Container(
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
            leading: Container(
              margin: EdgeInsets.only(right: 16),
              width: 40,
              height: 40,
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: colorSemanticGreen20, borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SvgPicture.asset(R.ASSETS_SVG_IC_NOTILIV_SVG),
            ),
            title: RichText(
                text: TextSpan(children: [
              TextSpan(text: name, style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
              TextSpan(text: " đã ", style: typoRegular12.copyWith(color: colorSecondaryNeutralWhite)),
              TextSpan(text: description, style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
            ])),
            subtitle: Text(
              convertStringTimetoTimeAgo(notification.updatedAt ?? ""),
            )),
      );
}
