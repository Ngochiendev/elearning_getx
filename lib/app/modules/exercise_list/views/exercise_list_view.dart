import 'dart:async';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/excercise/excersice_minigame.dart';
import 'package:elearning/app/components/excercise/exercise_leading_question.dart';
import 'package:elearning/app/components/excercise/exercise_progress.dart';
import 'package:elearning/app/components/excercise/exercise_speaking.dart';
import 'package:elearning/app/components/excercise/exercise_single_choice.dart';
import 'package:elearning/app/components/excercise/exercise_fill_in_the_blank.dart';
import 'package:elearning/app/components/excercise/exercise_text_answer.dart';
import 'package:elearning/app/components/excercise/exercise_multiple_choice.dart';
import 'package:elearning/app/components/excercise/exercise_slider.dart';
import 'package:elearning/app/components/gradient_text.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../controllers/exercise_list_controller.dart';

class ExerciseListView extends GetView<ExerciseListController> {
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
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.fillInTheBlank) {
                    return ExerciseFillInTheBlank(
                      index: index + 1,
                      question: question,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.leadingQuestion) {
                    return ExerciseLeadingQuestion(
                      index: index + 1,
                      question: question,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.multipleChoice) {
                    return ExerciseMultipleChoice(
                      index: index + 1,
                      question: question,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.singleChoice) {
                    return ExerciseSingleChoice(
                      index: index + 1,
                      question: question,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.speaking) {
                    return ExerciseSpeaking(
                      index: index + 1,
                      question: question,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.textAnswer) {
                    return ExerciseTextAnswer(
                      index: index + 1,
                      question: question,
                      multiline: false,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else {
                    return Container();
                  }
                } else if (question.questionType == ExerciseTypes.miniGame) {
                  return ExerciseMinigame(
                    index: index + 1,
                    question: question,
                    state: (int.tryParse('${controller.results['$index']}') ?? 0) > 0 ? ExerciseState.correct : ExerciseState.pending,
                    onPlay: () {
                      controller.isActiveScene.value = false;
                      controller.update();
                      if (question.mDisplayContent?.type == MiniGameType.matchingHidden) {
                        Get.toNamed(Routes.MINIGAME_MATCHING_HIDDEN, arguments: {"question": question});
                      } else if (question.mDisplayContent?.type == MiniGameType.dragAndDrop) {
                        Get.toNamed(Routes.MINIGAME_DRAG_AND_DROP, arguments: {"question": question});
                      } else if (question.mDisplayContent?.type == MiniGameType.listening) {
                        Get.toNamed(Routes.MINIGAME_LISTENING, arguments: {"question": question});
                      } else if (question.mDisplayContent?.type == MiniGameType.matchingShow) {
                        Get.toNamed(Routes.MINIGAME_MATCHING_SHOW, arguments: {"question": question});
                      } else if (question.mDisplayContent?.type == MiniGameType.reorder) {
                        Get.toNamed(Routes.MINIGAME_REORDER, arguments: {"question": question});
                      } else if (question.mDisplayContent?.type == MiniGameType.textAnswer) {
                        Get.toNamed(Routes.MINIGAME_TEXT_ANSWER, arguments: {"question": question});
                      }
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          Obx(
            () => BottomInfoView(
              totalQuestion: controller.userExerciseResponse.userExercise?.questions?.length ?? 0,
              results: controller.results,
              startTime: controller.startTime,
              endTime: controller.endTime,
              submit: controller.submit,
              forceSubmit: controller.submitExercise,
              screenWidth: MediaQuery.of(context).size.width,
              isActive: controller.isActiveScene.value,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomInfoView extends StatefulWidget {
  const BottomInfoView({
    required this.totalQuestion,
    required this.results,
    required this.startTime,
    required this.endTime,
    required this.submit,
    required this.forceSubmit,
    required this.screenWidth,
    required this.isActive,
    Key? key,
  }) : super(key: key);
  final int totalQuestion;
  final Map<String, int> results;
  final DateTime startTime;
  final DateTime endTime;
  final void Function() submit;
  final void Function() forceSubmit;
  final double screenWidth;
  final bool isActive;

  @override
  State<BottomInfoView> createState() => _BottomInfoViewState();
}

class _BottomInfoViewState extends State<BottomInfoView> {
  var maxInfoHeight = 0.0;
  var infoHeight = 0.0;
  var timeStr = "00:00:00";
  late final Timer _timer;
  ui.Image? customImage;

  @override
  void initState() {
    timerString();
    int colNo = ((widget.screenWidth - 32) / 56).floor();
    maxInfoHeight = (widget.totalQuestion / colNo).ceil() * 56 + 16;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => timerString());

    loadImage('assets/png/ic_fire.png').then((image) {
      setState(() {
        customImage = image;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void timerString() {
    Duration duration = widget.endTime.difference(DateTime.now());
    if (duration.isNegative) {
      if (Get.currentRoute != Routes.EXERCISE_LIST) {
        Get.back();
      }
      Future.delayed(Duration(milliseconds: 300)).then((value) {
        widget.forceSubmit();
      });
      _timer.cancel();
      setState(() {
        timeStr = "00:00:00";
      });
    } else {
      setState(() {
        timeStr = '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (event) {
        setState(() {
          final offset = event.delta.dy * 3;
          infoHeight = infoHeight - offset > 0
              ? infoHeight - offset < maxInfoHeight
                  ? infoHeight - offset
                  : maxInfoHeight
              : 0;
        });
      },
      onVerticalDragEnd: (event) {
        if (infoHeight > maxInfoHeight / 2) {
          setState(() {
            infoHeight = maxInfoHeight;
          });
        } else {
          setState(() {
            infoHeight = 0;
          });
        }
      },
      child: Container(
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
            AnimatedContainer(
              height: infoHeight,
              duration: Duration(milliseconds: 100),
              padding: EdgeInsets.only(bottom: 16),
              curve: Curves.linear,
              child: Wrap(
                  clipBehavior: Clip.antiAlias,
                  alignment: WrapAlignment.start,
                  children: List.generate(widget.totalQuestion, (index) => index)
                      .map(
                        (e) => Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: (int.tryParse('${widget.results['$e']}') ?? 0) > 0 ? colorPrimaryBlue100 : colorNeutralGray20,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            (e + 1).toString(),
                            style: typoRegular14.copyWith(color: colorWhite),
                          ),
                        ),
                      )
                      .toList()),
            ),
            Obx(
              () => Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 100,
                    child: GradientText(
                      timeStr,
                      style: typoBold18,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xfffab80d),
                          Color(0xffe73c00),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ExerciseProgress(
                      // initValue: widget.totalQuestion > 0 ? widget.results.values.length / widget.totalQuestion : 0,
                      customImage: customImage,
                      value: 1 - widget.endTime.difference(DateTime.now()).inSeconds.toDouble() / widget.endTime.difference(widget.startTime).inSeconds.toDouble(),
                    ),
                  ),
                  Text(
                    "${widget.results.values.length}/${widget.totalQuestion} câu",
                    style: typoBold18.copyWith(color: colorSemanticBlue100),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              height: infoHeight == maxInfoHeight ? 80 : 0,
              padding: EdgeInsets.symmetric(vertical: 16),
              duration: Duration(milliseconds: 100),
              curve: Curves.linear,
              child: ElevatedButtonBase(
                weight: FontWeight.w600,
                buttonTitle: "Nộp bài",
                onPressed: widget.submit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
