import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

enum AnswerRadioOptionState { empty, selected, correct, wrong }

class AnswerRadioOption extends StatelessWidget {
  const AnswerRadioOption({
    Key? key,
    required this.label,
    required this.content,
    required this.state,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final String content;
  final AnswerRadioOptionState state;
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
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: state == AnswerRadioOptionState.empty ? colorNeutralGray20 : colorWhite,
                  width: 1,
                ),
                color: state == AnswerRadioOptionState.selected
                    ? colorSemanticBlue100
                    : state == AnswerRadioOptionState.correct
                        ? colorSemanticGreen100
                        : state == AnswerRadioOptionState.wrong
                            ? Color(0xfff13b2f)
                            : colorWhite,
              ),
              child: Text(
                label,
                style: typoRegular14.copyWith(color: state == AnswerRadioOptionState.empty ? colorNeutralGray100 : colorWhite),
              ),
            ),
            SizedBox(width: 8),
            ConstrainedBox(
              constraints: new BoxConstraints(
                maxHeight: MediaQuery.of(context).size.width - 120,
                maxWidth: (MediaQuery.of(context).size.width - 120) * 0.5,
              ),
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
