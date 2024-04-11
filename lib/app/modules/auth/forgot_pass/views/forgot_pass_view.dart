import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_text_form_field.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/forgot_pass_controller.dart';

class ForgotPassView extends GetView<ForgotPassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Obx(() => controller.nextStep.value ? secondForgot(context) : firstForgot(context))),
    );
  }

  firstForgot(BuildContext context) => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top, 16, 0),
                    child: Image.asset(
                      R.ASSETS_PNG_IC_LOGO_SC_PNG,
                    ),
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height / 5),
                  SizedBox(height: 32),
                  Text("Quên mật khẩu", style: typoBold24),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    child: Text(
                      "Để đặt lại mật khẩu, vui lòng nhập địa chỉ email của bạn",
                      textAlign: TextAlign.center,
                      style: typoRegular16NoSpacing,
                    ),
                  ),
                  SizedBox(height: 28),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: AppTextFormField(
                      controller: controller.usernameCtrl,
                      onChanged: (value) {
                        controller.onChangeValue();
                      },
                      hintText: LocaleKeys.label_email.tr,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: AppElevatedButton(
              onPressed: () {
                controller.forgotPassWord();
              },
              buttonTitle: "Gửi",
              state: controller.submitOTPButtonState.value,
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      );

  secondForgot(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top + 64, 16, 0),
                    child: Image.asset(
                      R.ASSETS_PNG_IC_LOGO_SC_PNG,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text("Đặt lại mật khẩu", style: typoBold24),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "OTP hết hạn sau",
                          textAlign: TextAlign.center,
                          style: typoRegular16NoSpacing,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Obx(
                          () => controller.showResend.value
                              ? GestureDetector(
                                  onTap: () {
                                    controller.forgotPassWord();
                                  },
                                  child: Text(
                                    "gửi lại",
                                    textAlign: TextAlign.center,
                                    style: typoRegular16NoSpacing,
                                  ),
                                )
                              : Countdown(
                                  countdownController: controller.countdownController!,
                                  builder: (_, Duration time) {
                                    return Text(
                                      '${time.inMinutes % 60}: ${time.inSeconds % 60}',
                                      style: typoRegular16Custom,
                                    );
                                  }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: AppTextFormField(
                      controller: controller.emailOtpCtrl,
                      onChanged: (value) {
                        controller.onChangeValue();
                      },
                      hintText: LocaleKeys.signin_otpemail.tr,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Obx(
                      () => AppTextFormField(
                        controller: controller.passwordCtrltwo,
                        onChanged: (value) {
                          controller.onChangePassValue();
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.onchangeSecurePass(!controller.securePass.value);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              controller.securePass.value ? R.ASSETS_SVG_ICL_HIDE_SVG : R.ASSETS_SVG_ICL_SHOW_SVG,
                              color: colorNeutralGray80,
                            ),
                          ),
                        ),
                        hintText: LocaleKeys.signin_newpassword.tr,
                        obscureText: controller.securePass.value,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Obx(
                      () => AppTextFormField(
                        controller: controller.passwordCtrlthree,
                        onChanged: (value) {
                          controller.onChangePassValue();
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.onchangeSecureConfPass(!controller.secureConfPass.value);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              controller.secureConfPass.value ? R.ASSETS_SVG_ICL_HIDE_SVG : R.ASSETS_SVG_ICL_SHOW_SVG,
                              color: colorNeutralGray80,
                            ),
                          ),
                        ),
                        hintText: LocaleKeys.signin_printnewpassword.tr,
                        obscureText: controller.secureConfPass.value,
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: controller.showError.value
                          ? Text(
                              "Mật khẩu nhập lại không khớp !",
                              style: typoRegular14Red,
                            )
                          : Container(),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
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
              child: AppElevatedButton(
                onPressed: () {
                  controller.newPassword();
                },
                buttonTitle: "Xác nhận",
                state: controller.submitForgotButtonState.value,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      );
}
