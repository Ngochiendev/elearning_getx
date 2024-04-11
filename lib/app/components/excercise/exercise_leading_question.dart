import 'package:elearning/app/components/excercise/exercise_leading_multiple_choice.dart';
import 'package:elearning/app/components/excercise/exercise_leading_single_choice.dart';
import 'package:elearning/app/components/excercise/exercise_leading_text_answer.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/question_content_model.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class ExerciseLeadingQuestion extends StatefulWidget {
  ExerciseLeadingQuestion({
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
  _ExerciseLeadingQuestionState createState() => _ExerciseLeadingQuestionState();
}

class _ExerciseLeadingQuestionState extends State<ExerciseLeadingQuestion> {
  updateProcess(Children e) {
    widget.question.qDisplayContent?.children?.forEach((element) {
      if (element.id == e.id) {
        element = e;
      }
    });
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
    Logger().d(widget.question.toJson(), "question");

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
          ...(widget.question.qDisplayContent?.children ?? []).map((e) {
            var index = widget.question.qDisplayContent?.children?.indexOf(e) ?? 0;

            if (e.type == QuestionTypes.multipleChoice) {
              return ExerciseLeadingMultipleChoice(
                children: e,
                state: widget.state,
                answers: widget.question.qGoalContent?.children?[index],
                onComplete: (result) {
                  updateProcess(result);
                },
              );
            } else if (e.type == QuestionTypes.singleChoice) {
              return ExerciseLeadingSingleChoice(
                children: e,
                state: widget.state,
                answers: widget.question.qGoalContent?.children?[index],
                onComplete: (result) {
                  updateProcess(result);
                },
              );
            } else if (e.type == QuestionTypes.textAnswer) {
              return ExerciseLeadingTextAnswer(
                children: e,
                state: widget.state,
                answers: widget.question.qGoalContent?.children?[index],
                onComplete: (result) {
                  updateProcess(result);
                },
                multiline: false,
              );
            } else {
              return Container();
            }
          }).toList(),
        ],
      ),
    );
  }
}
