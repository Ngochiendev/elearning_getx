import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseMinigame extends StatelessWidget {
  const ExerciseMinigame({
    required this.index,
    required this.question,
    required this.state,
    required this.onPlay,
    Key? key,
  }) : super(key: key);
  final int index;
  final Questions question;
  final ExerciseState state;
  final void Function()? onPlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                R.ASSETS_SVG_IC_MINIGAME_SVG,
                color: state == ExerciseState.correct
                    ? colorSemanticGreen100
                    : state == ExerciseState.wrong
                        ? colorSemanticRed100
                        : colorSemanticYellow100,
              ),
              SizedBox(width: 16),
              Text(
                "Minigame $index",
                style: typoBold18,
              ),
              SizedBox(width: 8),
              Text(
                state == ExerciseState.correct
                    ? "+${question.allocatedPoint} điểm"
                    : state == ExerciseState.wrong
                        ? ""
                        : "(${question.pointEarned} điểm)",
                style: state == ExerciseState.correct ? typoRegular14.copyWith(color: colorSemanticGreen100) : typoRegular14,
              ),
            ],
          ),
          SizedBox(height: 16),
          state != ExerciseState.pending
              ? Container()
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return colorPrimaryBlue10;
                      },
                    ),
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (Set<MaterialState> states) {
                        return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        );
                      },
                    ),
                  ),
                  onPressed: onPlay,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(R.ASSETS_PNG_BTN_PLAY_PNG),
                        SizedBox(width: 16),
                        Text(
                          "Chơi Game",
                          style: typoRegular14.copyWith(color: colorPrimaryBlue100),
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
