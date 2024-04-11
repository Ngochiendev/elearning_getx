import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/infor_bottomsheet.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/meeting_page.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/components/more_option.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_login/controllers/live_class_login_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;

import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/live_class_home_controller.dart';

class LiveClassHomeView extends GetView<LiveClassHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: GestureDetector(
            onTap: () {
              Get.bottomSheet(InforBottomSheet());
            },
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(
                  //   width: 16,
                  // ),

                  Obx(
                    () => Flexible(
                      child: Text(
                        "${controller.room.value.name ?? "Room"}" +
                            "_"
                                "${controller.room.value.id ?? 0}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: typoBold16.copyWith(color: Color(0xFF062A9B)),
                      ),
                    ),
                  ),

                  Icon(Icons.arrow_drop_down, color: colorBlack)
                ],
              ),
            )),

        centerTitle: true,
        // leadingWidth: 80,
        leading: Row(
          children: [
            // SizedBox(
            //   width: 8,
            // ),
            // SvgPicture.asset(R.ASSETS_SVG_IC_TURNOFFVOLUMN_SVG),
            SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: () {
                controller.onSwitchCamera();
              },
              child: SvgPicture.asset(R.ASSETS_SVG_IC_CAMERA_SVG),
            )
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: ElevatedButtonBase(
              mainColor: colorSemanticRed100,
              height: 28,
              size: 12,
              buttonTitle: "Thoát lớp",
              onPressed: () async {
                Future.delayed(Duration.zero, () {
                  Get.find<LiveClassService>().disconnectSocket();
                  Get.find<LiveClassLoginController>().buttonState.value = AppElevatedButtonState.active;
                  Get.back();
                });
              },
            ),
          )
        ],
      ),
      body: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              physics: controller.listUserLives.length > 0
                  ? AlwaysScrollableScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: (int id) {
                controller.onChangePage(id);
              },
              children: <Widget>[
                pageFirst(context),
                pageSecond(context),
                pageThird(context),
              ],
            ),
            Positioned(
              bottom: 100,
              child: controller.listUserLives.length > 0
                  ? SmoothPageIndicator(
                      controller: controller.pageController, // PageController
                      count: controller.itemList.length,
                      effect: WormEffect(
                          radius: 4.0,
                          dotWidth: 8.0,
                          dotHeight: 8.0,
                          dotColor: colorDot,
                          activeDotColor: colorSemanticRed100), // your preferred effect
                      onDotClicked: (index) {})
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  remoteVideo(int id, int idUserOff) {
    if (id > 0 && id != idUserOff) {
      return RtcRemoteView.SurfaceView(uid: id);
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: Text(
          'Chọn bất kì người nào trong phòng để hiển thị ở đây',
          style: typoRegular16.copyWith(color: colorNeutralGray60),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  Widget _viewRows(List<UserModel> lisUser) {
    final views = _getRenderViews(lisUser);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: views.length + 1,
        itemBuilder: (context, id) {
          if (id == 0) {
            return Stack(
              children: [
                Obx(() => Container(
                    margin: EdgeInsets.only(right: 16),
                    height: 120,
                    width: 180,
                    child: controller.hasVideo.value
                        ? Container(
                            color: colorBlack,
                          )
                        : RtcLocalView.SurfaceView())),
                Positioned(
                    bottom: 16,
                    left: 16,
                    right: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          // "You",
                          "Bạn",
                          style: typoRegular14.copyWith(color: colorWhite),
                        )),
                        Obx(
                          () => SvgPicture.asset(
                            controller.muted.value == true
                                ? R.ASSETS_SVG_IC_TURNOFFMIC_MEMBER_SVG
                                : R.ASSETS_SVG_IC_TURNONMIC_SVG,
                            color: colorWhite,
                          ),
                        )
                      ],
                    ))
              ],
            );
          }
          id -= 1;
          return Container(
              child: Column(
            children: <Widget>[_videoView(views[id])],
          ));
        });
  }

  List<RemoteMicro> _getRenderViews(List<UserModel> lisUser) {
    final List<RemoteMicro> list = [];
    // if (widget.role == ClientRole.Broadcaster) {
    //   list.add(RtcLocalView.SurfaceView());
    // }
    lisUser.forEach(
      (UserModel user) => list.add(
        RemoteMicro(stateFull: RtcRemoteView.SurfaceView(uid: user.id ?? 10), mutedMicro: user.mutedMicro),
      ),
    );

    return list;
  }

  Widget _videoView(view) {
    final members = Get.find<LiveClassService>().members;
    final member = members.firstWhere(
      (element) => element.id == view.stateFull.uid,
      orElse: () => UserModel(),
    );
    return Expanded(
      child: GestureDetector(
        onTap: () {
          controller.remoteUidFirstSelected.value = view.stateFull.uid;
        },
        child: Stack(
          children: [
            Container(color: colorBlack, width: 180, margin: EdgeInsets.only(right: 16), child: view.stateFull),
            Positioned(
              bottom: 16,
              left: 16,
              right: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      // "You",
                      "${member.firstName ?? " "} ${member.lastName ?? ""}",
                      style: typoRegular14.copyWith(color: colorWhite),
                    ),
                  ),
                  SvgPicture.asset(
                    view.mutedMicro == true ? R.ASSETS_SVG_IC_TURNOFFMIC_MEMBER_SVG : R.ASSETS_SVG_IC_TURNONMIC_SVG,
                    color: colorWhite,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  pageFirst(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.tapBody();
            },
            child: Center(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: colorWhite,
                      height: 120,
                      child: _viewRows(controller.listUserLives),
                    ),
                    Expanded(
                      child: Center(
                        child: remoteVideo(controller.remoteUidFirstSelected.value, controller.idUserOffline.value),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(bottom: 0, child: bottomViewFirst(context))
      ],
    );
  }

  bottomViewFirst(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        // If the widget is visible, animate to 0.0 (invisible).
        // If the widget is hidden, animate to 1.0 (fully visible).
        opacity: controller.isVisibleBottom.value ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        // The green box must be a child of the AnimatedOpacity widget.
        child: Container(
          height: 82,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: boxShadow,
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.onToggleMute();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Obx(() => SvgPicture.asset(controller.muted.value == true
                            ? R.ASSETS_SVG_IC_MUTEMICRO_SVG
                            : R.ASSETS_SVG_IC_MICRORED_SVG)),
                        // SvgPicture.asset(R.ASSETS_SVG_IC_MICRORED_SVG),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Âm thanh", style: typoRegular12.copyWith(color: colorNeutralGray60))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await controller.tapVideo();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Obx(() => SvgPicture.asset(controller.hasVideo.value == true
                            ? R.ASSETS_SVG_IC_VIDEOLIV_SVG
                            : R.ASSETS_SVG_IC_VIDEORED_SVG)),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Video", style: typoRegular12.copyWith(color: colorNeutralGray60))
                      ],
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Column(
              //     children: [
              //       SvgPicture.asset(R.ASSETS_SVG_IC_SHARESCREEN_SVG),
              //       SizedBox(
              //         height: 4,
              //       ),
              //       Text("Chia sẻ",
              //           style: typoRegular12.copyWith(
              //               color: colorNeutralGray60))
              //     ],
              //   ),
              // ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LIVE_CLASS_MEMBERS, arguments: {
                      "members": controller.listUserLives,
                      "member": controller.roomMember.value,
                      "listReadHandUp": controller.listReadHandUp,
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SvgPicture.asset(R.ASSETS_SVG_IC_MEMBERS_SVG),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Thành viên",
                            style: typoRegular12.copyWith(color: colorNeutralGray60),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.bottomSheet(MoreOptionBottomSheet(), isScrollControlled: true, enableDrag: true);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        SvgPicture.asset(R.ASSETS_SVG_IC_MORES_SVG),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Khác", style: typoRegular12.copyWith(color: colorNeutralGray60))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pageSecond(BuildContext context) {
    final members = Get.find<LiveClassService>().members;
    final member = members.firstWhere(
      (element) => element.id == controller.memberFirstRoom.value.id,
      orElse: () => UserModel(),
    );
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: remoteVideo(controller.remoteUidSecondSelected.value, controller.idUserOffline.value),
            ),
            Positioned(
                right: 16,
                top: 0,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: colorBlack,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      width: 120,
                      height: 160,
                      child: controller.memberFirstRoom.value.id != null
                          ? remoteVideo(controller.memberFirstRoom.value.id, controller.idUserOffline.value)
                          : SizedBox(),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    // "You",
                                    "${member.firstName ?? " "} ${member.lastName ?? ""}",
                                    style: typoBold14.copyWith(color: colorWhite),
                                  ),
                                )
                              ],
                            )),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => SvgPicture.asset(
                                    controller.memberFirstRoom.value.mutedMicro == true
                                        ? R.ASSETS_SVG_IC_TURNOFFMIC_MEMBER_SVG
                                        : R.ASSETS_SVG_IC_TURNONMIC_SVG,
                                    color: colorWhite,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  pageThird(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: remoteVideo(controller.remoteUidFirstSelected.value, controller.idUserOffline.value),
        ),
      ),
    );
  }
}
