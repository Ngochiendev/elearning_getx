import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/components/app_text_form_field.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditProfile extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBackgroundProfile,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
            controller.getUserProfile();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(R.ASSETS_SVG_IC_BACK_BLACK_SVG),
          ),
        ),
        title: Text(
          "Chỉnh sửa thông tin",
          style: typoBold24,
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                color: colorWhite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => Container(
                          color: colorWhite,
                          height: 147,
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.file.value.path == ''
                                  ? controller.userModel.value.attributes
                                              ?.avatar !=
                                          ''
                                      ? CircleAvatar(
                                          radius: 50,
                                          backgroundImage: NetworkImage(
                                              "$baseUrlImage${controller.userModel.value.attributes?.avatar}"),
                                        )
                                      : SvgPicture.asset(
                                          R.ASSETS_SVG_AVATAR_DEFAULT_SVG,
                                          width: 90,
                                          height: 90,
                                        )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          FileImage(controller.file.value),
                                    ),
                              SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: () => showCupertinoModalBottomSheet(
                                  expand: false,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) =>
                                      buildSelectImage(context, controller),
                                ),
                                child: Container(
                                  width: size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        R.ASSETS_SVG_CAMERA_SVG,
                                        width: 32,
                                        height: 32,
                                      ),
                                      Text(
                                        "Đổi hình đại diện",
                                        style: typoRegular14,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_SVG_USER_SVG,
                                ),
                                Text(
                                  "${LocaleKeys.signin_firstName.tr} và Tên",
                                  style: typoRegular14,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 24, top: 8, bottom: 8, right: 8),
                                    child: AppTextFormField(
                                      controller: controller.firstNameCtrl,
                                      onChanged: (value) {
                                        // controller.onChangeValue();
                                      },
                                      hintText: LocaleKeys.signin_firstName.tr,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, top: 8, bottom: 8, right: 24),
                                    child: AppTextFormField(
                                      controller: controller.lastNameCtrl,
                                      onChanged: (value) {
                                        // controller.onChangeValue();
                                      },
                                      hintText: LocaleKeys.signin_lastName.tr,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_SVG_PHONE_SVG,
                                ),
                                Text(
                                  LocaleKeys.signin_phoneNumber.tr,
                                  style: typoRegular14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: AppTextFormField(
                              controller: controller.phoneCtrl,
                              onChanged: (value) {
                                // controller.onChangeValue();
                              },
                              hintText: LocaleKeys.signin_phoneNumber.tr,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_SVG_MAIL_SVG,
                                ),
                                Text(
                                  LocaleKeys.signin_myEmail.tr,
                                  style: typoRegular14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: AppTextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.yourEmailCtrl,
                              onChanged: (value) {
                                // controller.onChangeValue();
                              },
                              hintText: LocaleKeys.signin_myEmail.tr,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_SVG_MAIL_SVG,
                                ),
                                Text(
                                  LocaleKeys.signin_parentEmail.tr,
                                  style: typoRegular14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: AppTextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.parentEmailCtrl,
                              onChanged: (value) {
                                // controller.onChangeValue();
                              },
                              hintText: LocaleKeys.signin_parentEmail.tr,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_SVG_USER_SVG,
                                ),
                                Text(
                                  LocaleKeys.signin_province.tr,
                                  style: typoRegular14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: AppTextFormField(
                              controller: controller.provinceCtrl,
                              onChanged: (value) {
                                // controller.onChangeValue();
                              },
                              readOnly: true,
                              suffixIcon: InkWell(
                                  onTap: () => showCupertinoModalBottomSheet(
                                        expand: true,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) =>
                                            buildSelectCountry(
                                                context, controller),
                                      ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black,
                                  )),
                              hintText: LocaleKeys.signin_province.tr,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_SVG_USER_SVG,
                                ),
                                Text(
                                  LocaleKeys.signin_school.tr,
                                  style: typoRegular14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: AppTextFormField(
                              controller: controller.schoolCtrl,
                              onChanged: (value) {
                                // controller.onChangeValue();
                              },
                              hintText: LocaleKeys.signin_school.tr,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  R.ASSETS_SVG_USER_SVG,
                                ),
                                Text(
                                  LocaleKeys.signin_class.tr,
                                  style: typoRegular14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: AppTextFormField(
                              controller: controller.classCtrl,
                              onChanged: (value) {
                                // controller.onChangeValue();
                              },
                              hintText: LocaleKeys.signin_class.tr,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: colorWhite,
              height: 78,
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: colorWhite,
                      border: Border.all(
                        width: 1,
                        color: colorPrimaryBlue100,
                      ),
                    ),
                    child: AppTextButton(
                      buttonTitle: "Hủy",
                      onPressed: () {
                        Get.back();
                        controller.getUserProfile();
                      },
                      textStyle:
                          typoBold16.copyWith(color: colorPrimaryBlue100),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: colorPrimaryBlue100,
                    ),
                    child: AppTextButton(
                      buttonTitle: "Cập nhật",
                      onPressed: () {
                        controller.updateProfile();
                      },
                      textStyle: typoBold16.copyWith(color: colorWhite),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSelectCountry(
      BuildContext context, ProfileController controller) {
    List<String> country = [
      'Hà nội',
      'Ninh Bình',
      'Hồ Chí Minh',
      'Đà Nẵng',
      'Hà nội',
      'Hà nội',
    ];
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
                                      Text(controller
                                          .listProvince[index].title!),
                                      controller.provinceCtrl.text ==
                                              controller
                                                  .listProvince[index].title
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
                                    controller.onSelectCountry(
                                        controller.listProvince[index].title!,
                                        controller.listProvince[index].id!);
                                    Get.back();
                                  },
                                )),
                        context: context,
                        color: Colors.grey)
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildSelectImage(BuildContext context, ProfileController controller) {
    return Material(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Container(),
        middle: Container(
          height: 5,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Colors.grey,
          ),
        ),
      ),
      child: SafeArea(
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Get.back();
                controller.pickImageFormCamera();
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Row(
                  children: [
                    Text("Camera",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            InkWell(
              onTap: () {
                Get.back();
                controller.pickImage();
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Row(
                  children: [
                    Text("Bộ sưu tập",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    ));
  }
}
