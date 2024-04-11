import 'package:elearning/app/modules/main_screen/wallet_user/controllers/wallet_user_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';

class VnPay extends GetView<WalletUserController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          LocaleKeys.label_rechargeVnPay.tr,
          style: typoRegular14.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 41, bottom: 40),
                child: Text(
                  "Sau khi chuyển tiền thành công vào 1 trong những tài khoản sau, hệ thống sẽ tự cập nhật số tiền của bạn vào Ví smartschool",
                  style: typoItalic14,
                ),
              ),
                Row(
                  children: [
                    Container(
                    width: 138,
                    height: 42,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(R.ASSETS_PNG_LOGO_PRIMARY_55E9C8C_1LOGO_VNPAY_PNG), fit: BoxFit.fill)),
              ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

}