import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String? buttonTitle;
  final Color? color;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  AppTextButton({this.buttonTitle, this.onPressed, this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle ?? '',
        style: textStyle ?? typoBold16.copyWith(color: color ?? colorWhite),
      ),
    );
  }
}
