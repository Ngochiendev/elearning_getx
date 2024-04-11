import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/data/models/book_models/rating_book_model.dart';
import 'package:elearning/app/modules/main_screen/book_progress/controllers/book_progress_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

Dialog dialogAlert(BuildContext context,
        {Widget? icon, required String message, Function? onClose}) =>
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        width: MediaQuery.of(context).size.width - 48,
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.only(bottom: 24),
                    child: icon,
                  )
                : Container(),
            // title != null && title.isNotEmpty
            //     ? Text(
            //         title,
            //         style: typoLargeTextBold.copyWith(color: colorNeutralDark100),
            //       )
            //     : Container(),
            // SizedBox(height: 8),
            Text(
              message,
              style: typoRegular14.copyWith(color: colorNeutralGray80),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: styleButtonPrimary,
              child: Text(
                "Đồng ý",
              ),
              onPressed: () {
                Get.back();
                if (onClose != null) {
                  onClose();
                }
              },
            ),
          ],
        ),
      ),
    );

Dialog dialogAlertSignUp(BuildContext context,
        {String? title,
        String? titleButton,
        String? assets,
        String? subTitle,
        bool showButon = false,
        bool png = false,
        VoidCallback? onPressed}) =>
    Dialog(
      backgroundColor: colorTransparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 48,
            padding: EdgeInsets.fromLTRB(24, 100, 24, 24),
            margin: EdgeInsets.only(top: 90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: colorWhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title!,
                  style: typoBold18.copyWith(color: colorNeutralGray90),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        subTitle!,
                        style: typoRegular14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                showButon
                    ? SizedBox(
                        height: 40,
                      )
                    : Container(),
                showButon
                    ? AppElevatedButton(
                        buttonTitle: titleButton,
                        onPressed: onPressed,
                      )
                    : Container()
              ],
            ),
          ),
          png
              ? Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.symmetric(
                      horizontal:
                          (MediaQuery.of(context).size.width - 248) / 2),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(assets!))),
                )
              : Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.symmetric(
                      horizontal:
                          (MediaQuery.of(context).size.width - 248) / 2),
                  child: SvgPicture.asset(assets!),
                ),
        ],
      ),
    );

Dialog confirmAlert(BuildContext context,
        {Widget? icon,
        String? title,
        required String message,
        String? cancelButtonTitle,
        String? confirmButtonTitle,
        Function? onCancel,
        Function? onConfirm}) =>
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Container(
        width: MediaQuery.of(context).size.width - 48,
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.only(bottom: 24),
                    child: icon,
                  )
                : Container(),
            title != null && title.isNotEmpty
                ? Text(
                    title,
                    style: typoBold14.copyWith(color: colorNeutralGray80),
                    textAlign: TextAlign.center,
                  )
                : Container(),
            SizedBox(height: 8),
            Text(
              message,
              style: typoRegular14.copyWith(color: colorNeutralGray80),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: styleButtonWhite,
                    child: Text(cancelButtonTitle ?? "Hủy"),
                    onPressed: () {
                      Get.back();
                      if (onCancel != null) {
                        onCancel();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: styleButtonPrimary,
                    child: Text(confirmButtonTitle ?? "Đồng ý"),
                    onPressed: () {
                      Get.back();
                      if (onConfirm != null) {
                        onConfirm();
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

Dialog exerciseConfirm(BuildContext context,
        {String? time,
        String? remainQuestion,
        Function? onSubmit,
        Function? onRework}) =>
    Dialog(
      backgroundColor: colorTransparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 48,
            padding: EdgeInsets.fromLTRB(24, 100, 24, 24),
            margin: EdgeInsets.only(top: 90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: colorWhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Bạn chắc chắn muốn nộp bài?",
                  style: typoBold18.copyWith(color: colorNeutralGray90),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Thời gian thi còn lại: ",
                      style: typoRegular14,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      time ?? "00:00:00",
                      style: typoBold14.copyWith(color: colorSemanticRed100),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Số câu còn lại:",
                      style: typoRegular14,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      remainQuestion ?? "0",
                      style: typoBold14.copyWith(color: colorSemanticRed100),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: styleButtonWhiteBorder,
                        child: Text(
                          "Nộp bài",
                        ),
                        onPressed: () {
                          Get.back();
                          if (onSubmit != null) {
                            onSubmit();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: styleButtonPrimary,
                        child: Text(
                          "Làm tiếp",
                        ),
                        onPressed: () {
                          Get.back();
                          if (onRework != null) {
                            onRework();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width - 248) / 2),
            child: SvgPicture.asset(R.ASSETS_SVG_POPUP_RESSULT_QUESTION_SVG),
          ),
        ],
      ),
    );

Dialog exerciseResult(BuildContext context,
        {double? score,
        double? totalScore,
        String? time,
        int? wrong,
        int? correct,
        Function? onViewResult,
        Function? onRework}) =>
    Dialog(
      backgroundColor: colorTransparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 48,
            padding: EdgeInsets.fromLTRB(24, 100, 24, 24),
            margin: EdgeInsets.only(top: 90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: colorWhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Chúc mừng bạn đã hoàn thành bài luyện tập",
                  style: typoBold18.copyWith(color: colorNeutralGray90),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Điểm số: ",
                      style: typoRegular14,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$score",
                      style: typoBold14.copyWith(color: colorSemanticRed100),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "/$totalScore",
                      style: typoBold14,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Thời gian làm bài: ",
                      style: typoRegular14,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      time ?? "00:00:00",
                      style: typoBold14,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      R.ASSETS_SVG_IC_CORRECT_SVG,
                      width: 24,
                    ),
                    Text(
                      "Đúng: ",
                      style: typoRegular14,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$correct",
                      style: typoBold14,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      R.ASSETS_SVG_IC_WRONG_SVG,
                      width: 24,
                    ),
                    Text(
                      "Sai: ",
                      style: typoRegular14,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$wrong",
                      style: typoBold14,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: styleButtonWhiteBorder,
                        child: Text(
                          "Xem đáp án",
                        ),
                        onPressed: () {
                          Get.back();
                          if (onViewResult != null) {
                            onViewResult();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: styleButtonPrimary,
                        child: Text(
                          "Làm lại",
                        ),
                        onPressed: () {
                          Get.back();
                          if (onRework != null) {
                            onRework();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width - 248) / 2),
            child: SvgPicture.asset(
                (score?.toDouble() ?? 0.0) / (totalScore?.toDouble() ?? 1.0) >
                        0.5
                    ? R.ASSETS_SVG_POPUP_RESSULT_HIGH_SVG
                    : R.ASSETS_SVG_POPUP_RESSULT_LOW_SVG),
          ),
        ],
      ),
    );

voteBook(BuildContext context, BookProgressController controller, int idBook,
    {List<Rating>? myRating}) {
  List<String> recomment = [
    "Sách rất bổ ích",
    "Bài tập sách rất bổ ích",
    "Nội dung rất hay",
    "Minigame thú vị"
  ];
  return AwesomeDialog(
    context: context,
    animType: AnimType.TOPSLIDE,
    dialogType: DialogType.NO_HEADER,
    btnOk: Container(
      decoration: BoxDecoration(
          color: myRating!.isNotEmpty ? Colors.grey : colorPrimaryBlue100,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: AppTextButton(
        buttonTitle: "Gửi đánh giá ",
        color: colorWhite,
        onPressed: myRating.isNotEmpty
            ? null
            : () async {
                await controller.ratingBook(idBook);
                // Get.back();
              },
      ),
    ),
    body: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Đánh giá sách",
              style: typoBold18.copyWith(color: colorNeutralGray90),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 26,
            ),
            myRating.isNotEmpty
                ? RatingBarIndicator(
                    rating: myRating.length == 0
                        ? 0.0
                        : myRating[0].rating!.toDouble(),
                    itemBuilder: (context, index) =>
                        SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                    itemCount: 5,
                    itemSize: 32.0,
                    unratedColor: Colors.grey,
                    direction: Axis.horizontal,
                  )
                : RatingBar.builder(
                    initialRating: 0.0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    unratedColor: Colors.grey.withOpacity(0.2),
                    itemCount: 5,
                    itemSize: 32.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => SvgPicture.asset(
                      R.ASSETS_SVG_IC_STAR_YELLOW_SVG,
                    ),
                    updateOnDrag: true,
                    tapOnlyMode: false,
                    onRatingUpdate: (double value) {
                      print(value.toInt());
                      controller.onchangeVote(value.toInt());
                    },
                  ),
            SizedBox(
              height: 26,
            ),
            Container(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: recomment
                    .map((e) => Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: InkWell(
                            onTap: myRating.isNotEmpty
                                ? null
                                : () => controller.onChangeComment(e),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 40,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: colorPrimaryBlue5,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              child: Center(
                                  child: Text(
                                e,
                                style: typoRegular14,
                              )),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: colorNeutralGray40),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: CupertinoTextField(
                  readOnly: myRating.isNotEmpty ? true : false,
                  controller: controller.commentCtrl,
                  maxLines: 16,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  placeholder: "Nhận xét",
                  placeholderStyle: typoRegular14,
                )),
          ],
        ),
      ),
    ),
    title: 'This is Ignored',
    desc: 'This is also Ignored',
    btnOkOnPress: () {},
  )..show();
}
