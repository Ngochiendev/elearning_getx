import 'package:elearning/app/components/app_text_field.dart';
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

class ExerciseLeadingTextAnswer extends StatelessWidget {
  ExerciseLeadingTextAnswer({
    required this.children,
    required this.answers,
    required this.multiline,
    this.state,
    required this.onComplete,
    Key? key,
  }) : super(key: key);

  final Children children;
  final Children? answers;
  final bool multiline;
  final ExerciseState? state;
  final void Function(Children result) onComplete;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = children.filledAnswer ?? "";
    _textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController.text.length));
    final correctAnswer = (answers?.choices?.length ?? 0) > 0 ? answers!.choices![0].content ?? "" : "";
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
            (children.title?.length ?? 0) > 0
                ? Container(
                    padding: EdgeInsets.only(top: 12, left: 8),
                    child: Text(
                      children.title ?? "",
                      style: typoBold18,
                    ),
                  )
                : Container(),
            Html(
              data: children.content ?? "",
            ),
            state == null || state == ExerciseState.pending
                ? AppTextField(
                    controller: _textEditingController,
                    keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
                    hintText: 'Nhập đáp án',
                    onEditingComplete: () {
                      children.filledAnswer = _textEditingController.text.trim();
                      onComplete(children);
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
                              children.filledAnswer ?? "",
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
                              children.filledAnswer ?? "",
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
