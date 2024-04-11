import 'package:elearning/app/modules/main_screen/wallet_user/controllers/wallet_user_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:elearning/generated/resource.dart';

import 'package:get/get.dart';

class BankView extends GetView<WalletUserController> {
  List<BankModel>listBank=[
    BankModel(nameBank: "VPBank (Việt Nam Thịnh Vượng)",bankAuthor: "DINH VAN B",bankNumber: "123 456 789",avt: R.ASSETS_PNG_IMAGE_5LOGO_BANK_PNG),
    BankModel(nameBank: "BIDV (Ngân hàng Thương mại cổ phần Đầu tư và Phát triển Việt Nam)",bankAuthor: "DINH VAN B",bankNumber: "123 456 789",avt: R.ASSETS_PNG_IMAGE_6LOGO_BANK_PNG),
  ];
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
          LocaleKeys.label_rechargeBank.tr,
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
              Wrap(
                children: listBank.map((e) =>buildBankInfor(context, e.avt!,e.nameBank!,e.bankAuthor!,e.bankNumber!) ).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBankInfor(BuildContext context, String icon,String name,String author,String number) {

    return Padding(
      padding: const EdgeInsets.only(top:24.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(icon), fit: BoxFit.fill)),
                ),
              ],
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                name,
                                style: typoBold14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 0),
                        child: Row(
                          children: [
                            Text(
                              "Số tài khoản: ",
                              style: typoRegular14,
                            ),
                            Text(
                              number,
                              style: typoBold16,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 0),
                        child: Row(
                          children: [
                            Text(
                              "Chủ tài khoản: ",
                              style: typoRegular14,
                            ),
                            Text(
                              author,
                              style: typoBold16,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 0),
                        child: Container(
                          height: 45,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Nội dung:",
                                    style: typoRegular14,
                                  ),
                                ],
                              ),
                              Flexible(
                                  child: Text(
                                " Mã Tài khoản + Số điện thoại",
                                style: typoBold16,
                              )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 0),
                        child: Row(
                          children: [
                            Flexible(
                                child: Text(
                              "\"Phụ huynh viết chính xác nội dung chuyển khoản để tiền tự động vào ví\"",
                              style: typoItalic14.copyWith(
                                  color: colorSecondaryRed100),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}

class BankModel{
  final String? nameBank;
  final String? bankAuthor;
  final String? bankNumber;
  final String? avt;
  BankModel({this.nameBank,this.bankNumber,this.bankAuthor,this.avt});


}