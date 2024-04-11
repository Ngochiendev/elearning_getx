import 'package:elearning/app/components/excercise/excersice_minigame.dart';
import 'package:elearning/app/components/excercise/exercise_fill_in_the_blank.dart';
import 'package:elearning/app/components/excercise/exercise_leading_question.dart';
import 'package:elearning/app/components/excercise/exercise_multiple_choice.dart';
import 'package:elearning/app/components/excercise/exercise_single_choice.dart';
import 'package:elearning/app/components/excercise/exercise_speaking.dart';
import 'package:elearning/app/components/excercise/exercise_text_answer.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/exercise_result_controller.dart';

class ExerciseResultView extends GetView<ExerciseResultController> {
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
          controller.userExerciseResponse.exercise?.title ?? "Bài luyện tập",
          style: typoBold16,
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: controller.userExerciseResponse.userExercise?.questions?.length ?? 0,
              itemBuilder: (context, index) {
                final question = controller.userExerciseResponse.userExercise!.questions![index];
                if (question.questionType == ExerciseTypes.question) {
                  if (question.qDisplayContent?.type == QuestionTypes.essay) {
                    return ExerciseTextAnswer(
                      index: index + 1,
                      question: question,
                      multiline: true,
                      state: controller.exerciseStatus(question) == 3 ? ExerciseState.correct : ExerciseState.wrong,
                      onComplete: (result) {},
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.fillInTheBlank) {
                    return ExerciseFillInTheBlank(
                      index: index + 1,
                      question: question,
                      state: controller.exerciseStatus(question) == 3 ? ExerciseState.correct : ExerciseState.wrong,
                      onComplete: (result) {},
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.leadingQuestion) {
                    return ExerciseLeadingQuestion(
                      index: index + 1,
                      question: question,
                      state: controller.exerciseStatus(question) == 3 ? ExerciseState.correct : ExerciseState.wrong,
                      onComplete: (result) {},
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.multipleChoice) {
                    return ExerciseMultipleChoice(
                      index: index + 1,
                      question: question,
                      state: controller.exerciseStatus(question) == 3 ? ExerciseState.correct : ExerciseState.wrong,
                      onComplete: (result) {},
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.singleChoice) {
                    return ExerciseSingleChoice(
                      index: index + 1,
                      question: question,
                      state: controller.exerciseStatus(question) == 3 ? ExerciseState.correct : ExerciseState.wrong,
                      onComplete: (result) {},
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.speaking) {
                    return ExerciseSpeaking(
                      index: index + 1,
                      question: question,
                      state: controller.exerciseStatus(question) == 3 ? ExerciseState.correct : ExerciseState.wrong,
                      onComplete: (result) {},
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.textAnswer) {
                    return ExerciseTextAnswer(
                      index: index + 1,
                      question: question,
                      multiline: false,
                      state: controller.exerciseStatus(question) == 3 ? ExerciseState.correct : ExerciseState.wrong,
                      onComplete: (result) {},
                    );
                  } else {
                    return Container();
                  }
                } else if (question.questionType == ExerciseTypes.miniGame) {
                  return ExerciseMinigame(
                    index: index + 1,
                    question: question,
                    state: controller.exerciseStatus(question) == 3 ? ExerciseState.correct : ExerciseState.wrong,
                    onPlay: () {},
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: colorWhite,
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: colorNeutralGray40,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Thời gian: ${controller.getTime()}",
                      style: typoBold18.copyWith(color: colorNeutralGray95),
                    ),
                    Spacer(),
                    Text(
                      "Đúng ${controller.getCorrect()}/",
                      style: typoBold18.copyWith(color: colorSemanticGreen100),
                    ),
                    Text(
                      "${controller.userExerciseResponse.userExercise?.questions?.length}",
                      style: typoBold18.copyWith(color: colorNeutralGray95),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
