import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_text_form_field.dart';
import 'package:elearning/app/modules/main_screen/wallet_user/controllers/wallet_user_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RechargeQrCode extends GetView<WalletUserController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          LocaleKeys.label_rechargeQrCode.tr,
          style: typoBold24,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:41,bottom: 40),
                child: Text("Nhập mã code chúng tôi gửi vào điện thoại của bạn, hãy nhập vào đây để nhận tiền nạp:",style: typoItalic14,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: AppTextFormField(
                  onChanged: (value){
                    controller.onchange(value);
                  },
                  controller: controller.codeCtrl,
                  hintText: LocaleKeys.label_enterCode.tr,
                ),

              ),
              Obx(
                ()=> AppElevatedButton(
                  state: controller.buttonState.value,
                  onPressed: () {
                    controller.rechargeCodes();
                  },
                  buttonTitle: "Nạp Tiền",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
