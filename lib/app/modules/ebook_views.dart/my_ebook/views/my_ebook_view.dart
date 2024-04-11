import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/app_percent_indicator.dart';
import 'package:elearning/app/modules/main_screen/book_progress/controllers/book_progress_controller.dart';
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

import 'package:get/get.dart';

import '../controllers/my_ebook_controller.dart';

class MyEbookView extends GetView<BookProgressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Sách của tôi',
          style: typoBold24,
        ),
        centerTitle: true,
        leading: BackButton(
          color: colorBlack,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Obx(
            () => controller.bookProgress.length > 0
                ? Column(
                    children: [
                      controller.bookNewProgress.length == 0
                          ? Container()
                          : newBook(context),
                      controller.bookContinueProgress.length == 0
                          ? Container()
                          : continueReadBook(context),
                      SizedBox(
                        height: 16,
                      ),
                      controller.bookCompleteProgress.length == 0
                          ? Container()
                          : finishReadingBook(context),
                      SizedBox(
                        height: 16,
                      ),
                      controller.bookExpireProgress.length == 0
                          ? Container()
                          : expReadingBook(context)
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }

  newBook(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sách mới",
            style: typoBold18,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.all(0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.bookNewProgress.length,
              shrinkWrap: true,
              itemBuilder: (context, item) => Container(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.READ_BOOK, arguments: {
                      'id': controller.bookNewProgress[item].book!.id,
                      'isAlreadyPurchased': 1
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          height: 216,
                          width: 144,
                          child: AppNetworkImage(
                            source:
                                controller.bookNewProgress[item].book!.cover!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          height: 216,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          controller
                                              .bookNewProgress[item].book!.title
                                              .toString(),
                                          style: typoBold14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Tác giả: ${controller.bookNewProgress[item].owner!.firstName!}",
                                          style: typoRegular12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                // width: 183,
                                margin: EdgeInsets.symmetric(vertical: 32),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RatingBarIndicator(
                                      rating: controller
                                          .bookNewProgress[item].ratingAvg!
                                          .toDouble(),
                                      itemBuilder: (context, index) =>
                                          SvgPicture.asset(
                                              R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      unratedColor: Colors.grey,
                                      direction: Axis.horizontal,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "HSD: còn ${daysBetween(DateTime.now(), DateTime.parse(controller.bookNewProgress[item].expireAt!.toString()))} ngày",
                                        style: typoRegular12.copyWith(
                                            color: colorPrimaryBlue100),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                          "${controller.bookNewProgress[item].totalProgress!}%",
                                          style: typoRegular12.copyWith(
                                              color: colorPrimaryBlue100)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0.0, top: 4),
                                    child: AppPercentIndicator(
                                      backgroundColor: Colors.grey,
                                      lineHeight: 5.0,
                                      percent: controller.bookNewProgress[item]
                                              .totalProgress! /
                                          100,
                                      barRadius: Radius.circular(15.0),
                                      progressColor: controller
                                                  .bookNewProgress[item]
                                                  .totalProgress! ==
                                              100
                                          ? colorSemanticGreen100
                                          : colorSemanticBlue100,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
  continueReadBook(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Đọc tiếp",
            style: typoBold18,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.all(0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.bookContinueProgress.length,
              shrinkWrap: true,
              itemBuilder: (context, item) => Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          voteBook(context, controller,
                              controller.bookCompleteProgress[item].book!.id!,
                              myRating: []);
                          if (controller.cmts.isNotEmpty) {
                            controller.cmts.clear();
                          }
                          controller.commentCtrl.clear();
                        },
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
                  ],
                ),
                child: Container(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.READ_BOOK, arguments: {
                        'id': controller.bookContinueProgress[item].book!.id,
                        'isAlreadyPurchased': 1
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16),
                            height: 216,
                            width: 144,
                            child: AppNetworkImage(
                              source: controller
                                  .bookContinueProgress[item].book!.cover!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            height: 216,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            controller
                                                .bookContinueProgress[item]
                                                .book!
                                                .title
                                                .toString(),
                                            style: typoBold14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Tác giả: ${controller.bookContinueProgress[item].owner!.firstName}",
                                            style: typoRegular12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 183,
                                  margin: EdgeInsets.symmetric(vertical: 32),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RatingBarIndicator(
                                        rating: controller
                                            .bookContinueProgress[item]
                                            .ratingAvg!
                                            .toDouble(),
                                        itemBuilder: (context, index) =>
                                            SvgPicture.asset(R
                                                .ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        unratedColor: Colors.grey,
                                        direction: Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "HSD: còn ${daysBetween(DateTime.now(), DateTime.parse(controller.bookContinueProgress[item].expireAt!.toString()))} ngày",
                                          style: typoRegular12.copyWith(
                                              color: colorPrimaryBlue100),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                            "${controller.bookContinueProgress[item].totalProgress!}%",
                                            style: typoRegular12.copyWith(
                                                color: colorPrimaryBlue100)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 0.0, top: 4),
                                      child: AppPercentIndicator(
                                        backgroundColor: Colors.grey,
                                        lineHeight: 5.0,
                                        percent: controller
                                                .bookContinueProgress[item]
                                                .totalProgress! /
                                            100,
                                        barRadius: Radius.circular(15.0),
                                        progressColor: controller
                                                    .bookContinueProgress[item]
                                                    .totalProgress! ==
                                                100
                                            ? colorSemanticGreen100
                                            : colorSemanticBlue100,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
  finishReadingBook(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hoàn thành",
            style: typoBold18,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.all(0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.bookCompleteProgress.length,
              shrinkWrap: true,
              itemBuilder: (context, item) => Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            voteBook(context, controller,
                                controller.bookCompleteProgress[item].book!.id!,
                                myRating: []);
                            if (controller.cmts.isNotEmpty) {
                              controller.cmts.clear();
                            }
                            controller.commentCtrl.clear();
                          },
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
                    ],
                  ),
                  child: InkWell(
                    child: Container(
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.READ_BOOK, arguments: {
                          'id': controller.bookCompleteProgress[item].book!.id,
                          'isAlreadyPurchased': 1
                        }),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 16),
                                  height: 216,
                                  width: 144,
                                  child: AppNetworkImage(
                                    source: controller
                                        .bookCompleteProgress[item]
                                        .book!
                                        .cover!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  height: 216,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  controller
                                                      .bookCompleteProgress[
                                                          item]
                                                      .book!
                                                      .title
                                                      .toString(),
                                                  style: typoBold14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "Tác giả: ${controller.bookCompleteProgress[item].owner!.firstName}",
                                                  style: typoRegular12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 32),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            RatingBarIndicator(
                                              rating: controller
                                                  .bookCompleteProgress[item]
                                                  .ratingAvg!
                                                  .toDouble(),
                                              itemBuilder: (context, index) =>
                                                  SvgPicture.asset(R
                                                      .ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                              itemCount: 5,
                                              itemSize: 20.0,
                                              unratedColor: Colors.grey,
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Hoàn thành",
                                                style: typoRegular12.copyWith(
                                                    color: controller
                                                                .bookCompleteProgress[
                                                                    item]
                                                                .totalProgress! ==
                                                            100
                                                        ? colorSemanticGreen100
                                                        : colorPrimaryBlue100),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                  "${controller.bookCompleteProgress[item].totalProgress!}%",
                                                  style: typoRegular12.copyWith(
                                                      color: controller
                                                                  .bookCompleteProgress[
                                                                      item]
                                                                  .totalProgress! ==
                                                              100
                                                          ? colorSemanticGreen100
                                                          : colorSemanticRed100)),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 0.0, top: 4),
                                            child: AppPercentIndicator(
                                              backgroundColor: Colors.grey,
                                              lineHeight: 5.0,
                                              percent: controller
                                                      .bookCompleteProgress[
                                                          item]
                                                      .totalProgress! /
                                                  100,
                                              barRadius: Radius.circular(15.0),
                                              progressColor: controller
                                                          .bookCompleteProgress[
                                                              item]
                                                          .totalProgress! ==
                                                      100
                                                  ? colorSemanticGreen100
                                                  : colorSemanticBlue100,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 0.0, right: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(R
                                                    .ASSETS_PNG_IC_CERTIFICATE_PNG))),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
  expReadingBook(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hết Hạn",
            style: typoBold18,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.all(0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.bookExpireProgress.length,
              shrinkWrap: true,
              itemBuilder: (context, item) => Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 216,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          height: 216,
                          width: 144,
                          child: AppNetworkImage(
                            source: controller
                                .bookExpireProgress[item].book!.cover!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        controller.bookExpireProgress[item]
                                            .book!.title
                                            .toString(),
                                        style: typoBold14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Tác giả: ${controller.bookExpireProgress[item].owner!.firstName}",
                                      style: typoRegular12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: 183,
                              margin: EdgeInsets.symmetric(vertical: 32),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RatingBarIndicator(
                                    rating: controller
                                        .bookExpireProgress[item].ratingAvg!
                                        .toDouble(),
                                    itemBuilder: (context, index) =>
                                        SvgPicture.asset(
                                            R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    unratedColor: Colors.grey,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Hết hạn",
                                      style: typoRegular12.copyWith(
                                          color: colorSemanticRed100),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                        "${controller.bookExpireProgress[item].totalProgress!}%",
                                        style: typoRegular12.copyWith(
                                            color: controller
                                                        .bookExpireProgress[
                                                            item]
                                                        .totalProgress! >=
                                                    100
                                                ? colorSemanticGreen100
                                                : colorSemanticRed100)),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0.0, top: 4),
                                  child: AppPercentIndicator(
                                    backgroundColor: Colors.grey,
                                    lineHeight: 5.0,
                                    percent: controller.bookExpireProgress[item]
                                                .totalProgress! >=
                                            100
                                        ? 1
                                        : controller.bookExpireProgress[item]
                                                .totalProgress! /
                                            100,
                                    barRadius: Radius.circular(15.0),
                                    progressColor: controller
                                                .bookExpireProgress[item]
                                                .totalProgress! >=
                                            100
                                        ? colorSemanticGreen100
                                        : colorSemanticBlue100,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
}
