import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/components/custom_tooltip.dart';
import 'package:elearning/app/modules/live_class_pages/live_class_home/controllers/live_class_home_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InforBottomSheet extends StatelessWidget {
  final controller = Get.find<LiveClassHomeController>();
  InforBottomSheet({
    Key? key,
    // required this.tapCopy1,
    // required this.tapCopy2,
  }) : super(key: key);

  // final void Function() tapCopy1;
  // final void Function() tapCopy2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorContainerBox,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: decorContainerBox,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      width: 72,
                      height: 5,
                      margin: EdgeInsets.only(top: 6, bottom: 16),
                      decoration: BoxDecoration(
                          color: colorNeutralGray40, borderRadius: BorderRadius.all(Radius.circular(2.5)))),
                ),
                Text(
                  "${controller.room.value.name ?? "Room"}" +
                      "_"
                          "${controller.room.value.id ?? 0}",
                  style: typoBold18,
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(
                  color: Color(0xFFE8E9EA),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        child: Text(
                          'ID Lớp',
                          style: typoBold16,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          "${controller.room.value.id ?? 0}",
                          style: typoRegular16,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(R.ASSETS_SVG_IC_COPYLIV_SVG),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: "${controller.room.value.id ?? 0}"));
                                appSnackbar("Copy thành công", type: SnackbarType.success);
                              },
                              child: Text(
                                'Copy',
                                style: typoRegular16.copyWith(color: colorSecondaryRed100),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Container(
                //         width: 90,
                //         child: Text(
                //           'Mật khẩu',
                //           style: typoBold16,
                //         ),
                //       ),
                //       SizedBox(
                //         width: 16,
                //       ),
                //       Expanded(
                //           child: Text(
                //         '123ert',
                //         style: typoRegular16,
                //       )),
                //       SizedBox(
                //         width: 16,
                //       ),
                //       Row(
                //         children: [
                //           SvgPicture.asset(R.ASSETS_SVG_IC_COPYLIV_SVG),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           GestureDetector(
                //               onTap: () {
                //                 Clipboard.setData(ClipboardData(text: "123ert"));
                //                 appSnackbar("Copy thành công", type: SnackbarType.success);
                //               },
                //               child: Text(
                //                 'Copy',
                //                 style: typoRegular16.copyWith(color: colorSecondaryRed100),
                //               )),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        child: Text(
                          'Giáo viên',
                          style: typoBold16,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          '${controller.room.value.nameTeacher??''}',
                          style: typoRegular16,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        child: Text(
                          'URL Link',
                          style: typoBold16,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          'https://elearning.flextech.asia/phong-hoc/${controller.room.value.nanoId ?? ""}',
                          style: typoRegular16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(R.ASSETS_SVG_IC_COPYLIV_SVG),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text:
                                        "https://elearning.flextech.asia/phong-hoc/${controller.room.value.nanoId ?? ""}"));
                                appSnackbar("Copy thành công", type: SnackbarType.success);
                              },
                              child: Text(
                                'Copy',
                                style: typoRegular16.copyWith(color: colorSecondaryRed100),
                              )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: boxShadow,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        // style: styleButtonBLueBorder.copyWith(
                        //   backgroundColor:
                        //       MaterialStateProperty.all<Color>(colorWhite),
                        //   textStyle: MaterialStateProperty.all<TextStyle>(
                        //     typoRegular14.copyWith(fontSize: 16),
                        //   ),
                        // ),
                        onPressed: () async {
                          Get.back();
                        },
                        child: Text(
                          "Đóng popup",
                          style: typoBold16,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
