import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:video_player/video_player.dart';

import '../controllers/detal_teacher_controller.dart';

class DetalTeacherView extends GetView<DetalTeacherController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
            "Giáo viên",
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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [HeaderCourceDetails()],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderCourceDetails extends StatelessWidget {
  final controller = Get.find<DetalTeacherController>();
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
                  child: controller.modelDetail.value.teacher?.teacher
                              ?.attributes?.avatar ==
                          ''
                      ? SvgPicture.asset(
                          R.ASSETS_SVG_AVATAR_DEFAULT_SVG,
                        )
                      : AppNetworkImage(
                          source:
                              "$baseUrlImage${controller.modelDetail.value.teacher?.teacher?.attributes?.avatar}",
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                controller.modelDetail.value.teacher?.teacher?.firstName ??
                    "ThS. Nguyễn Văn Anh",
                style: typoRegular14,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${controller.modelDetail.value.teacher?.rating ?? 0}",
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
                        "(${controller.modelDetail.value.teacher?.totalRating ?? 0} lượt xếp hạng)",
                        style: typoRegular14),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(R.ASSETS_SVG_PERSION_SVG),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                        "(${controller.modelDetail.value.teacher?.totalUser ?? 0} Học viên)",
                        style: typoBold14),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        R.ASSETS_SVG_AKAR_ICONS_FILE_SVG,
                        color: colorPrimaryBlue100,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                        "${controller.modelDetail.value.teacher?.totalCourse ?? 0} khóa học",
                        style: typoRegular14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
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
            children: [
              Text("Giới thiệu", style: typoBold18),
            ],
          ),
          Html(
            data: "this is detail ",
            style: {
              '#': Style(
                fontSize: FontSize(12),
                maxLines: 3,
                textOverflow: TextOverflow.ellipsis,
              ),
            },
          ),
          Row(
            children: [
              InkWell(
                onTap: () => showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => buildDescrition(context, controller,
                      des: "this is detail"),
                ),
                child: Text("xem chi tiết",
                    style: typoRegular14.copyWith(
                        decoration: TextDecoration.underline,
                        color: colorPrimaryBlue100)),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Các khóa học", style: typoBold24),
              InkWell(
                onTap: () => controller.tapSemore(controller.listCourseTeacher),
                child: Text("xem thêm",
                    style: typoRegular14.copyWith(color: colorPrimaryBlue100)),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ListCourseCategory()
        ],
      ),
    );
  }

  buildDescrition(BuildContext context, DetalTeacherController controller,
      {String des = ""}) {
    return Material(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Container(),
        middle: Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color(0xFFE6E6E6),
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, bottom: 16),
              child: Row(
                children: [
                  Text("Giới thiệu", style: typoBold18),
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                showTrackOnHover: true,
                thickness: 5,
                radius: Radius.circular(30),
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Html(
                    data: "this is detail ",
                    style: {
                      '#': Style(
                        fontSize: FontSize(12),
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    },
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class ListCourseCategory extends StatelessWidget {
  final controller = Get.find<DetalTeacherController>();
  ListCourseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        courseTeacher(context),
      ],
    );
  }

  courseTeacher(BuildContext context) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.listCourseTeacher.length > 0
                ? Wrap(
                    children: controller.listCourseTeacher
                        .take(8)
                        .map(
                          (e) => GestureDetector(
                              onTap: () => controller.toNatiDetail(e.id ?? 0),
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width - 64) /
                                        2,
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
                                          ),
                                          child: AppNetworkImage(
                                            source: e.avatar ?? "",
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
                                                e.discountPercentage != null &&
                                                        e.isFree == false
                                                    ? Container(
                                                        width: 40,
                                                        height: 20,
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(16),
                                                          ),
                                                          color:
                                                              colorSemanticRed100,
                                                        ),
                                                        child: Text(
                                                          '-${e.discountPercentage ?? -50}' +
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
                                              ],
                                            ))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e.title ?? "",
                                          style: typoLight14Course,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Container(
                                      height: 60,
                                      child: Visibility(
                                        child: Html(
                                          data: e.briefDescription ?? "",
                                          style: {
                                            '#': Style(
                                              color: colorNeutralGray60,
                                              fontSize: FontSize(12),
                                              maxLines: 3,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // height: 30,
                                      child: e.isFree == false
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        "${formatter.format(e.retailPrice ?? 0)} đ",
                                                        style:
                                                            typoBold12.copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          letterSpacing: 0.0,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    child: Text("",
                                                        style:
                                                            typoBold12.copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          letterSpacing: 0.0,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),
                                    Container(
                                      // height: 30,
                                      child: e.isFree == true
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text("Miễn phí",
                                                      style: typoBold14.copyWith(
                                                          color:
                                                              colorSemanticGreen100))
                                                ],
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "${formatter.format(e.price ?? 0)} đ",
                                                      style: typoBold14.copyWith(
                                                          color:
                                                              colorSemanticRed100,
                                                          letterSpacing: 0.0))
                                                ],
                                              ),
                                            ),
                                    ),
                                    // SizedBox(
                                    //   height: 8,
                                    // ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      child: ElevatedButtonBase(
                                        mainColor: e.isFree == true
                                            ? colorSemanticGreen100
                                            : colorPrimaryBlue100,
                                        height: 32,
                                        size: 14,
                                        buttonTitle: e.isFree == true
                                            ? "Học miễn phí"
                                            : e.isAllowTrial == 1
                                                ? "Học thử"
                                                : "Xem chi tiết",
                                        onPressed: () async {
                                          if (e.isFree == true) {
                                            controller
                                                .toNatiCouseLern(e.id ?? 0);
                                          } else if (e.isAllowTrial == 1) {
                                            Get.toNamed(Routes.COURE_TRAIL_PAGE,
                                                arguments: e.id ?? 0);
                                          } else {
                                            controller.toNatiDetail(e.id ?? 0);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                        .toList(),
                  )
                : Center(child: CircularProgressIndicator()),
          ],
        ),
      );
}
