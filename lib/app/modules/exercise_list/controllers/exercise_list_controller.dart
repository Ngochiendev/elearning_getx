import 'dart:convert';

import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/modules/exercise_info/controllers/exercise_info_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ExerciseListController extends GetxController {
  final UserExerciseResponse userExerciseResponse = Get.arguments['userExerciseResponse'];
  late DateTime startTime;
  late DateTime endTime;
  final answers = Map<String, Questions>().obs;
  final results = Map<String, int>().obs;
  final bottomProcess = List<bool>.empty(growable: true).obs;
  final isActiveScene = true.obs;

  void onInit() {
    super.onInit();
    // if (kDebugMode) {
    startTime = DateTime.now();
    endTime = startTime.add(Duration(minutes: userExerciseResponse.exercise?.duration ?? 0));
    // } else {
    // endTime =
    //     DateTime.tryParse(userExerciseResponse.userExercise?.createdAt ?? "")?.add(Duration(minutes: userExerciseResponse.exercise?.duration ?? 0)) ?? DateTime.now().add(Duration(minutes: userExerciseResponse.exercise?.duration ?? 0));
    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    saveProcess();
  }

  void updateProcess(Questions q) {
    var question = userExerciseResponse.userExercise?.questions?.firstWhere((element) => element.id == q.id);
    question?.mDisplayContent = q.mDisplayContent;
    question?.mGoalContent = q.mGoalContent;
    question?.qDisplayContent = q.qDisplayContent;
    question?.qGoalContent = q.qGoalContent;
    question?.displayContent = question.mDisplayContent != null ? json.encode(question.mDisplayContent!.toJson()) : json.encode(question.qDisplayContent!.toJson());
    int qIndex = userExerciseResponse.userExercise?.questions?.indexWhere((element) => element.id == q.id) ?? 0;
    answers['$qIndex'] = q;
    results['$qIndex'] = exerciseStatus(q);
  }

  int exerciseStatus(Questions question) {
    // 0: none
    // 1: done
    // 2: wrong
    // 3: correct
    int state = 0;
    if (question.questionType == ExerciseTypes.question) {
      if (question.qDisplayContent?.type == QuestionTypes.essay) {
        return 1;
      } else if (question.qDisplayContent?.type == QuestionTypes.fillInTheBlank) {
        return 1;
      } else if (question.qDisplayContent?.type == QuestionTypes.leadingQuestion) {
        bool isCorrect = true;
        for (int i = 0; i < (question.qDisplayContent?.children?.length ?? 0); i++) {
          final child = question.qDisplayContent!.children![i];
          final child2 = question.qGoalContent!.children![i];
          for (int j = 0; j < (child.choices?.length ?? 0); j++) {
            if (child.choices![i].isSelected != child2.choices![i].isCorrect) {
              isCorrect = false;
              break;
            }
          }
        }
        return isCorrect ? 3 : 2;
      } else if (question.qDisplayContent?.type == QuestionTypes.multipleChoice) {
        bool isCorrect = true;
        for (int i = 0; i < (question.qDisplayContent?.choices?.length ?? 0); i++) {
          if (question.qDisplayContent!.choices![i].isSelected != question.qGoalContent!.choices![i].isCorrect) {
            isCorrect = false;
            break;
          }
        }
        return isCorrect ? 3 : 2;
      } else if (question.qDisplayContent?.type == QuestionTypes.singleChoice) {
        bool isCorrect = true;
        for (int i = 0; i < (question.qDisplayContent?.choices?.length ?? 0); i++) {
          if (question.qDisplayContent!.choices![i].isSelected != question.qGoalContent!.choices![i].isCorrect) {
            isCorrect = false;
            break;
          }
        }
        return isCorrect ? 3 : 2;
      } else if (question.qDisplayContent?.type == QuestionTypes.speaking) {
        return 1;
      } else if (question.qDisplayContent?.type == QuestionTypes.textAnswer) {
        final filled = question.qDisplayContent?.filledAnswer ?? "";
        var correctAnswer;
        if ((question.qGoalContent?.choices?.length ?? 0) > 0) {
          correctAnswer = question.qGoalContent!.choices![0].content ?? "";
        }
        return correctAnswer != null && filled == correctAnswer ? 3 : 2;
      }
    } else if (question.questionType == ExerciseTypes.miniGame) {
      if (question.mDisplayContent?.type == MiniGameType.matchingHidden) {
        return 3;
      } else if (question.mDisplayContent?.type == MiniGameType.dragAndDrop) {
        return 3;
      } else if (question.mDisplayContent?.type == MiniGameType.listening) {
        return 3;
      } else if (question.mDisplayContent?.type == MiniGameType.matchingShow) {
        return 3;
      } else if (question.mDisplayContent?.type == MiniGameType.reorder) {
        return 3;
      } else if (question.mDisplayContent?.type == MiniGameType.textAnswer) {
        return 3;
      }
    }
    return state;
  }

  Future<bool> saveProcess() async {
    final userExerciseId = userExerciseResponse.userExercise?.id ?? 0;
    final response = await ExerciseProvider.instance.updateUserExercise("$userExerciseId", answers.values.toList(), "inprogress");
    if (response.error.isEmpty) {
      return true;
    } else {
      // showDialog(
      //   context: Get.context!,
      //   builder: (BuildContext context) => dialogAlert(
      //     context,
      //     message: response.error,
      //   ),
      // );
      return false;
    }
  }

  void submit() async {
    Duration duration = endTime.difference(DateTime.now());
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => exerciseConfirm(
        context,
        time: '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
        remainQuestion: "${(userExerciseResponse.userExercise?.questions?.length ?? 0) - results.keys.length}",
        onSubmit: () {
          submitExercise();
        },
        onRework: () {},
      ),
    );
  }

  void submitExercise() async {
    Duration duration = endTime.difference(DateTime.now());
    final userExerciseId = userExerciseResponse.userExercise?.id ?? 0;
    final response = await ExerciseProvider.instance.updateUserExercise("$userExerciseId", answers.values.toList(), "finish");
    if (response.error.isEmpty) {
      double totalScore = 0;
      double score = 0;
      int correct = 0;

      for (int i = 0; i < (response.data?.userExercise?.questions?.length ?? 0); i++) {
        totalScore += response.data!.userExercise!.questions![i].allocatedPoint ?? 0;
        score += response.data!.userExercise!.questions![i].pointEarned ?? 0;
        if ((response.data!.userExercise!.questions![i].pointEarned ?? 0) > 0) {
          correct += 1;
        }
      }
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => exerciseResult(
          context,
          totalScore: totalScore,
          score: score,
          wrong: (response.data?.userExercise?.questions?.length ?? 0) - correct,
          correct: correct,
          time: '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
          onViewResult: () {
            Get.close(2);
            Get.toNamed(Routes.EXERCISE_RESULT, arguments: {
              "userExerciseResponse": response.data!,
              "answers": answers,
              "results": results,
            });
          },
          onRework: () {
            onRework();
          },
        ),
        barrierDismissible: false,
      );
    } else {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: response.error,
        ),
      );
    }
  }

  void onRework() async {
    // final userExerciseId = userExerciseResponse.userExercise?.id ?? 0;
    Get.close(1);
    // if (response.error.isEmpty) {
    //   final exercisableType = '${Get.arguments['exercisableType']}';
    //   final exercisableId = '${Get.arguments['exercisableId']}';
    //   Future.delayed(const Duration(milliseconds: 500), () {
    //     try {
    //       Get.put<ExerciseInfoController>(ExerciseInfoController());
    //     } catch (_) {}
    //     Get.toNamed(Routes.EXERCISE_INFO, arguments: {
    //       'userExerciseResponse': response.data,
    //       'exercisableType': exercisableType,
    //       'exercisableId': exercisableId,
    //     });
    //   });
    // } else {
    //   showDialog(
    //     context: Get.context!,
    //     builder: (BuildContext context) => dialogAlert(
    //       context,
    //       message: response.error,
    //     ),
    //   );
    // }
  }
}
