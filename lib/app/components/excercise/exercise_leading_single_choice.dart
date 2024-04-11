import 'package:elearning/app/components/excercise/answer_selectbox.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/question_content_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:elearning/app/themes/text_styles.dart';

class ExerciseLeadingSingleChoice extends StatefulWidget {
  const ExerciseLeadingSingleChoice({
    required this.children,
    this.answers,
    this.state,
    required this.onComplete,
    Key? key,
  }) : super(key: key);
  final Children children;
  final Children? answers;
  final ExerciseState? state;
  final void Function(Children result) onComplete;

  @override
  State<ExerciseLeadingSingleChoice> createState() => _ExerciseLeadingSingleChoiceState();
}

class _ExerciseLeadingSingleChoiceState extends State<ExerciseLeadingSingleChoice> {
  selectAnswer(Choices e) {
    widget.children.choices?.forEach((element) {
      element.isSelected = e.id == element.id;
    });
    widget.onComplete(widget.children);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (widget.children.title?.length ?? 0) > 0
              ? Container(
                  padding: EdgeInsets.only(top: 12, left: 8),
                  child: Text(
                    widget.children.title ?? "",
                    style: typoBold18,
                  ),
                )
              : Container(),
          Html(
            data: widget.children.content ?? "",
          ),
          ...(widget.children.choices ?? []).map((e) {
            AnswerSelectBoxState state = AnswerSelectBoxState.empty;
            if (widget.state == null || widget.state == ExerciseState.pending) {
              state = e.isSelected ?? false ? AnswerSelectBoxState.selected : AnswerSelectBoxState.empty;
            } else {
              final answer = widget.answers?.choices?.firstWhere((element) => element.id == e.id);
              if (answer != null) {
                if (answer.isCorrect ?? false) {
                  state = AnswerSelectBoxState.correct;
                } else if (e.isSelected!) {
                  state = AnswerSelectBoxState.wrong;
                }
              } else {
                state = e.isSelected ?? false ? AnswerSelectBoxState.selected : AnswerSelectBoxState.empty;
              }
            }

            return AnswerSelectBox(
              label: ALPHABET[widget.children.choices!.indexOf(e)],
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
