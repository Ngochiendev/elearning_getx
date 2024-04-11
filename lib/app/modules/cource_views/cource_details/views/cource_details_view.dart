import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_expansion_tile.dart';
import 'package:elearning/app/components/app_expansion_title_children.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/modules/cource_views/coure_trail_page/controllers/coure_trail_page_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../controllers/cource_details_controller.dart';

class CourceDetailsView extends GetView<CourceDetailsController> {
  final controller = Get.find<CourceDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
              "Chi tiết khóa học",
              style: typoBold16,
            ),
            backgroundColor: colorWhite,
            centerTitle: true,
            actions: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.CART_PRODUCT);
                    },
                    child: SvgPicture.asset(R.ASSETS_SVG_IC_CART_SVG,
                        color: colorBlack),
                  ),
                  SizedBox(
                    width: 16,
                  )
                ],
              )
            ],
          ),
          body: controller.course.value.id != null &&
                  controller.course.value.id! > 0
              ? Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderCourceDetails(),
                        teacherLayout(context),
                        controller.tabIndex.value == 0
                            ? TabbarPageView()
                            : TabbartrailPageView(),
                        FooterCourseDetails()
                      ],
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ));
  }

  teacherLayout(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.course.value.isAlreadyPurchased != null &&
                  controller.course.value.isAlreadyPurchased == 1
              ? Container()
              : Column(
                  children: [
                    Row(
                      children: [
                        Text("Giáo viên", style: typoBold18),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            width: 80,
                            height: 80,
                            child: controller.course.value.teacher?.attributes
                                        ?.avatar !=
                                    ''
                                ? AppNetworkImage(
                                    source:
                                        "$baseUrlImage${controller.course.value.teacher?.attributes?.avatar}",
                                    fit: BoxFit.cover,
                                  )
                                : SvgPicture.asset(
                                    R.ASSETS_SVG_AVATAR_DEFAULT_SVG,
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.course.value.teacher!.firstName ??
                                  "Nguyen Bao Quynh",
                              style: typoBold16,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              controller.course.value.teacher!.email ??
                                  "Clinical Professor",
                              style: typoRegular14,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            controller.removeAllHtmlTags(
                              controller.course.value.teacher!.attributes!
                                      .introduce ??
                                  "",
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: typoRegular14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Xem chi tiết",
                            style: typoRegular12.copyWith(
                                color: colorSemanticBlue100,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      height: 1,
                      decoration: BoxDecoration(
                        color: colorNeutralGray5,
                        boxShadow: boxShadow,
                      ),
                    ),
                  ],
                ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
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
                labelStyle: typoRegular18Bold.copyWith(color: colorBlack),
                unselectedLabelStyle: typoRegular16.copyWith(color: colorBlack),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: controller.course.value.trialChapters?.length == 0 ||
                        controller.course.value.isAlreadyPurchased == 1
                    ? [
                        Tab(
                          child: Text(
                            "Giáo án",
                          ),
                        ),
                      ]
                    : [
                        Tab(
                          child: Text(
                            "Giáo án",
                          ),
                        ),
                        Tab(
                          text: "Học thử",
                        ),
                      ],
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4, color: colorSemanticBlue100),
                  insets: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                ),
                labelPadding: EdgeInsets.symmetric(horizontal: 36.0),
                controller: controller.tabCtrl,
                onTap: (value) {
                  controller.onchangeTab(value);
                }),
          ),
        ],
      );
}

class TabbarPageView extends StatelessWidget {
  final controller = Get.find<CourceDetailsController>();
  // final controllerTrail = Get.find<CoureTrailPageController>();

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
                  "${Duration(seconds: controller.sumTime.value).inMinutes.remainder(60)} phút",
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
                  ? controller.course.value.chapters?.length ?? 0
                  : controller.course.value.chapters?.take(4).length,
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
                                    Text(
                                      controller
                                              .course
                                              .value
                                              .chapters?[item]
                                              .sessions?[index]
                                              .videos?[video]
                                              .briefDescription ??
                                          "",
                                      style: typoRegular14,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                        "${Duration(seconds: controller.course.value.chapters![item].sessions![index].videos![video].length!).inHours}:${Duration(seconds: controller.course.value.chapters![item].sessions![index].videos![video].length!).inMinutes.remainder(60)}:${Duration(seconds: controller.course.value.chapters![item].sessions![index].videos![video].length!).inSeconds.remainder(60)}",
                                        style: typoRegular14.copyWith(
                                          color: controller.titleCouser.value ==
                                                  controller
                                                      .course
                                                      .value
                                                      .chapters?[item]
                                                      .sessions?[index]
                                                      .videos?[video]
                                                      .briefDescription
                                              ? colorPrimaryBlue100
                                              : colorBlack,
                                        )),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                )),
                                controller.course.value.chapters?[item]
                                            .sessions?[index].isAllowTrial ==
                                        true
                                    ? InkWell(
                                        onTap: () {
                                          // controllerTrail.loadVideo(
                                          //     controller.course.value.id ?? 0,
                                          //     controller.course.value
                                          //             .chapters?[item].id ??
                                          //         0,
                                          //     controller
                                          //             .course
                                          //             .value
                                          //             .chapters?[item]
                                          //             .sessions?[index]
                                          //             .id ??
                                          //         0,
                                          //     controller
                                          //             .course
                                          //             .value
                                          //             .chapters?[item]
                                          //             .sessions?[index]
                                          //             .videos?[video]
                                          //             .id ??
                                          //         0,
                                          //     1080,
                                          //     controller
                                          //             .course
                                          //             .value
                                          //             .trialChapters![item]
                                          //             .sessions![index]
                                          //             .videos![video]
                                          //             .briefDescription ??
                                          //         "");
                                          Get.toNamed(Routes.COURE_TRAIL_PAGE,
                                              arguments:
                                                  controller.course.value.id ??
                                                      0);
                                        },
                                        child: Text(
                                          "Học thử",
                                          style: typoRegular14.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: colorSemanticBlue100),
                                        ),
                                      )
                                    : Container(),
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
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
                  ),
          ],
        ),
      ),
    );
  }
}

class TabbartrailPageView extends StatelessWidget {
  final controller = Get.find<CourceDetailsController>();
  // final controllerTrail = Get.find<CoureTrailPageController>();
  TabbartrailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: colorNeutralGray5)),
        padding: EdgeInsets.all(16),
        child: controller.course.value.trialChapters?.length == 0
            ? Text(
                "Khóa học này không cho phép học thử bạn hãy mua để trải nhiệm",
                style: typoRegular14Red,
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${controller.course.value.trialChapters?.length ?? 0} Chương",
                        style:
                            typoRegular14.copyWith(color: colorPrimaryBlue100),
                      ),
                      Text(
                        "${controller.listdatatrail.length} Bài học",
                        style:
                            typoRegular14.copyWith(color: colorPrimaryBlue100),
                      ),
                      Text(
                        "23 Giờ học",
                        style:
                            typoRegular14.copyWith(color: colorPrimaryBlue100),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.moreSsTrail.value
                        ? controller.course.value.trialChapters?.length ?? 0
                        : controller.course.value.trialChapters?.take(4).length,
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
                                itemBuilder: (context, video) => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(controller
                                                  .course
                                                  .value
                                                  .trialChapters?[item]
                                                  .sessions?[index]
                                                  .videos?[video]
                                                  .briefDescription ??
                                              ""),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                              "${Duration(seconds: controller.course.value.trialChapters![item].sessions![index].videos![video].length!).inHours}:${Duration(seconds: controller.course.value.trialChapters![item].sessions![index].videos![video].length!).inMinutes.remainder(60)}:${Duration(seconds: controller.course.value.trialChapters![item].sessions![index].videos![video].length!).inSeconds.remainder(60)}"),
                                        ],
                                      )),
                                      InkWell(
                                        onTap: () {
                                          // controllerTrail.loadVideo(
                                          //     controller.course.value.id ?? 0,
                                          //     controller.course.value
                                          //             .chapters?[item].id ??
                                          //         0,
                                          //     controller
                                          //             .course
                                          //             .value
                                          //             .chapters?[item]
                                          //             .sessions?[index]
                                          //             .id ??
                                          //         0,
                                          //     controller
                                          //             .course
                                          //             .value
                                          //             .chapters?[item]
                                          //             .sessions?[index]
                                          //             .videos?[video]
                                          //             .id ??
                                          //         0,
                                          //     1080,
                                          //     controller
                                          //             .course
                                          //             .value
                                          //             .trialChapters![item]
                                          //             .sessions![index]
                                          //             .videos![video]
                                          //             .briefDescription ??
                                          //         "");
                                          Get.toNamed(Routes.COURE_TRAIL_PAGE,
                                              arguments:
                                                  controller.course.value.id ??
                                                      0);
                                        },
                                        child: Text(
                                          "Học thử",
                                          style: typoRegular14.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: colorSemanticBlue100),
                                        ),
                                      )
                                    ]),
                              )
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
                        ),
                ],
              ),
      ),
    );
  }
}

class HeaderCourceDetails extends StatelessWidget {
  final controller = Get.find<CourceDetailsController>();
  HeaderCourceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: colorNeutralGray20,
                height: 240,
                width: double.infinity,
                child: FutureBuilder(
                  future: controller.initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: controller
                            .videoPlayerController.value.value.aspectRatio,
                        child:
                            VideoPlayer(controller.videoPlayerController.value),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                margin: EdgeInsets.only(
                  bottom: 16,
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    controller.playVideo();
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: FloatingActionButton(
                        elevation: 0.0,
                        backgroundColor: controller.isPlay.value
                            ? Colors.transparent
                            : colorWhite,
                        onPressed: () {
                          controller.playVideo();
                        },
                        child: Icon(
                            controller.isPlay.value
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: controller.isPlay.value
                                ? Colors.transparent
                                : colorSemanticRed100),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(controller.course.value.title ?? "Toán học lớp 2",
              style: typoBold24),
          SizedBox(
            height: 16,
          ),
          Html(
            data: controller.course.value.briefDescription ?? "",
            style: {
              '#': Style(
                fontSize: FontSize(12),
                maxLines: 3,
                textOverflow: TextOverflow.ellipsis,
              ),
            },
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(controller.course.value.ratingAvg ?? "4.5",
                        style: typoBold16),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                          "(${controller.course.value.totalRating ?? 0} lượt Đánh giá)",
                          style: typoRegular14),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.person, color: Colors.black),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text("(250 Học viên)", style: typoBold14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 40,
                  height: 40,
                  child:
                      controller.course.value.teacher?.attributes?.avatar != ''
                          ? AppNetworkImage(
                              source:
                                  "$baseUrlImage${controller.course.value.teacher?.attributes?.avatar}",
                              fit: BoxFit.cover,
                            )
                          : SvgPicture.asset(
                              R.ASSETS_SVG_AVATAR_DEFAULT_SVG,
                            ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                controller.course.value.teacher!.firstName ??
                    "ThS. Nguyễn Văn Anh",
                style: typoRegular14,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          controller.course.value.isAlreadyPurchased != null &&
                      controller.course.value.isAlreadyPurchased == 1 ||
                  controller.course.value.isFree == true
              ? Column(
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: colorPrimaryBlue100,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: AppTextButton(
                        onPressed: () {
                          controller.videoPlayerController.value.pause();
                          Get.toNamed(Routes.COURE_LEARN,
                              arguments: controller.course.value.id ?? 0);
                        },
                        color: colorWhite,
                        buttonTitle: "Bắt đầu học",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                )
              : Column(
                  children: [
                    Visibility(
                        visible: controller.course.value.isFree == true,
                        child: Row(
                          children: [
                            Text("Miễn phí",
                                style: typoBold24.copyWith(
                                    color: colorSemanticGreen100)),
                          ],
                        )),
                    Visibility(
                        visible: controller.course.value.isFree == false,
                        child: Row(
                          children: [
                            Text(
                                "${formatter.format(controller.purchase.value.discountPrice ?? 0)} đ",
                                style: typoBold24.copyWith(
                                    color: colorSemanticRed100)),
                          ],
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Visibility(
                        visible: controller.course.value.isFree == false,
                        child: Row(
                          children: [
                            Text(
                              "${formatter.format(controller.purchase.value.retailPrice ?? 0)} đ",
                              style: typoRegular16.copyWith(
                                  color: colorNeutralGray40,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        )),
                    controller.course.value.isFree == false
                        ? Row(
                            children: [
                              Text("Chọn gói mua", style: typoBold16),
                            ],
                          )
                        : Ink(),
                    controller.course.value.isFree == false
                        ? Container(
                            margin: EdgeInsets.symmetric(vertical: 16),
                            child: GridView.count(
                              childAspectRatio:
                                  MediaQuery.of(context).size.height / 256,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              children: controller.purchasePackages
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          controller.setPurchasePackage(e);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          padding: EdgeInsets.all(8),
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.purchase.value == e
                                                    ? Color(0xFFFCF4F5)
                                                    : colorNeutralGray5,
                                            border: Border.all(
                                                width: 1,
                                                color: controller
                                                            .purchase.value ==
                                                        e
                                                    ? Color(0xFFEC8B8B)
                                                    : colorBorderViewSearch),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Gói ${e.duration ?? 0} tháng",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )
                        : Container(),
                    controller.course.value.isFree == true
                        ? Container()
                        : ElevatedButtonBase(
                            mainColor: colorSemanticRed100,
                            // mainColor: colorSemanticRed100,
                            height: 40,
                            size: 14,
                            weight: FontWeight.w700,
                            buttonTitle: "Thêm vào giỏ",
                            onPressed: () {
                              controller.addToCart();
                            },
                          ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButtonBase(
                      height: 32,
                      size: 14,
                      buttonTitle: controller.course.value.isFree == true
                          ? "Bắt đầu học"
                          : controller.course.value.trialChapters!.length == 0
                              ? "Mua ngay"
                              : "Học thử",
                      weight: FontWeight.w700,
                      mainColor:
                          controller.course.value.trialChapters!.length == 0
                              ? colorSemanticRed40
                              : colorPrimaryBlue100,
                      onPressed: () async {
                        controller.videoPlayerController.value.pause();
                        if (controller.course.value.isFree == true) {
                          Get.toNamed(Routes.COURE_LEARN,
                              arguments: controller.course.value.id ?? 0);
                        } else if (controller.course.value.isAllowTrial != 1) {
                          controller.addToCart();
                        } else {
                          Get.toNamed(Routes.COURE_TRAIL_PAGE,
                              arguments: controller.course.value.id ?? 0);
                        }
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      height: 1,
                      decoration: BoxDecoration(
                        color: colorNeutralGray5,
                        boxShadow: boxShadow,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class FooterCourseDetails extends StatelessWidget {
  final controller = Get.find<CourceDetailsController>();
  ScrollController _scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  FooterCourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text("Tài liệu tham khảo", style: typoBold18),
          SizedBox(
            height: 16,
          ),
          Wrap(
            children: controller.document
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      // launch(e.source ?? "");
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: colorNeutralGray5),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFE5F3FE),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xFFE5F3FE),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  )),
                              width: 80,
                              height: 80,
                              padding: EdgeInsets.all(16),
                              child: SvgPicture.asset(
                                R.ASSETS_SVG_IC_DOCX_SVG,
                                width: 16,
                                height: 20,
                              )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(e.fileName ?? "Không có tài liệu",
                                  style: typoBold14),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                fullStringTimeFormat(e.updatedAt ?? "") +
                                    "  ${e.fileType ?? ""}",
                                style: typoRegular12,
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Text("Lợi ích khóa học", style: typoBold18),
          SizedBox(
            height: 16,
          ),
          Html(
            data: controller.course.value.benefit ?? "",
            style: {
              '#': Style(
                color: colorNeutralGray60,
                fontSize: FontSize(14),
              ),
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Text("Yêu cầu", style: typoBold18),
          SizedBox(
            height: 16,
          ),
          Html(
            data: controller.course.value.requirement ?? "",
            style: {
              '#': Style(
                color: colorNeutralGray60,
                fontSize: FontSize(14),
              ),
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Text("Mô tả khóa học", style: typoBold18),
          SizedBox(
            height: 16,
          ),
          Html(
            data: controller.course.value.description ?? "",
            style: {
              '#': Style(
                color: colorNeutralGray60,
                fontSize: FontSize(14),
              ),
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Khóa học khuyến mại", style: typoBold18),
              Text(
                "Xem thêm",
                style: typoRegular12.copyWith(
                    color: colorSemanticBlue100,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
          SizedBox(height: 16),
          controller.listCourse.length > 0
              ? Container(
                  height: 360,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listCourse.length,
                      itemBuilder: (context, e) => GestureDetector(
                            onTap: () async {
                              // controller.videoPlayerController.value.dispose();
                              controller.scrollController.animateTo(
                                controller
                                    .scrollController.position.minScrollExtent,
                                duration: Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn,
                              );
                              await controller.getListCourseDetails(
                                  controller.listCourse[e].id!);
                              await controller.getlistCourse();

                              if (controller.videoPlayerController.value !=
                                  null) {
                                controller.videoPlayerController.value
                                    .dispose();
                              }
                              controller.videoPlayerController.value =
                                  VideoPlayerController.network(
                                controller.course.value.introVideo ?? "",
                              );

                              // Initialize the controller and store the Future for later use.
                              controller.initializeVideoPlayerFuture =
                                  controller.videoPlayerController.value
                                      .initialize();

                              // Use the controller to loop the video.
                              controller.videoPlayerController.value
                                  .setLooping(true);
                            },
                            child: Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: colorWhite,
                                  boxShadow: boxShadow),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 92,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8)),
                                          color: Colors.yellow,
                                        ),
                                        child: AppNetworkImage(
                                          source: controller
                                                  .listCourse.value[e].avatar ??
                                              "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                          left: 16,
                                          top: 8,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              controller.listCourse.value[e]
                                                              .discountPercentage !=
                                                          null &&
                                                      controller
                                                              .listCourse
                                                              .value[e]
                                                              .discountPercentage! >
                                                          0
                                                  ? Container(
                                                      width: 40,
                                                      height: 20,
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(16),
                                                        ),
                                                        color:
                                                            colorSemanticRed100,
                                                      ),
                                                      child: Text(
                                                        '-${controller.listCourse.value[e].discountPercentage ?? -50}' +
                                                            "%",
                                                        style: typoSemiBold10
                                                            .copyWith(
                                                                color:
                                                                    colorWhite,
                                                                fontSize: 8),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  : SizedBox(height: 8),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              // Text(
                                              //   e.teacher ?? "Thầy Văn Tuấn",
                                              //   style: typoRegular10.copyWith(
                                              //       color: colorWhite),
                                              // ),
                                              // SizedBox(
                                              //   height: 8,
                                              // ),
                                              // Text(
                                              //   "Hóa học - Lớp 3",
                                              //   style: typoRegular10.copyWith(
                                              //       color: colorWhite,
                                              //       fontSize: 8),
                                              // ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      controller.listCourse.value[e].title ??
                                          "",
                                      style: typoLight14,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    child: Html(
                                      data: controller.listCourse.value[e]
                                              .briefDescription ??
                                          "",
                                      style: {
                                        '#': Style(
                                          //color: colorNeutralGray60,
                                          fontSize: FontSize(12),
                                          maxLines: 3,
                                          textOverflow: TextOverflow.ellipsis,
                                        ),
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                            child: controller.listCourse
                                                        .value[e].retailPrice !=
                                                    0
                                                ? Text(
                                                    "${formatter.format(controller.listCourse.value[e].retailPrice ?? 0)} đ",
                                                    style: typoBold12.copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        letterSpacing: 0.0))
                                                : Text("",
                                                    style: typoBold12.copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        letterSpacing: 0.0)))
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        controller.listCourse.value[e].price !=
                                            null,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              "${formatter.format(controller.listCourse.value[e].price ?? 0)} đ",
                                              style: typoBold14.copyWith(
                                                  color: colorSemanticRed100,
                                                  letterSpacing: 0.0))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        controller.listCourse.value[e].price ==
                                            null,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text("Miễn phí",
                                              style: typoLight14.copyWith(
                                                  color: colorSemanticGreen100))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: ElevatedButtonBase(
                                      height: 32,
                                      size: 14,
                                      buttonTitle: "Học thử",
                                      onPressed: () async {
                                        // _scrollController.jumpTo(0);
                                        await controller.toCourseDiscount(
                                            controller.listCourse.value[e]);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                )
              : Ink(),
          // Container(
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     boxShadow: boxShadow,
          //   ),
          //   padding: EdgeInsets.all(16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: ElevatedButtonBase(
          //           height: 40,
          //           size: 14,
          //           weight: FontWeight.w700,
          //           buttonTitle: "Học thử",
          //           onPressed: () async {
          //             Get.back();
          //           },
          //         ),
          //       ),
          //       SizedBox(
          //         width: 16,
          //       ),
          //       Expanded(
          //         child: ElevatedButtonBase(
          //           mainColor: colorSemanticRed100,
          //           height: 40,
          //           size: 14,
          //           weight: FontWeight.w700,
          //           buttonTitle: "Thêm vào giỏ",
          //           onPressed: () async {
          //             await controller.addToCart();
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
