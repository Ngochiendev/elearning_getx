import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static final GlobalKey<State> _keyLoader = GlobalKey<State>();

  static Future<void> showLoadingDialog(BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              key: _keyLoader,
              backgroundColor: Colors.white,
              children: <Widget>[
                Center(
                  child: Column(children: [
                    CircularProgressIndicator(
                      backgroundColor: colorNeutralGray20,
                      valueColor: AlwaysStoppedAnimation<Color>(colorNeutralGray100),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Please Wait....',
                      style: typoRegular14,
                    )
                  ]),
                ),
              ],
            ),
          );
        });
  }

  static void hideLoadingDialog() {
    Future.delayed(const Duration(milliseconds: 200), () => Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop());
  }
}
