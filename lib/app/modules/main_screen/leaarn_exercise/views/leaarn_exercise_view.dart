import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../controllers/leaarn_exercise_controller.dart';

class LeaarnExerciseView extends GetView<LeaarnExerciseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          "Chi tiết tiến trình",
          style: typoBold24,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 65.0,
                      lineWidth: 30,
                      percent: controller.progress.value.round() / 100 >= 1
                          ? 1
                          : controller.progress.value.round() / 100,
                      progressColor: Colors.green,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 30 * 2 - 132,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hoàn thành: ",
                                style: typoRegular14,
                              ),
                              Text(
                                "${controller.progress.value.round()} %",
                                style: typoBold14.copyWith(
                                    color: colorSemanticGreen100),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Text(
                                "Tổng thời gian: ",
                                style: typoRegular14,
                              ),
                            ],
                          ),
                          Text(
                            fullStringDateTimerFormatLearn(controller.dataCouser
                                    .value.userCourse?.totalTimeStudy ??
                                "0"),
                            maxLines: 3,
                            style: typoBold14.copyWith(
                                color: colorSemanticYellow100),
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
                  children: [
                    Text(
                      "Tiếng anh lớp 4",
                      style: typoBold24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Ngày hết hạn : ${fullStringTimeFormat(controller.dataCouser.value.userCourse?.expireAt!.toString())}",
                      style: typoRegular14.copyWith(color: colorSemanticRed100),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${controller.dataCouser.value.isCurrentProgress?.sessionTitle ?? ""}",
                      style: typoRegular14,
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.COURE_LEARN,
                          arguments: controller.dataCouser.value.course!.id!),
                      child: Row(
                        children: [
                          Text(
                            "Học tiếp",
                            style: typoRegular14.copyWith(
                                color: colorPrimaryBlue100),
                          ),
                          SvgPicture.asset(R.ASSETS_SVG_PLAYSESSION_SVG)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 33,
                ),
                Divider(
                  height: 3,
                  color: colorNeutralGray100,
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kết quả bài tập",
                      style: typoBold18,
                    ),
                    Row(
                      children: [
                        Text(
                          "Tổng: ",
                          style:
                              typoBold12.copyWith(color: colorNeutralGray100),
                        ),
                        Text(
                          "${controller.pointEx.value.toStringAsFixed(2)}/10",
                          style:
                              typoBold12.copyWith(color: colorSemanticRed100),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  children: controller.listquestion
                      .map((e) => Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    e.title!,
                                    style: typoBold14.copyWith(
                                        color: colorNeutralGray60),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nộp lúc ${fullStringTimeFormat(e.createdAt.toString())}",
                                    style: typoRegular12.copyWith(
                                        color: colorNeutralGray60),
                                  ),
                                  Text(
                                    "${e.totalPointEarned!.toStringAsFixed(2)} / ${e.totalPoints!.round()}",
                                    style: typoBold12.copyWith(
                                        color: colorSemanticRed100),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.LEAARN_EXERCISE_RESOULT,
                                      arguments: {
                                        "id": e.id,
                                        // "answers": e.questions!.length,
                                        // "results": results,
                                      });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Xem chi tiết",
                                          style: typoRegular12.copyWith(
                                              color: colorPrimaryBlue100,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        SvgPicture.asset(
                                          R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG,
                                          color: colorPrimaryBlue100,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Tải file ",
                                          style: typoRegular12.copyWith(
                                              color: colorNeutralGray90,
                                              decoration: TextDecoration.none),
                                        ),
                                        SvgPicture.asset(
                                          R.ASSETS_SVG_IC_DOWNLOAD_LIV_SVG,
                                          color: colorNeutralGray90,
                                          width: 22,
                                          height: 22,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Divider(
                                height: 3,
                                color: colorNeutralGray60,
                              )
                            ],
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
