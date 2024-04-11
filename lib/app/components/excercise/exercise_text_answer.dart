import 'package:elearning/app/components/app_text_field.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class ExerciseTextAnswer extends StatelessWidget {
  ExerciseTextAnswer({
    required this.index,
    required this.question,
    required this.multiline,
    this.enableScroll = false,
    this.state,
    required this.onComplete,
    Key? key,
  }) : super(key: key);

  final bool enableScroll;
  final int index;
  final Questions question;
  final bool multiline;
  final ExerciseState? state;
  final void Function(Questions result) onComplete;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (enableScroll) {
      return buildScroll(context);
    } else {
      return buildNonScroll(context);
    }
  }

  Widget buildScroll(BuildContext context) {
    return SingleChildScrollView(
      child: buildNonScroll(context),
    );
  }

  Widget buildNonScroll(BuildContext context) {
    _textEditingController.text = question.qDisplayContent?.filledAnswer ?? "";
    _textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController.text.length));
    final correctAnswer = (question.qGoalContent?.choices?.length ?? 0) > 0 ? question.qGoalContent!.choices![0].content ?? "" : "";
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  R.ASSETS_SVG_IC_QUESTION_YELLOW_SVG,
                  color: state == null || state == ExerciseState.pending
                      ? Colors.yellow
                      : state == ExerciseState.correct
                          ? colorSemanticGreen100
                          : colorSemanticRed100,
                ),
                SizedBox(width: 16),
                Text(
                  "Câu hỏi $index",
                  style: typoBold18,
                ),
                SizedBox(width: 8),
                state == null || state == ExerciseState.pending
                    ? Text(
                        "(${question.allocatedPoint} điểm)",
                        style: typoRegular14,
                      )
                    : state == ExerciseState.correct
                        ? Text(
                            "+${question.pointEarned} điểm",
                            style: typoRegular14.copyWith(color: colorSemanticGreen100),
                          )
                        : Container(),
              ],
            ),
            (question.qDisplayContent?.title?.length ?? 0) > 0
                ? Container(
                    padding: EdgeInsets.only(top: 12, left: 8),
                    child: Text(
                      question.qDisplayContent?.title ?? "",
                      style: typoBold18,
                    ),
                  )
                : Container(),
            Html(
              data: question.qDisplayContent?.content ?? "",
            ),
            state == null || state == ExerciseState.pending
                ? AppTextField(
                    controller: _textEditingController,
                    keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
                    hintText: 'Nhập đáp án',
                    onEditingComplete: () {
                      question.qDisplayContent?.filledAnswer = _textEditingController.text.trim();
                      onComplete(question);
                    },
                  )
                : state == ExerciseState.wrong
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width - 32,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: colorSemanticRed100),
                              color: colorSemanticRed20,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Text(
                              question.qDisplayContent?.filledAnswer ?? "",
                              style: typoRegular14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("Đáp án:", style: typoRegular14),
                              Text(
                                correctAnswer,
                                style: typoRegular14.copyWith(color: colorSemanticGreen100),
                              ),
                            ],
                          ),
                        ],
                      )
                    : state == ExerciseState.correct
                        ? Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width - 32,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: colorSemanticGreen100),
                              color: colorSemanticGreen20,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Text(
                              question.qDisplayContent?.filledAnswer ?? "",
                              style: typoRegular14,
                            ),
                          )
                        : Container(),
          ],
        ),
      ),
    );
  }
}
