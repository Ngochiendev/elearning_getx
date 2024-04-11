import 'dart:async';

import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/excercise/excersice_minigame.dart';
import 'package:elearning/app/components/excercise/exercise_fill_in_the_blank.dart';
import 'package:elearning/app/components/excercise/exercise_leading_question.dart';
import 'package:elearning/app/components/excercise/exercise_multiple_choice.dart';
import 'package:elearning/app/components/excercise/exercise_progress.dart';
import 'package:elearning/app/components/excercise/exercise_single_choice.dart';
import 'package:elearning/app/components/excercise/exercise_slider.dart';
import 'package:elearning/app/components/excercise/exercise_speaking.dart';
import 'package:elearning/app/components/excercise/exercise_text_answer.dart';
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

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../controllers/exercise_step_controller.dart';
import 'dart:ui' as ui;

class ExerciseStepView extends GetView<ExerciseStepController> {
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
          Obx(
            () => ExerciseTopBar(
              stepController: controller.stepController,
              pageIndex: controller.pageIndex.value,
              totalQuestion: controller.userExerciseResponse.userExercise?.questions?.length ?? 0,
              startTime: controller.startTime,
              endTime: controller.endTime,
              results: controller.results,
              forceSubmit: controller.submitExercise,
              submit: controller.submit,
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              scrollDirection: Axis.horizontal,
              itemCount: controller.userExerciseResponse.userExercise?.questions?.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final question = controller.userExerciseResponse.userExercise!.questions![index];
                if (question.questionType == ExerciseTypes.question) {
                  if (question.qDisplayContent?.type == QuestionTypes.essay) {
                    return ExerciseTextAnswer(
                      index: index + 1,
                      question: question,
                      multiline: true,
                      enableScroll: true,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.fillInTheBlank) {
                    return ExerciseFillInTheBlank(
                      index: index + 1,
                      question: question,
                      enableScroll: true,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.leadingQuestion) {
                    return ExerciseLeadingQuestion(
                      index: index + 1,
                      question: question,
                      enableScroll: true,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.multipleChoice) {
                    return ExerciseMultipleChoice(
                      index: index + 1,
                      question: question,
                      enableScroll: true,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else if (question.qDisplayContent?.type == QuestionTypes.singleChoice) {
                    return ExerciseSingleChoice(
                      index: index + 1,
                      question: question,
                      enableScroll: true,
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
                      enableScroll: true,
                      onComplete: (result) {
                        controller.updateProcess(result);
                      },
                    );
                  } else {
                    return Container();
                  }
                } else if (question.questionType == ExerciseTypes.miniGame) {
                  return Obx(
                    () => ExerciseMinigame(
                      index: index + 1,
                      question: question,
                      state: (int.tryParse('${controller.results['$index']}') ?? 0) > 0 ? ExerciseState.correct : ExerciseState.pending,
                      onPlay: () {
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
                    ),
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
            child: Obx(
              () => Row(
                children: [
                  IconButton(
                    onPressed: controller.prevQuestion,
                    icon: SvgPicture.asset(
                      R.ASSETS_SVG_IC_BACK_BLACK_SVG,
                      color: controller.pageIndex.value == 0 ? colorNeutralGray60 : colorPrimaryBlue100,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 68,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: ElevatedButtonBase(
                        state: AppElevatedButtonState.active,
                        weight: FontWeight.w600,
                        buttonTitle: "Nộp bài",
                        onPressed: controller.submit,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: controller.nextQuestion,
                    icon: SvgPicture.asset(
                      R.ASSETS_SVG_IC_FORWARD_BLUE_SVG,
                      color: controller.pageIndex.value == (controller.userExerciseResponse.userExercise?.questions?.length ?? 0) - 1 ? colorNeutralGray60 : colorPrimaryBlue100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseTopBar extends StatefulWidget {
  const ExerciseTopBar({
    Key? key,
    required this.stepController,
    required this.pageIndex,
    required this.totalQuestion,
    required this.results,
    required this.startTime,
    required this.endTime,
    required this.forceSubmit,
    required this.submit,
  }) : super(key: key);

  final ScrollController stepController;
  final int pageIndex;
  final int totalQuestion;
  final Map<String, int> results;
  final DateTime startTime;
  final DateTime endTime;
  final void Function() submit;
  final void Function() forceSubmit;

  @override
  State<ExerciseTopBar> createState() => _ExerciseTopBarState();
}

class _ExerciseTopBarState extends State<ExerciseTopBar> {
  late final Timer _timer;
  var timeStr = "00:00:00";
  ui.Image? customImage;

  @override
  void initState() {
    timerString();
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

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _timer.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) => timerString());
    }
  }

  void timerString() {
    Duration duration = widget.endTime.difference(DateTime.now());
    if (duration.isNegative) {
      if (_timer.isActive) {
        if (Get.currentRoute != Routes.EXERCISE_STEP) {
          Get.back();
        }
        Future.delayed(Duration(milliseconds: 300)).then((value) {
          widget.forceSubmit();
        });
      }
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
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 16),
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
            ],
          ),
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              controller: widget.stepController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.totalQuestion,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Obx(
                () => Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (int.tryParse('${widget.results['$index']}') ?? 0) > 0
                        ? colorPrimaryBlue100
                        : widget.pageIndex == index
                            ? colorSemanticGreen100
                            : colorNeutralGray20,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${index + 1}",
                    style: typoRegular14.copyWith(color: colorWhite),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
