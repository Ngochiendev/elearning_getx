import 'package:elearning/app/components/excercise/answer_radio_option.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/question_content_model.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:logger/logger.dart';

class ExerciseMultipleChoice extends StatefulWidget {
  const ExerciseMultipleChoice({
    required this.index,
    required this.question,
    this.enableScroll = false,
    this.state,
    required this.onComplete,
    Key? key,
  }) : super(key: key);

  final bool enableScroll;
  final int index;
  final Questions question;
  final ExerciseState? state;
  final void Function(Questions result) onComplete;

  @override
  State<ExerciseMultipleChoice> createState() => _ExerciseMultipleChoiceState();
}

class _ExerciseMultipleChoiceState extends State<ExerciseMultipleChoice> {
  selectAnswer(Children e) {
    widget.question.qDisplayContent?.choices?.forEach((element) {
      if (element.id == e.id) {
        element.isSelected = !(element.isSelected ?? false);
      }
    });
    setState(() {});
    widget.onComplete(widget.question);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enableScroll) {
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
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                R.ASSETS_SVG_IC_QUESTION_YELLOW_SVG,
                color: widget.state == null || widget.state == ExerciseState.pending
                    ? Colors.yellow
                    : widget.state == ExerciseState.correct
                        ? colorSemanticGreen100
                        : colorSemanticRed100,
              ),
              SizedBox(width: 16),
              Text(
                "Câu hỏi ${widget.index}",
                style: typoBold18,
              ),
              SizedBox(width: 8),
              widget.state == null || widget.state == ExerciseState.pending
                  ? Text(
                      "(${widget.question.allocatedPoint} điểm)",
                      style: typoRegular14,
                    )
                  : widget.state == ExerciseState.correct
                      ? Text(
                          "+${widget.question.pointEarned} điểm",
                          style: typoRegular14.copyWith(color: colorSemanticGreen100),
                        )
                      : Container(),
            ],
          ),
          (widget.question.qDisplayContent?.title?.length ?? 0) > 0
              ? Container(
                  padding: EdgeInsets.only(top: 12, left: 8),
                  child: Text(
                    widget.question.qDisplayContent?.title ?? "",
                    style: typoBold18,
                  ),
                )
              : Container(),
          Html(
            data: widget.question.qDisplayContent?.content ?? "",
          ),
          ...(widget.question.qDisplayContent?.choices ?? []).map((e) {
            AnswerRadioOptionState state = AnswerRadioOptionState.empty;
            if (widget.state == null || widget.state == ExerciseState.pending) {
              state = e.isSelected ?? false ? AnswerRadioOptionState.selected : AnswerRadioOptionState.empty;
            } else {
              final answer = widget.question.qGoalContent?.choices?.firstWhere((element) => element.id == e.id);
              if (answer != null) {
                if (answer.isCorrect ?? false) {
                  state = AnswerRadioOptionState.correct;
                } else if (e.isSelected!) {
                  state = AnswerRadioOptionState.wrong;
                }
              } else {
                state = e.isSelected ?? false ? AnswerRadioOptionState.selected : AnswerRadioOptionState.empty;
              }
            }

            return AnswerRadioOption(
              label: ALPHABET[widget.question.qDisplayContent!.choices!.indexOf(e)],
              content: e.content ?? "",
              state: state,
              onPressed: () {
                if (widget.state == null || widget.state == ExerciseState.pending) {
                  selectAnswer(e);
                }
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
