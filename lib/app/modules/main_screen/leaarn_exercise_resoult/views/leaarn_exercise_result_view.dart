import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/excercise/excersice_minigame.dart';
import 'package:elearning/app/components/excercise/exercise_fill_in_the_blank.dart';
import 'package:elearning/app/components/excercise/exercise_leading_question.dart';
import 'package:elearning/app/components/excercise/exercise_multiple_choice.dart';
import 'package:elearning/app/components/excercise/exercise_single_choice.dart';
import 'package:elearning/app/components/excercise/exercise_speaking.dart';
import 'package:elearning/app/components/excercise/exercise_text_answer.dart';
import 'package:elearning/app/components/gradient_text.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/course_detail_model.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf/pdf.dart';
import 'package:get/get.dart';
import 'package:elearning/generated/resource.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../controllers/leaarn_exercise_result_controller.dart';

class LeaarnExerciseResoultView
    extends GetView<LeaarnExerciseResoultController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(R.ASSETS_SVG_IC_BACK_BLACK_SVG),
            ),
          ),
          title: Text(
            controller.userExerciseResponse.value.userExercise?.title ??
                "Bài luyện tập",
            style: typoBold16,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                  onTap: () => controller.printPdf(),
                  child: SvgPicture.asset(R.ASSETS_SVG_IC_DOWNLOAD_LIV_SVG)),
            ),
          ],
          backgroundColor: colorWhite,
        ),
        body: controller.userExerciseResponse.value.userExercise == null
            ? Container()
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      // physics: NeverScrollableScrollPhysics(),
                      child: Screenshot(
                        controller: controller.screenshotController,
                        child: ScrollablePositionedList.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemScrollController: controller.itemScrollController,
                          itemCount: controller.userExerciseResponse.value
                                  .userExercise?.questions?.length ??
                              0,
                          itemBuilder: (context, index) {
                            final question = controller.userExerciseResponse
                                .value.userExercise!.questions![index];
                            print(question.questionType);
                            if (question.questionType ==
                                ExerciseTypes.question) {
                              if (question.qDisplayContent?.type ==
                                  QuestionTypes.essay) {
                                return ExerciseTextAnswer(
                                  index: index + 1,
                                  question: question,
                                  multiline: true,
                                  state:
                                      controller.exerciseStatus(question) == 3
                                          ? ExerciseState.correct
                                          : ExerciseState.wrong,
                                  onComplete: (result) {},
                                );
                              } else if (question.qDisplayContent?.type ==
                                  QuestionTypes.fillInTheBlank) {
                                return ExerciseFillInTheBlank(
                                  index: index + 1,
                                  question: question,
                                  state:
                                      controller.exerciseStatus(question) == 3
                                          ? ExerciseState.correct
                                          : ExerciseState.wrong,
                                  onComplete: (result) {},
                                );
                              } else if (question.qDisplayContent?.type ==
                                  QuestionTypes.leadingQuestion) {
                                return ExerciseLeadingQuestion(
                                  index: index + 1,
                                  question: question,
                                  state:
                                      controller.exerciseStatus(question) == 3
                                          ? ExerciseState.correct
                                          : ExerciseState.wrong,
                                  onComplete: (result) {},
                                );
                              } else if (question.qDisplayContent?.type ==
                                  QuestionTypes.multipleChoice) {
                                return ExerciseMultipleChoice(
                                  index: index + 1,
                                  question: question,
                                  state:
                                      controller.exerciseStatus(question) == 3
                                          ? ExerciseState.correct
                                          : ExerciseState.wrong,
                                  onComplete: (result) {},
                                );
                              } else if (question.qDisplayContent?.type ==
                                  QuestionTypes.singleChoice) {
                                return ExerciseSingleChoice(
                                  index: index + 1,
                                  question: question,
                                  state:
                                      controller.exerciseStatus(question) == 3
                                          ? ExerciseState.correct
                                          : ExerciseState.wrong,
                                  onComplete: (result) {},
                                );
                              } else if (question.qDisplayContent?.type ==
                                  QuestionTypes.speaking) {
                                return ExerciseSpeaking(
                                  index: index + 1,
                                  question: question,
                                  state:
                                      controller.exerciseStatus(question) == 3
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
                                  state:
                                      controller.exerciseStatus(question) == 3
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
                      ),
                    ),
                  ),
                  BottomInfoView(
                    totalQuestion: controller.userExerciseResponse.value
                        .userExercise!.questions!.length,
                    results: controller.results,
                    screenWidth: MediaQuery.of(context).size.width,
                    isActive: controller.isActiveScene.value,
                    controller: controller,
                    time: controller.getTime(),
                  )
                ],
              ),
      ),
    );
  }
}

class BottomInfoView extends StatefulWidget {
  const BottomInfoView({
    required this.totalQuestion,
    required this.results,
    required this.screenWidth,
    required this.isActive,
    required this.controller,
    required this.time,
    Key? key,
  }) : super(key: key);
  final int totalQuestion;
  final Map<String, int> results;
  final LeaarnExerciseResoultController controller;
  final double screenWidth;
  final bool isActive;
  final String time;

  @override
  State<BottomInfoView> createState() => _BottomInfoViewState();
}

class _BottomInfoViewState extends State<BottomInfoView> {
  var maxInfoHeight = 0.0;
  var infoHeight = 0.0;

  @override
  void initState() {
    int colNo = ((widget.screenWidth - 32) / 56).floor();
    maxInfoHeight = (widget.totalQuestion / colNo).ceil() * 56 + 16;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                  children:
                      List.generate(widget.totalQuestion, (index) => index)
                          .map((e) {
                    final question = widget.controller.userExerciseResponse
                        .value.userExercise!.questions![e];
                    return InkWell(
                      onTap: () => widget.controller.scroll(e),
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: widget.controller.exerciseStatus(question) == 3
                              ? colorSemanticGreen100
                              : colorSemanticRed100,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          (e + 1).toString(),
                          style: typoRegular14.copyWith(color: colorWhite),
                        ),
                      ),
                    );
                  }).toList()),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Thời gian: ${widget.time}",
                  style: typoBold18.copyWith(color: colorNeutralGray95),
                ),
                Spacer(),
                Text(
                  "Đúng ${widget.controller.getCorrect()}/",
                  style: typoBold18.copyWith(color: colorSemanticGreen100),
                ),
                Text(
                  "${widget.controller.userExerciseResponse.value.userExercise?.questions?.length}",
                  style: typoBold18.copyWith(color: colorNeutralGray95),
                ),
              ],
            ),
            AnimatedContainer(
              height: infoHeight == maxInfoHeight ? 80 : 0,
              padding: EdgeInsets.symmetric(vertical: 16),
              duration: Duration(milliseconds: 100),
              curve: Curves.linear,
              child: ElevatedButtonBase(
                weight: FontWeight.w600,
                buttonTitle: "Thoát",
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
