import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';

import '../controllers/live_class_members_controller.dart';

class LiveClassMembersView extends GetView<LiveClassMembersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF4F5),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Obx(() => Text(
                'Thành viên (${controller.members.length})',
                style: typoBold24,
              )),
          centerTitle: true,
          leading: BackButton(
            color: colorBlack,
            onPressed: () => controller.tapBackButton(),
          )),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFFCF4F5)),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(16),
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     controller.onTapIsOff(controller.isShowOff.value = !controller.isShowOff.value);
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       Text(
                  //         "Vắng: ${controller.offlineMember.length}",
                  //         style: typoBold16,
                  //       ),
                  //       Icon(controller.isShowOff.value ? Icons.expand_more : Icons.expand_less)
                  //     ],
                  //   ),
                  // ),
                  // controller.isShowOff.value
                  //     ? Column(
                  //         children: [
                  //           Wrap(
                  //             children: controller.offlineMember
                  //                 .map((e) => Container(
                  //                       child: item(e, isOff: controller.isShowOff.value),
                  //                     ))
                  //                 .toList(),
                  //           ),
                  //           SizedBox(
                  //             height: 16,
                  //           ),
                  //           Divider(
                  //             height: 2,
                  //             color: colorNeutralGray20,
                  //           ),
                  //         ],
                  //       )
                  //     : Container(),
                  Wrap(
                    // alignment: WrapAlignment.start,
                    children: controller.members
                        .map((e) => Column(
                              children: [
                                Container(
                                  child: item(e),
                                ),
                              ],
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  item(UserModel user, {bool isOff = false}) {
    final listReadHandUp = controller.listReadHandUp;
    final members = Get.find<LiveClassService>().members;
    final member = members.firstWhere(
      (element) => element.id == user.id,
      orElse: () => UserModel(),
    );
    final memberHandup = listReadHandUp.firstWhere(
      (element) => element.userId == member.userID,
      orElse: () => ListNotificationModel(),
    );
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(8))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: member.attributesLive?.avatar == "" || member.attributesLive?.avatar == null
                  ? SvgPicture.asset(R.ASSETS_SVG_AVATAR_DEFAULT_SVG)
                  : AppNetworkImage(
                      source: "$baseUrlImage${member.attributesLive?.avatar}",
                      // source: "$baseUrlImagec6i8gae6t17s51p4aj7g.jpg",
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Expanded(
              child: Text(
            "${member.firstName ?? ""}  ${member.lastName ?? " "}",
            style: typoRegular14.copyWith(color: colorSecondaryNeutralWhite),
          )),
          isOff
              ? Container()
              : Row(
                  children: [
                    memberHandup.action == "HAND_UP" ? SvgPicture.asset(R.ASSETS_SVG_IC_HANDUP_MEMBER_SVG) : Ink(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: InkWell(
                        onTap: () => controller.onTapMicro(user.id, user.mutedMicro, member.userID, member.roomID ?? 0),
                        child: SvgPicture.asset(user.mutedMicro == false
                            ? R.ASSETS_SVG_IC_MICRORED_SVG
                            : R.ASSETS_SVG_IC_TURNOFFMIC_MEMBER_SVG),
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.onTapVideo(user.id, user.mutedVideo, member.userID, member.roomID ?? 0),
                      child: SvgPicture.asset(user.mutedVideo == false
                          ? R.ASSETS_SVG_IC_TURNONVIDEO_MEMBER_SVG
                          : R.ASSETS_SVG_IC_TURNOFFVIDEO_MEMBER_SVG),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
