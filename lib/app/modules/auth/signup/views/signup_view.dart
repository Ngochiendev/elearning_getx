import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/components/app_text_form_field.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Obx(() => controller.nextStep.value
              ? secondRegister(context,controller)
              : firstRegister(context))),
    );
  }

  firstRegister(BuildContext context) => SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    16, MediaQuery.of(context).padding.top + 64, 16, 0),
                child: Image.asset(
                  R.ASSETS_PNG_IC_LOGO_SC_PNG,
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height / 5),
              SizedBox(height: 32),
              Text("Đăng ký", style: typoBold24),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: Text(
                  "Đăng ký tài khoản SmartSchool ngay hôm nay!",
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
                  hintText: LocaleKeys.signin_username.tr,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: AppTextFormField(
                  controller: controller.firstNameCtrl,
                  onChanged: (value) {},
                  hintText: LocaleKeys.signin_firstName.tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: AppTextFormField(
                  controller: controller.lastNameCtrl,
                  onChanged: (value) {},
                  hintText: LocaleKeys.signin_lastName.tr,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: AppTextFormField(
                  controller: controller.phoneNumberCtrl,
                  onChanged: (value) {},
                  hintText: LocaleKeys.signin_phoneNumber.tr,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
              ),
              SizedBox(height: 8),
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: AppElevatedButton(
                  onPressed: () {
                    controller.onNextStep();
                  },
                  buttonTitle: "Tiếp theo",
                  state: controller.nextStepButtonState.value,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bạn đã có tài khoản?", style: typoRegular16NoSpacing),
                  AppTextButton(
                    buttonTitle: "Đăng nhập",
                    color: colorNeutralGray40,
                    onPressed: () {
                      Get.offNamed(Routes.SIGNIN);
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
      );
  secondRegister(BuildContext context,SignupController controller) =>controller.nextOTP.value?SingleChildScrollView(
    child: Container(
      // height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                16, MediaQuery.of(context).padding.top + 64, 16, 0),
            child: Image.asset(
              R.ASSETS_PNG_IC_LOGO_SC_PNG,
            ),
          ),
          // SizedBox(height: MediaQuery.of(context).size.height / 5),

          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
            child: Text(
              "Vui lòng nhập mã OTP đã được gửi vào email của bạn để kích hoạt tài khoản",
              textAlign: TextAlign.center,
              style: typoRegular16NoSpacing.copyWith(
                  fontWeight: FontWeight.w100),
            ),
          ),
          SizedBox(height: 28),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: AppTextFormField(
              keyboardType: TextInputType.number,
              controller: controller.otpCtrl,
              onChanged: (value) {
                controller.onChangeOtpValue();
              },
              hintText: LocaleKeys.signin_enterOTP.tr,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Visibility(
                  child: AppElevatedButton(
                    onPressed: () {
                      controller.verifyOTP();
                    },
                    buttonTitle: "Gửi",
                    state: controller.submitOTPButtonState.value,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bạn đã có tài khoản?", style: typoRegular16NoSpacing),
              AppTextButton(
                buttonTitle: "Đăng nhập",
                color: colorNeutralGray40,
                onPressed: () {
                  Get.offNamed(Routes.SIGNIN);
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
  ): SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    16, MediaQuery.of(context).padding.top + 64, 16, 0),
                child: Image.asset(
                  R.ASSETS_PNG_IC_LOGO_SC_PNG,
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height / 5),

              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: Text(
                  "Hãy cho SmartSchool biết một số thông tin của bạn nhé, chúng tôi sẽ đưa ra các gợi ý phù hợp nhất cho bạn",
                  textAlign: TextAlign.center,
                  style: typoRegular16NoSpacing.copyWith(
                      fontWeight: FontWeight.w100),
                ),
              ),
              SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: AppTextFormField(
                  controller: controller.yourEmailCtrl,
                  onChanged: (value) {},
                  hintText: LocaleKeys.signin_myEmail.tr,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: AppTextFormField(
                  controller: controller.parentEmailCtrl,
                  onChanged: (value) {},
                  hintText: LocaleKeys.signin_parentEmail.tr,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: AppTextFormField(
                  controller: controller.provinceCtrl,
                  onChanged: (value) {},
                  readOnly: true,
                  hintText: LocaleKeys.signin_province.tr,
                  suffixIcon: InkWell(
                      onTap: () => showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                buildSelectCountry(context, controller),
                          ),
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: AppTextFormField(
                  controller: controller.schoolCtrl,
                  onChanged: (value) {},
                  // suffixIcon: InkWell(
                  //   onTap: () {
                  //     controller.setIsSecurePassword(
                  //         !controller.isSecurePassword.value);
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(12.0),
                  //     child: SvgPicture.asset(
                  //       controller.isSecurePassword.value
                  //           ? R.ASSETS_SVG_ICL_HIDE_SVG
                  //           : R.ASSETS_SVG_ICL_SHOW_SVG,
                  //       color: colorNeutralGray80,
                  //     ),
                  //   ),
                  // ),
                  hintText: LocaleKeys.signin_school.tr,
                  // obscureText: controller.isSecurePassword.value,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: AppTextFormField(
                  controller: controller.classCtrl,
                  onChanged: (value) {},
                  hintText: LocaleKeys.signin_class.tr,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Visibility(
                      child: AppElevatedButton(
                        onPressed: () {
                          controller.registerNewUser();
                        },
                        buttonTitle: "Đăng ký",
                        state: controller.signUpButtonState.value,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "Bằng việc đăng ký, bạn đã đồng ý với các ",
                          style: typoRegular14.copyWith(
                              color: colorNeutralGray90)),
                      TextSpan(
                          text: "Chính sách ",
                          style:
                              typoBold14.copyWith(color: colorPrimaryBlue100)),
                      TextSpan(
                          text: "&",
                          style: typoRegular14.copyWith(
                              color: colorNeutralGray90)),
                      TextSpan(
                          text: " Điều khoản",
                          style:
                              typoBold14.copyWith(color: colorPrimaryBlue100)),
                      TextSpan(
                          text: " của SmartSchool",
                          style: typoRegular14.copyWith(
                              color: colorNeutralGray90)),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bạn đã có tài khoản?", style: typoRegular16NoSpacing),
                  AppTextButton(
                    buttonTitle: "Đăng nhập",
                    color: colorNeutralGray40,
                    onPressed: () {
                      Get.offNamed(Routes.SIGNIN);
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
      );


  Widget buildSelectCountry(BuildContext context, SignupController controller) {
    // List<String> country = [
    //   'Thành phố Hà nội',
    //   'Tỉnh Hà Giang',
    //   'Tỉnh Cao Bằng',
    //   'Tỉnh Bắc Cạn',
    //   'Tỉnh Tuyên Quang',
    //   'Tỉnh Lào Cai',
    //   'Tỉnh Điện Biên',
    //   'Tỉnh Lai Châu',
    //   'Tỉnh Sơn La',
    //   'Tỉnh Yên Bái',
    //   'Tỉnh Hòa Bình',
    //   'Tỉnh Thái Nguyên',
    //   'Tỉnh Lạng Sơn ',
    //   'Tỉnh Quảng Ninh ',
    //   'Tỉnh Bắc Giang',
    //   'Tỉnh Phú Thọ ',
    //   'Tỉnh Vĩnh Phúc ',
    //   'Tỉnh Bắc Ninh',
    // ];

    return Material(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Container(),
        middle: Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color(0xFFE6E6E6),
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Row(
                children: [
                  Text("Chọn Tỉnh/Thành phố",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                showTrackOnHover: true,
                thickness: 5,
                radius: Radius.circular(30),
                child: ListView(
                  shrinkWrap: true,
                  controller: ModalScrollController.of(context),
                  children: ListTile.divideTiles(
                          tiles: List.generate(
                              controller.listProvince.length,
                              (index) => ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text( controller.listProvince[index].title!),
                                        controller.provinceCtrl.text ==
                                            controller.listProvince[index].title!
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(10))),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 15,
                                                  color: Colors.white,
                                                ))
                                            : Container()
                                      ],
                                    ),
                                    onTap: () {
                                      controller.onSelectCountry(controller.listProvince[index].title!,controller.listProvince[index].id!);
                                      Get.back();
                                    },
                                  )),
                          context: context,
                          color: Colors.grey).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
class ModelCity{
  final int? id;
  final String? name;
  ModelCity({this.id,this.name});
}