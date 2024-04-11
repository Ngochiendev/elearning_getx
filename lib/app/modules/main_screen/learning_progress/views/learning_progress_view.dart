import 'package:carousel_slider/carousel_slider.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/app_percent_indicator.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/learning_progress_controller.dart';

class LearningProgressView extends GetView<LearningProgressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          "Tiến trình học tập",
          style: typoBold24,
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(R.ASSETS_SVG_IC_FILTER_BLACK_SVG,
                    color: colorBlack),
              ),
              SizedBox(
                width: 16,
              )
            ],
          )
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Obx(
            () => controller.learnProgress.length == 0
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        height: 114,
                        width: double.infinity,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 100,
                              aspectRatio: 2.0,
                              initialPage: 0,
                              onPageChanged: (index, reason) {
                                // controller.setSliderIndex(index);
                              }),
                          items: controller.learnProgress.map(
                            (e) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.COURE_LEARN,
                                          arguments: e.id);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          16 * 2,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16)),
                                                gradient: new LinearGradient(
                                                    colors: colorGradientBlue2,
                                                    stops: [0.0, 1.0],
                                                    begin: FractionalOffset
                                                        .topRight,
                                                    end: FractionalOffset
                                                        .topLeft,
                                                    tileMode:
                                                        TileMode.repeated)),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                30 * 2,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 16),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: 122,
                                                        height: 68,
                                                        child:
                                                            e.avatar == null ||
                                                                    e.avatar ==
                                                                        ""
                                                                ? Column(
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                        R.ASSETS_SVG_NOIMAGE_CAUSE_SVG,
                                                                        width:
                                                                            120,
                                                                        height:
                                                                            40,
                                                                      ),
                                                                      Text(
                                                                        "No Image Found",
                                                                        style: typoRegular12.copyWith(
                                                                            color:
                                                                                colorNeutralGray40),
                                                                      )
                                                                    ],
                                                                  )
                                                                : ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.98),
                                                                    child:
                                                                        AppNetworkImage(
                                                                      source: e
                                                                          .avatar,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 0.0,
                                                                top: 8),
                                                        child:
                                                            AppPercentIndicator(
                                                          backgroundColor:
                                                              Colors.grey,
                                                          width: 122,
                                                          lineHeight: 5.0,
                                                          percent:
                                                              e.totalProgress! /
                                                                  100,
                                                          barRadius:
                                                              Radius.circular(
                                                                  15.0),
                                                          progressColor:
                                                              colorSemanticYellow100,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 16),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      122 -
                                                      38 -
                                                      16 * 4,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Tiếp tục học",
                                                            style: typoBold16
                                                                .copyWith(
                                                                    color:
                                                                        colorSemanticYellow100),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              e.title ?? "",
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: typoSemiBold14
                                                                  .copyWith(
                                                                      color:
                                                                          colorWhite),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              e.teacher!
                                                                      .firstName ??
                                                                  "",
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: typoSemiBold14
                                                                  .copyWith(
                                                                      color:
                                                                          colorWhite),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                              right: 0,
                                              top: 0,
                                              bottom: 0,
                                              child: SvgPicture.asset(R
                                                  .ASSETS_SVG_BI_PLAY_CIRCLE_FILL_SVG))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      controller.learnNewProgress.length == 0
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Mới",
                                    style: typoBold18,
                                  ),
                                ],
                              ),
                            ),
                      Wrap(
                        children: controller.learnNewProgress
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.LEAARN_EXERCISE,
                                        arguments: e.id);
                                  },
                                  child: Column(
                                    children: [
                                      buildItem(
                                        context,
                                        e.title!,
                                        e.avatar ?? "",
                                        e.teacher!.firstName!,
                                        e.userCourses![0].expireAt.toString(),
                                        e.totalProgress ?? 0,
                                        () {
                                          print("oneTap");
                                        },
                                        () {
                                          print("secTap");
                                        },
                                        isDone: e.totalProgress == 100
                                            ? true
                                            : false,
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      controller.learnContinueProgress.length == 0
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Học tiếp",
                                    style: typoBold18,
                                  ),
                                ],
                              ),
                            ),
                      Wrap(
                        children: controller.learnContinueProgress
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.LEAARN_EXERCISE,
                                        arguments: e.id);
                                  },
                                  child: Column(
                                    children: [
                                      buildItem(
                                        context,
                                        e.title!,
                                        e.avatar ?? "",
                                        e.teacher!.firstName!,
                                        e.userCourses![0].expireAt.toString(),
                                        e.totalProgress ?? 0,
                                        () {
                                          print("oneTap");
                                        },
                                        () {
                                          print("secTap");
                                        },
                                        isDone: e.totalProgress == 100
                                            ? true
                                            : false,
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      controller.learnCompleteProgress.length == 0
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Hoàn Thành",
                                    style: typoBold18,
                                  ),
                                ],
                              ),
                            ),
                      Wrap(
                        children: controller.learnCompleteProgress
                            .map((e) => Column(
                                  children: [
                                    InkWell(
                                      onTap: () => {
                                        Get.toNamed(Routes.LEAARN_CERTIFICATE,
                                            arguments: e.id),
                                      },
                                      child: buildItem(
                                        context,
                                        e.title!,
                                        e.avatar ?? "",
                                        e.teacher!.firstName!,
                                        e.userCourses![0].expireAt.toString(),
                                        e.totalProgress ?? 0,
                                        () {
                                          print("oneTap");
                                        },
                                        () {
                                          print("secTap");
                                        },
                                        isDone: e.totalProgress == 100
                                            ? true
                                            : false,
                                        rating: e.ratingAvg!,
                                      ),
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(
      BuildContext context,
      String nameBook,
      String imageBook,
      String author,
      String expireDate,
      int percent,
      GestureTapCallback onTapOne,
      GestureTapCallback onTapTwo,
      {bool isDone = false,
      int rating = 0}) {
    return Container(
      child: Slidable(
        enabled: isDone,
        endActionPane: ActionPane(
          openThreshold: 0.5,
          motion: DrawerMotion(),
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: onTapOne,
                child: Container(
                  width: 80,
                  height: double.infinity,
                  color: colorSemanticYellow100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: SvgPicture.asset(
                              R.ASSETS_SVG_IC_STAR_OUT_LINE_SVG),
                        ),
                        Text(
                          LocaleKeys.label_evaluation.tr,
                          style: typoBold12White,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: onTapTwo,
                child: Container(
                  height: double.infinity,
                  width: 80,
                  color: colorPrimaryBlue100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: SvgPicture.asset(
                              R.ASSETS_SVG_IC_CART_PRODUCT_WHITE_SVG),
                        ),
                        Text(
                          LocaleKeys.label_repurchase.tr,
                          style: typoBold12White,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Container(
          height: isDone ? 163 : 113,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(controller.border.value.toDouble()),
                bottomRight:
                    Radius.circular(controller.border.value.toDouble())),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                    child: imageBook == null || imageBook == ""
                        ? Container(
                            width: 144,
                            height: 81,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                    R.ASSETS_SVG_NOIMAGE_CAUSE_SVG),
                                Text(
                                  "No Image Found",
                                  style: typoRegular14.copyWith(
                                      color: colorNeutralGray40),
                                )
                              ],
                            ),
                          )
                        : Container(
                            width: 144,
                            height: 81,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(imageBook),
                                    fit: BoxFit.fill)),
                          ),
                  ),
                  Container(
                    height: 81,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 183,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  nameBook,
                                  overflow: TextOverflow.ellipsis,
                                  style: typoBold14,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              percent == 100
                                  ? Row(
                                      children: [
                                        Text(
                                          "$rating",
                                          overflow: TextOverflow.ellipsis,
                                          style: typoBold14,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        RatingBarIndicator(
                                          rating: rating == 0 ? 0 : 1,
                                          itemBuilder: (context, index) =>
                                              SvgPicture.asset(R
                                                  .ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                          itemCount: 1,
                                          itemSize: 13.0,
                                          unratedColor: Colors.grey,
                                          direction: Axis.horizontal,
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 183,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Tác giả: $author",
                                  style: typoRegular12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              percent == 100
                                  ? "Hoàn Thành"
                                  : "HSD: còn ${daysBetween(DateTime.now(), DateTime.parse(expireDate))} ngày",
                              style: percent == 100
                                  ? typoRegular12Green
                                  : typoRegular12Blue,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "$percent%",
                              style: percent == 0
                                  ? typoRegular12Red
                                  : percent == 100
                                      ? typoRegular12Green
                                      : typoRegular12Blue,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0, top: 4),
                          child: AppPercentIndicator(
                            backgroundColor: Colors.grey,
                            width: 183,
                            lineHeight: 5.0,
                            percent: percent / 100,
                            barRadius: Radius.circular(15.0),
                            progressColor: percent == 100
                                ? colorSemanticGreen100
                                : colorSemanticBlue100,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              isDone
                  ? Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 16.0, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            R.ASSETS_PNG_IC_CERTIFICATE_PNG))),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Chứng chỉ hoàn thành khóa học:",
                                style: typoRegular12,
                              ),
                            ],
                          ),
                          Text(
                            "8.5 ${LocaleKeys.general_rewardUnit.tr}",
                            style: typoSemiBold12Blue,
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        // child: Container(
        //   height: isDone ? 163 : 113,
        //   color: Colors.red,
        //   child: Column(
        //     children: [
        //       Row(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 16.0, horizontal: 16),
        //             child: Container(
        //               width: 144,
        //               height: 81,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.all(Radius.circular(10)),
        //                   image: DecorationImage(
        //                       image: NetworkImage(imageBook),
        //                       fit: BoxFit.fill)),
        //             ),
        //           ),
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Column(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.only(
        //                       top: 0.0,
        //                     ),
        //                     child: Container(
        //                       width: 183,
        //                       child:Text(
        //                           nameBook,
        //                           overflow: TextOverflow.ellipsis,
        //                           style: typoBold14,
        //
        //                       ),
        //                     ),
        //                   ),
        //                   Container(
        //                     margin: EdgeInsets.only(top: 4),
        //                     width: 183,
        //                     child: Row(
        //                       children: [
        //                         Flexible(
        //                           child: Text(
        //                             "Tác giả: $author",
        //                             style: typoRegular12,
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               Column(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text(
        //                         percent == 100
        //                             ? "Hoàn Thành"
        //                             : "HSD:${fullStringTimeFormat(expireDate)}",
        //                         style: percent == 100
        //                             ? typoRegular12Green
        //                             : typoRegular12Blue,
        //                       ),
        //                       SizedBox(
        //                         width: 65,
        //                       ),
        //                       Text(
        //                         "$percent%",
        //                         style: percent == 0
        //                             ? typoRegular12Red
        //                             : percent == 100
        //                             ? typoRegular12Green
        //                             : typoRegular12Blue,
        //                       )
        //                     ],
        //                   ),
        //                   Padding(
        //                     padding:
        //                     const EdgeInsets.only(bottom: 16.0, top: 4),
        //                     child: AppPercentIndicator(
        //                       backgroundColor: Colors.grey,
        //                       width: 183,
        //                       lineHeight: 5.0,
        //                       percent: percent / 100,
        //                       barRadius: Radius.circular(15.0),
        //                       progressColor: percent == 100
        //                           ? colorSemanticGreen100
        //                           : colorSemanticBlue100,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           )
        //         ],
        //       ),

        //     ],
        //   ),
        // ),
      ),
    );
  }
}
