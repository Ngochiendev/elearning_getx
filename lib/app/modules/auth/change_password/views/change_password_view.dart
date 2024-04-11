import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_text_form_field.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          LocaleKeys.general_changePassword.tr,
          style: typoBold24,
        ),
        centerTitle: true,

      ),
      body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(  
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24,),
                          child: Row(
                            children: [
                              Text(
                                "Mật khẩu cũ",
                                style: typoRegular14,
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          ()=> Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                            child: AppTextFormField(
                              controller: controller.passwordCtrl,

                              onChanged: (value) {
                                controller.onChangeValue();
                              },
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.setIsSecureOldPassword(
                                      !controller.isSecureOldPassword.value);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    controller.isSecureOldPassword.value
                                        ? R.ASSETS_SVG_ICL_HIDE_SVG:
                                        R.ASSETS_SVG_ICL_SHOW_SVG,
                                    color: colorNeutralGray80,
                                  ),
                                ),
                              ),
                              hintText: LocaleKeys.signin_password.tr,
                              obscureText: controller.isSecureOldPassword.value,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24,),
                          child: Row(
                            children: [
                              Text(
                                "Mật khẩu mới",
                                style: typoRegular14,
                              ),
                            ],
                          ),
                        ),
                        Obx(
                              ()=>Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                            child: AppTextFormField(
                              controller: controller.newPasswordCtrl,

                              onChanged: (value) {
                                controller.onChangeValue();
                              },
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.setIsSecureNewPassword(
                                      !controller.isSecureNewPassword.value);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    controller.isSecureNewPassword.value
                                        ? R.ASSETS_SVG_ICL_HIDE_SVG:
                                    R.ASSETS_SVG_ICL_SHOW_SVG,
                                    color: colorNeutralGray80,
                                  ),
                                ),
                              ),
                              hintText: LocaleKeys.label_passwordnew.tr,
                              obscureText: controller.isSecureNewPassword.value,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24,),
                          child: Row(
                            children: [
                              Text(
                                "Nhập lại mật khẩu mới",
                                style: typoRegular14,
                              ),
                            ],
                          ),
                        ),
                        Obx(
                              ()=> Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                            child: AppTextFormField(
                              controller: controller.conFimPasswordCtrl,

                              onChanged: (value) {
                                controller.onChangeValue();
                              },
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.setIsSecureConFirmPassword(
                                      !controller.isSecureConFirmPassword.value);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    controller.isSecureConFirmPassword.value
                                        ? R.ASSETS_SVG_ICL_HIDE_SVG:
                                    R.ASSETS_SVG_ICL_SHOW_SVG,
                                    color: colorNeutralGray80,
                                  ),
                                ),
                              ),
                              hintText: LocaleKeys.label_printpasswordnew.tr,
                              obscureText: controller.isSecureConFirmPassword.value,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(

                      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 32),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.FORGOT_PASS);
                      },
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.general_forgotPassword.tr,
                            style: typoRegular14NoSpacing.copyWith(
                                color: colorNeutralGray80,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    )
                    ),
                    SizedBox(height: 200,),

                  ],
                ),
              ),
            ),
            Obx(
                  ()=>Padding(
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 40),
                child: AppElevatedButton(
                  buttonTitle: "Lưu",
                  onPressed: () {
                    controller.changePass();

                  },
                  state: controller.changePasswordButtonState.value,
                ),
              ),
            )
          ],
        
      ),
    );
  }
}
