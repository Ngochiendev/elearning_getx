import 'package:elearning/app/themes/colors.dart';
import 'package:flutter/material.dart';

enum AppElevatedButtonState { active, inactive, loading, reverse }


class AppElevatedButton extends StatelessWidget {
  final String? buttonTitle;
  final Color? mainColor;
  final VoidCallback? onPressed;
  final AppElevatedButtonState state;

  AppElevatedButton(
      {this.buttonTitle,
      this.onPressed,
      this.mainColor,
      this.state = AppElevatedButtonState.active});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: state == AppElevatedButtonState.active ? onPressed : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return mainColor ?? colorPrimaryBlue100;
            if (states.contains(MaterialState.disabled))
              return colorNeutralGray40;
            return mainColor ?? colorPrimaryBlue100;
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
      child: Container(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: state == AppElevatedButtonState.loading ? 16.0 : 0.0,
              width: state == AppElevatedButtonState.loading ? 16.0 : 0.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).disabledColor,
                ),
                strokeWidth: 2,
              ),
            ),
            SizedBox(
              width: state == AppElevatedButtonState.loading ? 8.0 : 0.0,
            ),
            Text(
              buttonTitle ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: state == AppElevatedButtonState.active
                    ? Colors.white
                    : Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedButtonBase extends StatelessWidget {
  final String? buttonTitle;
  final Color? mainColor;
  final Color? titleColor;
  final VoidCallback? onPressed;
  final AppElevatedButtonState state;
  final double? size;
  final double? height;
  final FontWeight? weight;

  ElevatedButtonBase({
    this.buttonTitle,
    this.onPressed,
    this.mainColor,
    this.titleColor,
    this.state = AppElevatedButtonState.active,
    this.size,
    this.height,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: state == AppElevatedButtonState.active ||
              state == AppElevatedButtonState.reverse
          ? onPressed
          : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return mainColor ?? colorPrimaryBlue100;
            if (states.contains(MaterialState.disabled))
              return state == AppElevatedButtonState.reverse
                  ? Colors.white
                  : Colors.grey;
            return mainColor ?? colorPrimaryBlue100;
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
      child: Container(
        height: height ?? 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: state == AppElevatedButtonState.loading ? 16.0 : 0.0,
              width: state == AppElevatedButtonState.loading ? 16.0 : 0.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).disabledColor,
                ),
                strokeWidth: 2,
              ),
            ),
            SizedBox(
              width: state == AppElevatedButtonState.loading ? 8.0 : 0.0,
            ),
            Text(
              buttonTitle ?? '',
              style: TextStyle(
                fontSize: size ?? 16,
                fontWeight: weight ?? FontWeight.bold,
                color: state == AppElevatedButtonState.reverse
                    ? colorPrimaryBlue100
                    : state == AppElevatedButtonState.active
                        ? Colors.white
                        : Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
