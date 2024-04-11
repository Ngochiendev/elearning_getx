import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_percent_indicator.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

import '../controllers/book_progress_controller.dart';

class BookProgressView extends GetView<BookProgressController> {
  List<String> recomment = [
    "Sách rất bổ ích",
    "Bài tập sách rất bổ ích",
    "Nội dung rất hay",
    "Minigame thú vị"
  ];
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
          "Tiến trình đọc sách",
          style: typoBold24,
        ),
        centerTitle: true,
        actions: [
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {},
          //       child: SvgPicture.asset(R.ASSETS_SVG_IC_FILTER_BLACK_SVG,
          //           color: colorBlack),
          //     ),
          //     SizedBox(
          //       width: 16,
          //     )
          //   ],
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.bookProgress.length == 0
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    controller.bookNewProgress.length == 0
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
                      children: controller.bookNewProgress
                          .map((e) => Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.READ_BOOK, arguments: {
                                        'id': e.book!.id,
                                        'isAlreadyPurchased': 1
                                      });
                                    },
                                    child: buildItem(
                                      context,
                                      e.book!.title ?? "No Name",
                                      e.book?.cover ?? "",
                                      e.owner!.firstName!,
                                      e.expireAt!.toString(),
                                      e.totalProgress!.toDouble(),
                                      () {
                                        print("oneTap");
                                      },
                                      () {
                                        print("secTap");
                                      },
                                      e.ratingAvg!.toDouble(),
                                      isDone: e.totalProgress! >= 100
                                          ? true
                                          : false,
                                    ),
                                  )
                                ],
                              ))
                          .toList(),
                    ),
                    controller.bookContinueProgress.length == 0
                        ? Container()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Đọc tiếp",
                                  style: typoBold18,
                                ),
                              ],
                            ),
                          ),
                    Wrap(
                      children: controller.bookContinueProgress
                          .map((e) => Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.READ_BOOK, arguments: {
                                        'id': e.book!.id,
                                        'isAlreadyPurchased': 1
                                      });
                                    },
                                    child: buildItem(
                                        context,
                                        e.book!.title ?? "No Name",
                                        e.book?.cover ?? "",
                                        e.owner!.firstName!,
                                        e.expireAt!.toString(),
                                        e.totalProgress!.toDouble(), () {
                                      voteBook(context, controller, e.book!.id!,
                                          myRating: []);
                                      if (controller.cmts.isNotEmpty) {
                                        controller.cmts.clear();
                                      }
                                      controller.commentCtrl.clear();
                                    }, () {
                                      print("secTap");
                                    }, e.ratingAvg!.toDouble(),
                                        isDone: false,
                                        isVote: e.totalProgress! >= 30
                                            ? true
                                            : false),
                                  )
                                ],
                              ))
                          .toList(),
                    ),
                    controller.bookCompleteProgress.length == 0
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
                      children: controller.bookCompleteProgress
                          .map((e) => Column(
                                children: [
                                  InkWell(
                                    onTap: () => Get.toNamed(Routes.READ_BOOK,
                                        arguments: {
                                          'id': e.book!.id,
                                          'isAlreadyPurchased': 1
                                        }),
                                    child: buildItem(
                                      context,
                                      e.book!.title ?? "No Name",
                                      e.book?.cover ?? "",
                                      e.owner!.firstName!,
                                      e.expireAt!.toString(),
                                      e.totalProgress!.toDouble(),
                                      () {
                                        voteBook(
                                            context, controller, e.book!.id!,
                                            myRating: []);
                                        if (controller.cmts.isNotEmpty) {
                                          controller.cmts.clear();
                                        }
                                        controller.commentCtrl.clear();
                                        // Get.back();
                                      },
                                      () {
                                        print("secTap");
                                      },
                                      e.ratingAvg!.toDouble(),
                                      isDone: e.totalProgress! == 100
                                          ? true
                                          : false,
                                    ),
                                  )
                                ],
                              ))
                          .toList(),
                    ),
                    controller.bookExpireProgress.length == 0
                        ? Container()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Hết hạn",
                                  style: typoBold18,
                                ),
                              ],
                            ),
                          ),
                    Wrap(
                      children: controller.bookExpireProgress
                          .map((e) => Column(
                                children: [
                                  buildItem(
                                    context,
                                    e.book!.title ?? "No Name",
                                    e.book?.cover ?? "",
                                    e.owner!.firstName!,
                                    e.expireAt!.toString(),
                                    e.totalProgress!.toDouble(),
                                    () {
                                      voteBook(context, controller, e.id!,
                                          myRating: []);
                                      if (controller.cmts.isNotEmpty) {
                                        controller.cmts.clear();
                                      }
                                      controller.commentCtrl.clear();
                                    },
                                    () {
                                      print("secTap");
                                    },
                                    e.ratingAvg!.toDouble(),
                                    isExp: true,
                                  )
                                ],
                              ))
                          .toList(),
                    ),
                  ],
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
      double percent,
      GestureTapCallback onTapOne,
      GestureTapCallback onTapTwo,
      double rating,
      {bool isDone = false,
      bool isExp = false,
      isVote = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      child: Slidable(
        endActionPane: isDone || isExp || isVote
            ? ActionPane(
                motion: ScrollMotion(),
                children: [
                  isExp
                      ? Container()
                      : Expanded(
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
                  isExp
                      ? Expanded(
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
                                      child: SvgPicture.asset(R
                                          .ASSETS_SVG_IC_CART_PRODUCT_WHITE_SVG),
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
                        )
                      : Container(),
                ],
              )
            : null,

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: Container(
          height: isExp
              ? 248
              : isDone
                  ? 292
                  : 248,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16),
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
                            height: 216,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(imageBook),
                                    fit: BoxFit.fill)),
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
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 0.0,
                                ),
                                child: Container(
                                  // width: 183,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          nameBook,
                                          style: typoBold14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                // width: 183,
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
                            ],
                          ),
                          Container(
                            // width: 183,
                            child: Row(
                              children: [
                                RatingBarIndicator(
                                  rating: rating,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        percent == 100
                                            ? "Hoàn Thành"
                                            : isExp
                                                ? "Hết hạn"
                                                : "HSD: còn ${daysBetween(DateTime.now(), DateTime.parse(expireDate))} ngày",
                                        style: percent == 100
                                            ? typoRegular12Green
                                            : isExp
                                                ? typoRegular14Red
                                                : typoRegular12Blue,
                                      ),
                                    ),
                                    Text(
                                      "${percent.toInt()}%",
                                      style: percent == 100
                                          ? typoRegular12Green
                                          : isExp
                                              ? typoRegular12Red
                                              : typoRegular12Blue,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0.0, top: 4),
                                  child: AppPercentIndicator(
                                    backgroundColor: Colors.grey,
                                    // width: 183,
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
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isDone
                  ? Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
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
      ),
    );
  }
}
