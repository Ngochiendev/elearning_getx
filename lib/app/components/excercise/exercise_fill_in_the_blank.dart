import 'package:elearning/app/components/app_text_field.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:html/parser.dart';

class ExerciseFillInTheBlank extends StatefulWidget {
  ExerciseFillInTheBlank({
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
  State<ExerciseFillInTheBlank> createState() => _ExerciseFillInTheBlankState();
}

class _ExerciseFillInTheBlankState extends State<ExerciseFillInTheBlank> {
  final TextEditingController _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  var activeIndex = -1;
  List<String?> arrContent = [];
  int buildIndex = -1;

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body?.text).documentElement?.text ?? "";

    return parsedString;
  }

  @override
  void initState() {
    super.initState();
    String content = widget.question.qDisplayContent?.content ?? "";
    content = _parseHtmlString(content);

    arrContent = content.split(RegExp(r"{{(.*?)}}"));
    for (int i = widget.question.qDisplayContent!.subQuestions!.length; i > 0; i--) {
      arrContent.insert(i, "");
    }
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.onComplete(widget.question);
      }
    });
    setState(() {});
  }

  onFocusIndex(int index) {
    setState(() {
      activeIndex = index;
    });
    _textEditingController.text = widget.question.qDisplayContent!.subQuestions![activeIndex].filledAnswer ?? "";
    _textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController.text.length));

    _focusNode.requestFocus();
  }

  onChangeText(String text) {
    if (activeIndex < 0) {
      return;
    }
    widget.question.qDisplayContent!.subQuestions![activeIndex].filledAnswer = text;
    setState(() {});
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
    buildIndex = -1;
    final isShowResult = widget.state == ExerciseState.wrong || widget.state == ExerciseState.correct;
    return Container(
      padding: EdgeInsets.all(16),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.000001,
            child: TextField(
              controller: _textEditingController,
              focusNode: _focusNode,
              onChanged: onChangeText,
            ),
          ),
          Column(
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
              RichText(
                text: TextSpan(
                  style: typoRegular16,
                  children: arrContent.map((e) {
                    if (e == "") {
                      buildIndex++;
                      var bI = buildIndex;
                      if ((widget.question.qDisplayContent?.subQuestions?.length ?? 0) == bI) {
                        return TextSpan(text: e);
                      }
                      if (isShowResult) {
                        if ((widget.question.qGoalContent?.subQuestions?[bI].choices?.length ?? 0) > 0 &&
                            widget.question.qGoalContent!.subQuestions![bI].choices![0].content == widget.question.qDisplayContent?.subQuestions?[bI].filledAnswer) {
                          return TextSpan(
                            text: widget.question.qDisplayContent?.subQuestions?[bI].filledAnswer ?? "          ",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: colorSemanticGreen100,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return TextSpan(
                            children: [
                              TextSpan(
                                text: widget.question.qDisplayContent?.subQuestions?[bI].filledAnswer,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: colorSemanticRed100,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " [${(widget.question.qGoalContent?.subQuestions?[bI].choices?.length ?? 0) > 0 ? widget.question.qGoalContent!.subQuestions![bI].choices![0].content?.replaceAll('{{', '').replaceAll('}}', '') : ""}]",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: colorSemanticGreen100,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        }
                      } else {
                        return TextSpan(
                          text: (widget.question.qDisplayContent?.subQuestions?[bI].filledAnswer ?? "").length > 0 ? (widget.question.qDisplayContent?.subQuestions?[bI].filledAnswer ?? "") : "          ",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              onFocusIndex(bI);
                            },
                        );
                      }
                    } else {
                      return TextSpan(text: e);
                    }
                  }).toList(),
                ),
              ),
              // Html(data: widget.question.qDisplayContent?.content)
            ],
          ),
        ],
      ),
    );
  }
}
