import 'package:chewie/chewie.dart';
import 'package:elearning/app/components/app_expansion_tile.dart';
import 'package:elearning/app/components/app_expansion_title_children.dart';
import 'package:elearning/app/modules/cource_views/coure_learn/views/comment_session_view.dart';
import 'package:elearning/app/modules/cource_views/coure_learn/views/trail_page_view.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:elearning/generated/resource.dart';
import '../controllers/coure_trail_page_controller.dart';

class CoureTrailPageView extends GetView<CoureTrailPageController> {
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
            "Học thử",
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
                        controller.tabIndex.value == 0
                            ? TabbarTrailPageView()
                            : TabbarPageView(),
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
                    text: "Học thử",
                  ),
                  Tab(
                    text: "Giáo án",
                  ),
                ],
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4, color: colorSemanticBlue100),
                  insets: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                ),
                labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
                controller: controller.tabTrailCtrl,
                onTap: (value) {
                  controller.onchangeTab(value);
                }),
          ),
        ],
      );
}

class HeaderCourceLearn extends StatelessWidget {
  final controller = Get.find<CoureTrailPageController>();
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
                  )
          ],
        ),
      ),
    );
  }
}

class TabbarTrailPageView extends StatelessWidget {
  final controller = Get.find<CoureTrailPageController>();

  TabbarTrailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.course.value.trialChapters == null
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
                    itemCount: controller.moreSsTrail.value
                        ? controller.course.value.trialChapters!.length
                        : controller.course.value.trialChapters!.take(4).length,
                    itemBuilder: (context, item) => AppExpansionTile(
                      title: Text(
                          controller.course.value.trialChapters?[item].title ??
                              "",
                          style: typoBold14),
                      initiallyExpanded: false,
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.course.value
                                  .trialChapters?[item].sessions?.length ??
                              3,
                          itemBuilder: (context, index) =>
                              AppExpansionTileChildren(
                            title: Text(
                                controller.course.value.trialChapters?[item]
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
                                        .trialChapters?[item]
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
                                              .trialChapters![item].id!,
                                          controller
                                              .course
                                              .value
                                              .trialChapters![item]
                                              .sessions![index]
                                              .id!,
                                          controller
                                              .course
                                              .value
                                              .trialChapters![item]
                                              .sessions![index]
                                              .videos![video]
                                              .id!,
                                          1080,
                                          controller
                                              .course
                                              .value
                                              .trialChapters![item]
                                              .sessions![index]
                                              .videos![video]
                                              .briefDescription!);
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
                                                              .titleCouser
                                                              .value ==
                                                          controller
                                                              .course
                                                              .value
                                                              .trialChapters?[
                                                                  item]
                                                              .sessions?[index]
                                                              .videos?[video]
                                                              .briefDescription ||
                                                      controller
                                                              .videoID.value ==
                                                          controller
                                                              .course
                                                              .value
                                                              .trialChapters?[
                                                                  item]
                                                              .sessions?[index]
                                                              .videos?[video]
                                                              .id
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
                                                            .trialChapters?[
                                                                item]
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
                                                                      .trialChapters?[
                                                                          item]
                                                                      .sessions?[
                                                                          index]
                                                                      .videos?[
                                                                          video]
                                                                      .briefDescription ||
                                                              controller.videoID
                                                                      .value ==
                                                                  controller
                                                                      .course
                                                                      .value
                                                                      .trialChapters?[
                                                                          item]
                                                                      .sessions?[
                                                                          index]
                                                                      .videos?[
                                                                          video]
                                                                      .id
                                                          ? colorPrimaryBlue100
                                                          : colorBlack,
                                                    )),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    "${Duration(seconds: controller.course.value.trialChapters![item].sessions![index].videos![video].length!).inHours}:${Duration(seconds: controller.course.value.trialChapters![item].sessions![index].videos![video].length!).inMinutes.remainder(60)}:${Duration(seconds: controller.course.value.trialChapters![item].sessions![index].videos![video].length!).inSeconds.remainder(60)}",
                                                    style:
                                                        typoRegular14.copyWith(
                                                      color: controller
                                                                  .titleCouser
                                                                  .value ==
                                                              controller
                                                                  .course
                                                                  .value
                                                                  .trialChapters?[
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  controller.course.value.trialChapters!.length <= 4
                      ? Container()
                      : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: styleButtonWhiteBorder,
                                child: Text("Xem thêm"),
                                onPressed: () {
                                  controller.moreSessionTrail(controller
                                      .moreSsTrail
                                      .value = !controller.moreSsTrail.value);
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

class TabbarPageView extends StatelessWidget {
  final controller = Get.find<CoureTrailPageController>();

  TabbarPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: colorNeutralGray5)),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${controller.course.value.chapters?.length ?? 0} Chương",
                  style: typoRegular14.copyWith(color: colorPrimaryBlue100),
                ),
                Text(
                  "${controller.listdata.length} Bài học",
                  style: typoRegular14.copyWith(color: colorPrimaryBlue100),
                ),
                Text(
                  "23 Giờ học",
                  style: typoRegular14.copyWith(color: colorPrimaryBlue100),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.moreSs.value
                  ? controller.course.value.chapters!.length
                  : controller.course.value.chapters!.take(4).length,
              itemBuilder: (context, item) => AppExpansionTile(
                title: Text(controller.course.value.chapters?[item].title ?? "",
                    style: typoBold14),
                initiallyExpanded: false,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller
                            .course.value.chapters?[item].sessions?.length ??
                        3,
                    itemBuilder: (context, index) => AppExpansionTileChildren(
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
                          itemCount: controller.course.value.chapters?[item]
                                  .sessions?[index].videos?.length ??
                              3,
                          itemBuilder: (context, video) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                      R.ASSETS_SVG_IC_CALENDAR_SVG),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller
                                            .course
                                            .value
                                            .chapters?[item]
                                            .sessions?[index]
                                            .videos?[video]
                                            .briefDescription ??
                                        ""),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                        "${Duration(seconds: controller.course.value.chapters![item].sessions![index].videos![video].length!).inHours}:${Duration(seconds: controller.course.value.chapters![item].sessions![index].videos![video].length!).inMinutes.remainder(60)}:${Duration(seconds: controller.course.value.chapters![item].sessions![index].videos![video].length!).inSeconds.remainder(60)}"),
                                  ],
                                )),
                              ]),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            controller.course.value.chapters!.length <= 4
                ? Container()
                : Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: styleButtonWhiteBorder,
                          child: Text(
                              controller.moreSs.value ? "Thu gọn" : "Xem thêm"),
                          onPressed: () {
                            controller.moreSession(controller.moreSs.value =
                                !controller.moreSs.value);
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
