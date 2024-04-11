import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/liveclass_models/list_notification.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ActionDialog extends StatelessWidget {
  String name;
  String icon;
  String action;
  String time;
  ActionDialog({required this.name, required this.icon, required this.action, required this.time, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.start,
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      backgroundColor: colorWhite,
      content: GestureDetector(
        onTap: () {
          // Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        child: Container(
          height: 100,
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFCCFFFFFF), borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
                leading: Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: colorSemanticRed20, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: SvgPicture.asset(icon == "heart"
                      ? R.ASSETS_SVG_IC_REDHEART_SVG
                      : icon == "clap"
                          ? R.ASSETS_SVG_IC_CLAPPING_HANDS_SVG
                          : R.ASSETS_SVG_IC_HANDUP1_SVG),
                ),
                title: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: name, style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
                  TextSpan(text: " đã ", style: typoRegular12.copyWith(color: colorSecondaryNeutralWhite)),
                  TextSpan(text: action, style: typoBold12.copyWith(color: colorSecondaryNeutralWhite)),
                ])),
                trailing: Icon(Icons.cancel_sharp),
                subtitle: Text(time)),
          ),
        ),
      ),
    );
  }
}
