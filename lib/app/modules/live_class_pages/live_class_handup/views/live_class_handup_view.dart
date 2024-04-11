import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/live_class_handup_controller.dart';

class LiveClassHandupView extends GetView<LiveClassHandupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFCF4F5),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Obx(() => Text(
                  'Giơ tay (${controller.listHanddUp.length})',
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
                      itemCount: controller.listHanddUp.length,
                      itemBuilder: (index, id) => item(controller.listHanddUp[id]),
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
                    child: Text("Hạ tay tất cả", style: typoBold16.copyWith(color: colorPrimaryBlue100)),
                  )),
            )
          ],
        ));
  }

  item(ListNotificationModel notification) {
    final user = notification.extraData?.sender;
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: boxShadow, borderRadius: BorderRadius.all(Radius.circular(8))),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(right: 16),
              width: 56,
              height: 56,
              // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: AppNetworkImage(
                  // source:
                  //     "https://flextech-dev.s3-ap-southeast-1.amazonaws.com/image/content/${user.attributes?.avatar ?? "c6i8gae6t17s51p4aj7g.jpg"}",
                  source: "${baseUrlImage}c6i8gae6t17s51p4aj7g.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Text(
              "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
              style: typoRegular14.copyWith(color: colorSecondaryNeutralWhite),
            )),
            SvgPicture.asset(R.ASSETS_SVG_IC_HANDUP_MEMBER_SVG),
          ],
        ));
  }
}
