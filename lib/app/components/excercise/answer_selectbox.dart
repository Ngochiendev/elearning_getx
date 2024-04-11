import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:logger/logger.dart';

enum AnswerSelectBoxState { empty, selected, correct, wrong }

class AnswerSelectBox extends StatelessWidget {
  const AnswerSelectBox({
    Key? key,
    required this.label,
    required this.content,
    required this.state,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final String content;
  final AnswerSelectBoxState state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: state == AnswerSelectBoxState.empty ? colorNeutralGray20 : colorWhite,
                  width: 1,
                ),
                color: state == AnswerSelectBoxState.selected
                    ? colorSemanticBlue100
                    : state == AnswerSelectBoxState.correct
                        ? colorSemanticGreen100
                        : state == AnswerSelectBoxState.wrong
                            ? Color(0xfff13b2f)
                            : colorWhite,
              ),
              child: Text(
                label,
                style: typoRegular14.copyWith(color: state == AnswerSelectBoxState.empty ? colorNeutralGray100 : colorWhite),
              ),
              // child: Html(
              //   data: label,
              //   style: {
              //     'p': Style(
              //       color: state == AnswerSelectBoxState.empty ? colorNeutralGray100 : colorWhite,
              //       fontSize: FontSize(16),
              //       fontWeight: FontWeight.normal,
              //     )
              //   },
              // ),
            ),
            SizedBox(width: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width - 120,
              child: Html(
                data: content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
