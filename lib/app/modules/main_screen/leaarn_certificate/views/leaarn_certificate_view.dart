import 'package:elearning/app/components/excercise/excersice_minigame.dart';
import 'package:elearning/app/components/excercise/exercise_fill_in_the_blank.dart';
import 'package:elearning/app/components/excercise/exercise_leading_question.dart';
import 'package:elearning/app/components/excercise/exercise_multiple_choice.dart';
import 'package:elearning/app/components/excercise/exercise_single_choice.dart';
import 'package:elearning/app/components/excercise/exercise_speaking.dart';
import 'package:elearning/app/components/excercise/exercise_text_answer.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/modules/main_screen/leaarn_exercise_resoult/controllers/leaarn_exercise_result_controller.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../controllers/leaarn_certificate_controller.dart';

class LeaarnCertificateView extends GetView<LeaarnCertificateController> {
  // final controller=Get.find<>()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          "Chứng chỉ học tập",
          style: typoBold24,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
                onTap: () => controller.printPdf(),
                child: SvgPicture.asset(R.ASSETS_SVG_IC_DOWNLOAD_LIV_SVG)),
          )
        ],
      ),
      body: ScreenUtilInit(
          builder: () => Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Screenshot(
                    controller: controller.screenshotController,
                    child: Column(
                      children: [header(context)],
                    ),
                  ),
                ),
              )),
    );
  }

  Widget header(BuildContext context) {
    return Obx(
      () => Container(
        width: ScreenUtil().setWidth(MediaQuery.of(context).size.width),
        child: Column(
          children: [
            Container(
              height: 420,
              child: Stack(
                children: [
                  Positioned(
                      child:
                          SvgPicture.asset(R.ASSETS_SVG_HEADER_CTIFICATE_SVG)),
                  Positioned(
                      bottom: 0,
                      child: SvgPicture.asset(R.ASSETS_SVG_FOODTER_SVG)),
                  Positioned(
                      top: 65.h,
                      left: 16.w,
                      child: SvgPicture.asset(R.ASSETS_SVG_LOGO_SMART_SVG)),
                  Positioned(
                      top: 45.h,
                      right: 70.w,
                      child: Container(
                        width: 52.w,
                        height: 52.h,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              R.ASSETS_SVG_LOGO_SVG,
                              width: 52.w,
                              height: 52.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                controller.pointEx.toStringAsFixed(1),
                                style: typoBold18.copyWith(
                                    color: colorWhite, fontSize: 18.sp),
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                    top: 90.h,
                    left: 20.w,
                    child: Text(
                      "CHỨNG NHẬN",
                      style: typoBold18.copyWith(
                          color: colorBlack, fontSize: 18.sp),
                    ),
                  ),
                  Positioned(
                    top: 110.h,
                    left: 0.w,
                    child: Container(
                      height: 26.h,
                      margin: EdgeInsets.only(top: 8.h),
                      padding: EdgeInsets.only(left: 16.w),
                      width: ScreenUtil()
                          .setWidth(MediaQuery.of(context).size.width * 0.65),
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          child: Text(
                            "TỰ HÀO VINH DANH ĐƯỢC GỬI TỚI",
                            style: typoRegular12.copyWith(
                                color: colorWhite,
                                fontSize: 12.sp,
                                letterSpacing: 0.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150.h,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 8.h),
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${controller.userCurrent.value.firstName ?? ""} ${controller.userCurrent.value.lastName ?? ""}",
                              style: typoNameCetificate.copyWith(
                                  color: colorBlack, fontSize: 24.sp),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.sp),
                            child: Divider(
                              height: 3.h,
                              color: colorSemanticYellow100,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 190.h,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 8.h),
                      padding: EdgeInsets.only(top: 16.h, left: 16.w),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "ĐÃ HOÀN THÀNH KHÓA HỌC",
                              style: typoRegular14.copyWith(
                                  color: colorBlack,
                                  letterSpacing: 0.0,
                                  fontSize: 14.sp),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "“${controller.dataCouser.value.course?.title ?? ""}”",
                              style: typoNameCetificate.copyWith(
                                  color: colorPrimaryBlue100,
                                  letterSpacing: 0.0,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 230.h,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 16.h),
                      padding: EdgeInsets.only(top: 16.h, left: 16.w),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Giáo viên: ${controller.dataCouser.value.course?.teacher?.firstName ?? ""}",
                              style: typoRegular14.copyWith(
                                  color: colorBlack,
                                  letterSpacing: 0.0,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 255.h,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 16.h),
                      padding: EdgeInsets.only(top: 16.h, left: 16.w),
                      child: Container(
                        width: 150.h,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Ngày bắt đầu: ${fullStringTimeFormat(controller.dataCouser.value.course?.createdAt.toString())}",
                                style: typoRegular14.copyWith(
                                    color: colorBlack,
                                    letterSpacing: 0.0,
                                    fontSize: 14.sp),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Ngày hoành thành: ${fullStringTimeFormat(controller.dataCouser.value.course?.updatedAt.toString())}",
                                style: typoRegular14.copyWith(
                                    color: colorBlack,
                                    letterSpacing: 0.0,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 0), child: table()),
            SizedBox(
              height: 16,
            ),
            listItem()
          ],
        ),
      ),
    );
  }

  Widget table() {
    return Container(
      decoration: BoxDecoration(boxShadow: boxShadow, color: colorWhite),
      child: Column(
        children: [
          Container(
            // color: colorTable,
            height: 56.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: colorTable,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150.w,
                  child: Text(
                    "Nội dung chi tiết",
                    style: typoBold12.copyWith(
                        color: colorWhite, letterSpacing: 0.0),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Điểm",
                        style: typoBold12.copyWith(
                            color: colorWhite, letterSpacing: 0.0),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Container(
                      child: Text(
                        "Ngày làm",
                        style: typoBold12.copyWith(
                            color: colorWhite, letterSpacing: 0.0),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Container(
                      child: Text(
                        "Thời điểm",
                        style: typoBold12.copyWith(
                            color: colorWhite, letterSpacing: 0.0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16,
            ),
            child: Wrap(
              children: controller.listquestion
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150.w,
                            child: Text(
                              e.title ?? "",
                              style: typoBold12.copyWith(
                                  color: colorBlack, letterSpacing: 0.0),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  "${e.totalPointEarned?.toStringAsFixed(0)}/${e.totalPoints?.toStringAsFixed(0)}",
                                  style: typoRegular14.copyWith(
                                      color: colorBlack, letterSpacing: 0.0),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Container(
                                // width: 50.w,
                                child: FittedBox(
                                  child: Text(
                                    fullStringTimeFormatCetificate(
                                        e.createdAt.toString()),
                                    style: typoRegular14.copyWith(
                                        color: colorBlack, letterSpacing: 0.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Container(
                                child: Text(
                                  fullStringTimerFormat(e.updatedAt.toString()),
                                  style: typoRegular14.copyWith(
                                      color: colorBlack, letterSpacing: 0.0),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget listItem() {
    return Obx(
      () => Wrap(
        children: controller.userExerciseResponse
            .map(
              (e) => Column(
                children: [
                  Text(
                    e.userExercise?.title ?? "",
                    style: typoBold24.copyWith(
                        color: colorBlack, letterSpacing: 0.0),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: e.userExercise?.questions?.length ?? 0,
                    itemBuilder: (context, index) {
                      final question = e.userExercise!.questions![index];
                      print(question.questionType);
                      if (question.questionType == ExerciseTypes.question) {
                        if (question.qDisplayContent?.type ==
                            QuestionTypes.essay) {
                          return ExerciseTextAnswer(
                            index: index + 1,
                            question: question,
                            multiline: true,
                            state: controller.exerciseStatus(question) == 3
                                ? ExerciseState.correct
                                : ExerciseState.wrong,
                            onComplete: (result) {},
                          );
                        } else if (question.qDisplayContent?.type ==
                            QuestionTypes.fillInTheBlank) {
                          return ExerciseFillInTheBlank(
                            index: index + 1,
                            question: question,
                            state: controller.exerciseStatus(question) == 3
                                ? ExerciseState.correct
                                : ExerciseState.wrong,
                            onComplete: (result) {},
                          );
                        } else if (question.qDisplayContent?.type ==
                            QuestionTypes.leadingQuestion) {
                          return ExerciseLeadingQuestion(
                            index: index + 1,
                            question: question,
                            state: controller.exerciseStatus(question) == 3
                                ? ExerciseState.correct
                                : ExerciseState.wrong,
                            onComplete: (result) {},
                          );
                        } else if (question.qDisplayContent?.type ==
                            QuestionTypes.multipleChoice) {
                          return ExerciseMultipleChoice(
                            index: index + 1,
                            question: question,
                            state: controller.exerciseStatus(question) == 3
                                ? ExerciseState.correct
                                : ExerciseState.wrong,
                            onComplete: (result) {},
                          );
                        } else if (question.qDisplayContent?.type ==
                            QuestionTypes.singleChoice) {
                          return ExerciseSingleChoice(
                            index: index + 1,
                            question: question,
                            state: controller.exerciseStatus(question) == 3
                                ? ExerciseState.correct
                                : ExerciseState.wrong,
                            onComplete: (result) {},
                          );
                        } else if (question.qDisplayContent?.type ==
                            QuestionTypes.speaking) {
                          return ExerciseSpeaking(
                            index: index + 1,
                            question: question,
                            state: controller.exerciseStatus(question) == 3
                                ? ExerciseState.correct
                                : ExerciseState.wrong,
                            onComplete: (result) {},
                          );
                        } else if (question.qDisplayContent?.type ==
                            QuestionTypes.textAnswer) {
                          return ExerciseTextAnswer(
                            index: index + 1,
                            question: question,
                            multiline: false,
                            state: controller.exerciseStatus(question) == 3
                                ? ExerciseState.correct
                                : ExerciseState.wrong,
                            onComplete: (result) {},
                          );
                        } else {
                          return Container();
                        }
                      } else if (question.questionType ==
                          ExerciseTypes.miniGame) {
                        return ExerciseMinigame(
                          index: index + 1,
                          question: question,
                          state: controller.exerciseStatus(question) == 3
                              ? ExerciseState.correct
                              : ExerciseState.wrong,
                          onPlay: () {},
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
