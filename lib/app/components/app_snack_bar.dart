import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum SnackbarType {
  none,
  success,
  info,
  warning,
  error,
}

void appSnackbar(String message, {SnackbarType type = SnackbarType.none}) {
  Widget icon;
  Color bgColor;

  switch (type) {
    case SnackbarType.success:
      icon = SvgPicture.asset(
        R.ASSETS_SVG_ICF_TICK_SQUARE_SVG,
        color: colorSemanticGreen100,
      );
      bgColor = colorSemanticGreen40;
      break;
    case SnackbarType.info:
      icon = SvgPicture.asset(
        R.ASSETS_SVG_ICF_INFO_SQUARE_SVG,
        color: colorSemanticBlue100,
      );
      bgColor = colorSemanticBlue40;
      break;
    case SnackbarType.warning:
      icon = SvgPicture.asset(
        R.ASSETS_SVG_ICF_INFO_OVAL_SVG,
        color: colorSemanticOrange100,
      );
      bgColor = colorSemanticOrange40;
      break;
    case SnackbarType.error:
      icon = SvgPicture.asset(
        R.ASSETS_SVG_ICF_DANGER_SVG,
        color: colorSemanticRed100,
      );
      bgColor = colorSemanticRed40;
      break;
    case SnackbarType.none:
    default:
      icon = SvgPicture.asset(
        R.ASSETS_SVG_ICF_INFO_SQUARE_SVG,
        color: colorSemanticBlue100,
      );
      bgColor = colorSemanticBlue40;
      break;
  }
  Get.snackbar(
    '',
    '',
    backgroundColor: bgColor,
    titleText: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: typoRegular16,
          ),
        ),
      ],
    ),
    messageText: Container(),
    margin: EdgeInsets.all(16),
  );
}
