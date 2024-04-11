import 'package:elearning/app/components/app_check_box.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/components/app_text_form_field.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
          body: GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        16, MediaQuery.of(context).padding.top + 64, 16, 0),
                    child: Image.asset(
                      R.ASSETS_PNG_IC_LOGO_SC_PNG,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 5),
                  Obx(
                        () => Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Học sinh",
                            style: typoRegular16NoSpacing.copyWith(
                                color: controller.isStudent.value == false
                                    ? colorPrimaryBrand100
                                    : colorNeutralGray80),
                          ),
                          Switch(
                            // inactiveTrackColor: colorWhite,
                            // inactiveThumbColor: colorABGray,
                            // activeTrackColor: colorWhite,
                            // activeColor: colorSemanticGreen100,
                              value: controller.isStudent.value,
                              onChanged: (value) {
                                controller.isStudent.value = value;
                              }),
                          Text(
                            "Giáo viên",
                            style: typoRegular16NoSpacing.copyWith(
                                color: controller.isStudent.value == false
                                    ? colorNeutralGray80
                                    : colorPrimaryBrand100),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: AppTextFormField(
                      controller: controller.usernameCtrl,
                      onChanged: (value) {
                        controller.onChangeValue();
                      },
                      hintText: LocaleKeys.signin_username.tr,
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(
                        () => Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: AppTextFormField(
                        controller: controller.passwordCtrl,
                        onChanged: (value) {
                          controller.onChangeValue();
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.setIsSecurePassword(
                                !controller.isSecurePassword.value);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              controller.isSecurePassword.value
                                  ? R.ASSETS_SVG_ICL_HIDE_SVG
                                  : R.ASSETS_SVG_ICL_SHOW_SVG,
                              color: colorNeutralGray80,
                            ),
                          ),
                        ),
                        hintText: LocaleKeys.signin_password.tr,
                        obscureText: controller.isSecurePassword.value,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Obx(
                        () => Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Visibility(
                            child: AppElevatedButton(
                              onPressed: () {
                                controller.isStudent == false
                                    ? controller.userLogin()
                                    : controller.teacherLogin();
                              },
                              buttonTitle: LocaleKeys.general_signIn.tr,
                              state: controller.buttonState.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    child: Row(
                      children: [
                        Obx(
                              () => AppCheckBox(
                            avatar: "",
                            value: controller.isSavePassword.value,
                            onChanged: controller.setIsSavePassword,
                            label: LocaleKeys.signin_rememberPass.tr,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.FORGOT_PASS);
                          },
                          child: Text(
                            LocaleKeys.general_forgotPassword.tr,
                            style: typoRegular16NoSpacing.copyWith(
                                color: colorNeutralGray80,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bạn chưa có tài khoản?",
                          style: typoRegular16NoSpacing),
                      AppTextButton(
                        buttonTitle: "Đăng ký",
                        color: colorNeutralGray40,
                        onPressed: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                        textStyle: typoBold16.copyWith(
                            decoration: TextDecoration.underline,
                            color: colorPrimaryBlue100),
                      ),
                      Text("ngay", style: typoRegular16NoSpacing),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom,
                  )
                ],
              ),
            ),
          ),);

  }
}
