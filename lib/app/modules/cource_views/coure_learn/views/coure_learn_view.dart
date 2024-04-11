import 'package:chewie/chewie.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_expansion_tile.dart';
import 'package:elearning/app/components/app_expansion_title_children.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/modules/cource_views/cource_details/controllers/cource_details_controller.dart';
import 'package:elearning/app/modules/cource_views/cource_details/views/cource_details_view.dart';
import 'package:elearning/app/modules/cource_views/coure_learn/views/comment_session_view.dart';
import 'package:elearning/app/modules/cource_views/coure_learn/views/document_cousrer_view.dart';
import 'package:elearning/app/modules/cource_views/coure_learn/views/rateting_course.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get_cli/samples/impl/get_controller.dart';
import 'package:video_player/video_player.dart';

import '../controllers/coure_learn_controller.dart';

class CoureLearnView extends GetView<CoureLearnController> {
  ScrollController _scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(R.ASSETS_SVG_IC_BACK_BLACK_SVG),
            ),
          ),
          title: Text(
            "Khóa học của bạn",
            style: typoBold16,
          ),
          backgroundColor: colorWhite,
          centerTitle: true,
        ),
        body:
            // controller.course.value.id != null &&
            // controller.course.value.id! > 0
            Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderCourceLearn(),
                        tabLayout(context),
                        SizedBox(
                          height: 16,
                        ),
                        controller.tabIndex.value == 0
                            ? TabbarPageView()
                            : controller.tabIndex.value == 1
                                ? DocumentBookPage()
                                : controller.tabIndex.value == 2
                                    ? CommentSessionView()
                                    : RatetingCourse()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  tabLayout(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Container(
            width: double.infinity,
            child: TabBar(
                isScrollable: true,
                unselectedLabelColor: colorBlack,
                indicatorColor: colorSecondaryRed100,
                labelStyle: typoRegular12.copyWith(color: colorBlack),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: "Giáo án",
                  ),
                  Tab(
                    text: "Tài liệu",
                  ),
                  Tab(
                    text: "Thảo luận",
                  ),
                  Tab(
                    text: "Đánh giá ",
                  ),
                ],
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4, color: colorSemanticBlue100),
                  insets: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                ),
                labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
                controller: controller.tabCtrl,
                onTap: (value) {
                  controller.onchangeTab(value);
                }),
          ),
        ],
      );
}

class HeaderCourceLearn extends StatelessWidget {
  final controller = Get.find<CoureLearnController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: colorNeutralGray20,
                  height: 240,
                  width: double.infinity,
                  child: controller.chewieController != null &&
                          controller.chewieController!.videoPlayerController
                              .value.isInitialized
                      ? Chewie(
                          controller: controller.chewieController!,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text('Loading'),
                          ],
                        ),
                  margin: EdgeInsets.only(
                    bottom: 16,
                  ),
                ),
                // Positioned(
                //   top: 0,
                //   bottom: 0,
                //   left: 0,
                //   right: 0,
                //   child: GestureDetector(
                //     onTap: () {
                //       controller.playVideo();
                //     },
                //     child: Container(
                //       width: double.infinity,
                //       height: double.infinity,
                //       child: Center(
                //         child: FloatingActionButton(
                //           elevation: 0.0,
                //           backgroundColor: controller.isPlay.value
                //               ? Colors.transparent
                //               : colorWhite,
                //           onPressed: () {
                //             controller.playVideo();
                //           },
                //           child: Icon(
                //               controller.isPlay.value
                //                   ? Icons.pause
                //                   : Icons.play_arrow,
                //               color: controller.isPlay.value
                //                   ? Colors.transparent
                //                   : colorSemanticRed100),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // // ControlsOverlay(controller: controller.videoPlayerController.value),
              ],
            ),
            Text(controller.course.value.title ?? "Toán học lớp 2",
                style: typoBold24),
            SizedBox(
              height: 16,
            ),
            Html(
              data: controller.titleCouser.value,
              style: {
                '#': Style(
                  color: colorNeutralGray60,
                  fontSize: FontSize(14),
                ),
              },
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            controller.video.value.session?.exerciseId == null
                ? Container()
                : InkWell(
                    onTap: () {
                      controller.videoPlayerController.value.pause();
                      controller.demoToExercise();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: colorSemanticYellow100,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(R.ASSETS_SVG_IC_BAITAP_SVG),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Làm bài luyện tập",
                            style: typoBold14,
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class TabbarPageView extends StatelessWidget {
  final controller = Get.find<CoureLearnController>();

  TabbarPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.course.value.chapters == null
          ? Container()
          : Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: colorNeutralGray5)),
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.course.value.chapters!.length,
                    itemBuilder: (context, item) => AppExpansionTile(
                      title: Text(
                          controller.course.value.chapters?[item].title ?? "",
                          style: typoBold14),
                      initiallyExpanded: false,
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.course.value.chapters?[item]
                                  .sessions?.length ??
                              3,
                          itemBuilder: (context, index) =>
                              AppExpansionTileChildren(
                            title: Text(
                                controller.course.value.chapters?[item]
                                        .sessions?[index].title ??
                                    "",
                                style: typoBold14),
                            initiallyExpanded: false,
                            children: [
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller
                                        .course
                                        .value
                                        .chapters?[item]
                                        .sessions?[index]
                                        .videos
                                        ?.length ??
                                    3,
                                itemBuilder: (context, video) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.loadVideo(
                                          controller.id.value,
                                          controller.course.value
                                                  .chapters![item].id ??
                                              0,
                                          controller
                                                  .course
                                                  .value
                                                  .chapters![item]
                                                  .sessions![index]
                                                  .id ??
                                              0,
                                          controller
                                                  .course
                                                  .value
                                                  .chapters![item]
                                                  .sessions![index]
                                                  .videos![video]
                                                  .id ??
                                              0,
                                          1080,
                                          controller
                                                  .course
                                                  .value
                                                  .chapters![item]
                                                  .sessions![index]
                                                  .videos![video]
                                                  .briefDescription ??
                                              "");
                                      controller.scrollController.animateTo(
                                        controller.scrollController.position
                                            .minScrollExtent,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    },
                                    child: Obx(
                                      () => Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: SvgPicture.asset(controller
                                                          .titleCouser.value ==
                                                      controller
                                                          .course
                                                          .value
                                                          .chapters?[item]
                                                          .sessions?[index]
                                                          .videos?[video]
                                                          .briefDescription
                                                  ? R.ASSETS_SVG_PLAYCOUSER_SVG
                                                  : R.ASSETS_SVG_PLAYCOUSERGREEN_SVG),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    controller
                                                            .course
                                                            .value
                                                            .chapters?[item]
                                                            .sessions?[index]
                                                            .videos?[video]
                                                            .briefDescription ??
                                                        "",
                                                    style:
                                                        typoRegular14.copyWith(
                                                      color: controller
                                                                  .titleCouser
                                                                  .value ==
                                                              controller
                                                                  .course
                                                                  .value
                                                                  .chapters?[
                                                                      item]
                                                                  .sessions?[
                                                                      index]
                                                                  .videos?[
                                                                      video]
                                                                  .briefDescription
                                                          ? colorPrimaryBlue100
                                                          : colorBlack,
                                                    )),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    "${Duration(seconds: controller.course.value.chapters![item].sessions![index].videos![video].length!).inHours}:${Duration(seconds: controller.course.value.chapters![item].sessions![index].videos![video].length!).inMinutes.remainder(60)}:${Duration(seconds: controller.course.value.chapters![item].sessions![index].videos![video].length!).inSeconds.remainder(60)}",
                                                    style:
                                                        typoRegular14.copyWith(
                                                      color: controller
                                                                  .titleCouser
                                                                  .value ==
                                                              controller
                                                                  .course
                                                                  .value
                                                                  .chapters?[
                                                                      item]
                                                                  .sessions?[
                                                                      index]
                                                                  .videos?[
                                                                      video]
                                                                  .briefDescription
                                                          ? colorPrimaryBlue100
                                                          : colorBlack,
                                                    )),
                                              ],
                                            )),
                                          ]),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
