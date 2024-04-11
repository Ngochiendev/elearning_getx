import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_text_form_field.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Contacs extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: colorBackgroundProfile,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          "Thông tin liên hệ",
          style: typoBold24,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "SmartSchool",
                    style: typoBold14,
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  SvgPicture.asset(R.ASSETS_SVG_OPEN_SVG),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "infor@smartschool.edu.vn",
                    style: typoRegular14,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    R.ASSETS_SVG_PHONE_SVG,
                    color: colorBlack,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "0243.212.7168 - 0971.575.266",
                    style: typoRegular14,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    R.ASSETS_SVG_FACEBOOK_SVG,
                    color: colorBlack,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "facebook.com/smartschool.edu.vn",
                    style: typoRegular14,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    R.ASSETS_SVG_YOUTUBE_SVG,
                    color: colorBlack,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "youtube/smartschool.edu.vn",
                    style: typoRegular14,
                  ),
                ],
              ),
              SizedBox(
                height: 56,
              ),
              Text(
                "QUAN TÂM ĐẾN SMARTSCHOOL? CHÚNG TÔI SẼ LIÊN HỆ NGAY VỚI BẠN!",
                textAlign: TextAlign.center,
                style: typoBold18.copyWith(color: colorWarrning100),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: AppTextFormField(
                  // controller: controller.usernameCtrl,
                  onChanged: (value) {
                    // controller.onChangeValue();
                  },
                  hintText: "Email / Số điện thoại của bạn",
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppElevatedButton(
                  buttonTitle: "Đăng ký nhận tư vấn",
                  mainColor: colorWarrning100,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
