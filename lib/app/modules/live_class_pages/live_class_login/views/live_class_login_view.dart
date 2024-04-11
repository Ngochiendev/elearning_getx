import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_text_field.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/live_class_login_controller.dart';

class LiveClassLoginView extends GetView<LiveClassLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: colorBlack,
            onPressed: () {
              // Get.find<LiveClassService>().disconnectSocket();
              Get.back();
            }),
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(R.ASSETS_SVG_IC_LOGOLIVECLASS_SVG),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 32),
                    child: Text(
                      "Nhập ID lớp học",
                      style: typoRegular14,
                    ),
                  ),
                  BaseTextField(
                    onChanged: (value) {
                      controller.onChangeValue();
                    },
                    controller: controller.idTextField,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    hintText: "ID lớp học",
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Text(
                      "Tham gia bằng tài khoản",
                      style: typoRegular14,
                    ),
                  ),
                  Obx(
                    () => ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        child: controller.isTeacher.value == false
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: controller.userCurrent.value.attributes?.avatar == "" ||
                                        controller.userCurrent.value.attributes?.avatar == null
                                    ? SvgPicture.asset(R.ASSETS_SVG_AVATAR_DEFAULT_SVG)
                                    : AppNetworkImage(
                                        source: "$baseUrlImage${controller.userCurrent.value.attributes?.avatar}",
                                        fit: BoxFit.cover,
                                      ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: controller.teachCurrent.value.attributes?.avatar == ""
                                    ? SvgPicture.asset(R.ASSETS_SVG_AVATAR_DEFAULT_SVG)
                                    : AppNetworkImage(
                                        source: "$baseUrlImage${controller.teachCurrent.value.attributes?.avatar}",
                                        fit: BoxFit.cover,
                                      ),
                              ),
                      ),
                      title: controller.isTeacher.value == false
                          ? Text(
                              "${controller.userCurrent.value.firstName ?? ""}" +
                                  " ${controller.userCurrent.value.lastName ?? ""}",
                              style: typoBold16,
                            )
                          : Text(
                              "${controller.teachCurrent.value.firstName ?? ""}" +
                                  " ${controller.teachCurrent.value.lastName ?? ""}",
                              style: typoBold16,
                            ),
                      subtitle: controller.isTeacher.value == false
                          ? Text(
                              "${controller.userCurrent.value.email ?? ""}",
                              style: typoRegular14,
                            )
                          : Text(
                              "${controller.teachCurrent.value.email ?? ""}",
                              style: typoRegular14,
                            ),
                    ),
                  ),
                  Obx(() => Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: ElevatedButtonBase(
                          state: controller.buttonState.value,
                          height: 50,
                          size: 16,
                          buttonTitle: "Tham gia",
                          onPressed: () async {
                            await controller.onJoin();
                          },
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tùy chọn tham gia",
                        style: typoBold16,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Tắt Mic",
                      //       style: typoRegular16,
                      //     ),
                      //     SizedBox(
                      //       width: 16,
                      //     ),
                      //     Switch(
                      //         // inactiveTrackColor: colorWhite,
                      //         // inactiveThumbColor: colorABGray,
                      //         // activeTrackColor: colorWhite,
                      //         // activeColor: colorSemanticGreen100,
                      //         value: false,
                      //         onChanged: (value) {})
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tắt Camera",
                            style: typoRegular16,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Obx(() => Switch(
                              // inactiveTrackColor: colorWhite,
                              // inactiveThumbColor: colorABGray,
                              // activeTrackColor: colorWhite,
                              // activeColor: colorSemanticGreen100,
                              value: controller.isOnCamera.value,
                              onChanged: (value) {
                                controller.onTapCamera(value);
                              }))
                        ],
                      ),
                      SizedBox(
                        height: 48,
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
