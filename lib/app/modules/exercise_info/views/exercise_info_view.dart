import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/exercise_info_controller.dart';

class ExerciseInfoView extends GetView<ExerciseInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(R.ASSETS_SVG_IC_BACK_BLACK_SVG),
          ),
        ),
        title: Text(
          controller.userExerciseResponse.exercise?.title ?? 'Bài tập',
          style: typoBold16,
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(R.ASSETS_SVG_IC_ALARM_BADGE_SVG),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "${controller.userExerciseResponse.exercise?.duration} phút",
                          style: typoBold18,
                        ),
                        Expanded(child: Container()),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(R.ASSETS_SVG_IC_COURSE_BLUE_SVG),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "${(controller.userExerciseResponse.exercise?.totalQuestions ?? 0) + (controller.userExerciseResponse.exercise?.totalConfigQuestions ?? 0)} câu hỏi",
                          style: typoBold18,
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      controller.userExerciseResponse.exercise?.description ?? "",
                      style: typoRegular16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: colorWhite,
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            child: ElevatedButtonBase(
              weight: FontWeight.w600,
              buttonTitle: "Bắt đầu làm bài",
              onPressed: controller.gotoExercise,
            ),
          ),
        ],
      ),
    );
  }
}
