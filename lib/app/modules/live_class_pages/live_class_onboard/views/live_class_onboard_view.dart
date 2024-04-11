import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:elearning/generated/resource.dart';
import '../controllers/live_class_onboard_controller.dart';

class LiveClassOnboardView extends GetView<LiveClassOnboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(R.ASSETS_SVG_IC_LOGOLIVECLASS_SVG),
              ),
              SizedBox(
                height: 32,
              ),
              Center(child: Image.asset(R.ASSETS_PNG_IC_MAINLIVECLASS_PNG)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  "Bắt đầu học tập",
                  style: typoBold18,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Bắt đầu tham gia một lớp học, Lưu ý, bạn cần có ID và mật khẩu phòng",
                    style: typoRegular16.copyWith(color: colorNeutralGray60),
                    textAlign: TextAlign.center,
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: ElevatedButtonBase(
                  height: 50,
                  size: 16,
                  buttonTitle: "Tham gia",
                  onPressed: () async {
                    Get.toNamed(Routes.LIVE_CLASS_REQUIRE_JOINCLASS);
                  },
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          )),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: boxShadow,
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 52,
                      child: ElevatedButton(
                        style: styleButtonWhiteBorder,
                        child: Text("Đăng Ký"),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButtonBase(
                      height: 50,
                      size: 14,
                      weight: FontWeight.w700,
                      buttonTitle: "Đăng nhập",
                      onPressed: () async {
                        // await controller.tapSubmit();
                      },
                    ),
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
