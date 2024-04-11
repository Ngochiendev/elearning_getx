import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';

final styleButtonPrimary = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralGray20;
    }
    return colorPrimaryBlue100;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoBold14),
);

final styleButtonGreen = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralGray20;
    }
    return colorSemanticGreen100;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoBold14),
);

final styleButtonRed = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralGray20;
    }
    return colorSemanticRed100;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoBold14),
);

final styleButtonWhite = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralGray40
        : colorPrimaryBlue100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralGray20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralGray5 : null;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoBold14),
);

final styleButtonBLueBorder = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: colorNeutralGray100, width: 2),
          )
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: colorPrimaryBlue100, width: 2),
          );
  }),
  backgroundColor: MaterialStateProperty.all<Color>(colorPrimaryBlue5),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralGray40
        : colorPrimaryBlue100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralGray5 : null;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoBold14),
);
final styleButtonRedBorder = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: colorNeutralGray100, width: 2),
          )
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: colorSecondaryRed100, width: 2),
          );
  }),
  backgroundColor: MaterialStateProperty.all<Color>(colorPrimaryBlue5),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralGray40
        : colorPrimaryBlue100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralGray5 : null;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoBold14),
);

final styleButtonWhiteBorder = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: colorNeutralGray5, width: 2),
          )
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: colorPrimaryBlue100, width: 2),
          );
  }),
  backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralGray40
        : colorPrimaryBlue100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralGray20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralGray5 : null;
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoBold14),
);

final styleButtonChip = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
      side: BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralGray20;
    }
    return colorPrimaryBlue5;
  }),
  foregroundColor: MaterialStateProperty.all<Color>(colorNeutralGray100),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoRegular14),
);

final styleButtonChipActive = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
      side: BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralGray20;
    }
    return colorPrimaryBlue5;
  }),
  foregroundColor: MaterialStateProperty.all<Color>(colorPrimaryBlue100),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoRegular14),
);

final styleTextField = typoRegular14.copyWith(color: colorNeutralGray100);

final decorTextField = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorSemanticRed100, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorSemanticRed100, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
  hintStyle: typoRegular14.copyWith(color: colorNeutralGray40),
  errorStyle: typoRegular14.copyWith(color: colorSemanticRed100),
  counterText: '',
  fillColor: Colors.white,
  filled: true,
);

final decorContainerBox = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  boxShadow: boxShadow,
  color: colorWhite,
);

final boxShadow = [
  BoxShadow(
    color: colorBlack.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 10,
    offset: Offset(0, 0),
  ),
];

final boxShadowFocus = [
  BoxShadow(
    color: colorBlack.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 40,
    offset: Offset(0, 10),
  ),
];

final boxShadowFocusTextField = [
  BoxShadow(
    color: colorBlack.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 10,
    offset: Offset(0, 0),
  ),
];
