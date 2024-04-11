import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/wallet_user_controller.dart';

class WalletUserView extends GetView<WalletUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          LocaleKeys.label_wallet.tr,
          style: typoBold24,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: colorBackgroundProfile,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SmartRefresher(
          controller: controller.refreshController!,
          header: WaterDropHeader(),
          footer: ClassicFooter(),
          enablePullDown: false,
          enablePullUp: true,
          onRefresh: () => print("onRefresh"),
          onLoading: () => controller.loaDing(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Số dư:",
                        style: typoRegular14,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Text(
                                  "${formatter.format(controller.walletUser.value)}",
                                  style: typoBold32,
                                ),
                              ),
                              Text(
                                LocaleKeys.general_moneyUnit.tr,
                                style: typoRegular16Blue,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                buildButton(
                    title: LocaleKeys.label_rechargeQrCode.tr,
                    icon: R.ASSETS_SVG_IC_QR_CODE_SVG,
                    tap: () {
                      Get.toNamed(Routes.RECHARGE_QRCODE);
                    }),
                buildButton(
                    title: LocaleKeys.label_rechargeVnPay.tr,
                    icon: R.ASSETS_SVG_IC_VNPAY_SVG,
                    tap: () {
                      Get.toNamed(Routes.VNPAY);
                    }),
                buildButton(
                    title: LocaleKeys.label_rechargeBank.tr,
                    icon: R.ASSETS_SVG_IC_BANKS_SVG,
                    tap: () {
                      Get.toNamed(Routes.BANK_VIEW);
                    },
                    show: false),
                SizedBox(
                  height: 16,
                ),
                Container(
                  color: colorWhite,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 24),
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.label_walletHistory.tr,
                              style: typoBold18,
                            ),
                          ],
                        ),
                      ),

                      Obx(() => ListView.builder(
                          itemCount: controller.listHistory.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return buildItemList(
                                title: "15/11/2021 lúc 14:04",
                                money:
                                    "${controller.listHistory[i].money ?? 0}",
                                icon: controller.listHistory[i].type ==
                                        "depositCode"
                                    ? R.ASSETS_SVG_IC_QR_CODE_SVG
                                    : R.ASSETS_SVG_IC_BANKS_SVG);
                          }))
                      // Obx(
                      //   () => Wrap(
                      //     children: controller.listHistory
                      //         .map((e) => buildItemList(
                      //             title: "15/11/2021 lúc 14:04",
                      //             money: "${e.money ?? 0}",
                      //             icon: e.type == "depositCode"
                      //                 ? R.ASSETS_SVG_IC_QR_CODE_SVG
                      //                 : R.ASSETS_SVG_IC_BANKS_SVG))
                      //         .toList(),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(
      {String? title,
      String? icon,
      bool show = true,
      GestureTapCallback? tap}) {
    return Container(
      color: colorWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: InkWell(
              onTap: tap,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(icon!),
                        SizedBox(
                          width: 10.2,
                        ),
                        Text(
                          title!,
                          style: typoRegular14,
                        )
                      ],
                    ),
                    SvgPicture.asset(R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG)
                  ],
                ),
              ),
            ),
          ),
          show
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget buildItemList(
      {String? title, String? money, bool show = true, String? icon}) {
    return Container(
      color: colorWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(icon!),
                        SizedBox(
                          width: 10.2,
                        ),
                        Text(
                          title!,
                          style: typoRegular14,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              money!,
                              style: typoRegular18.copyWith(
                                  color: colorSemanticBlue100),
                            ),
                            Text(
                              LocaleKeys.general_moneyUnit.tr,
                              style: typoRegular18.copyWith(
                                  color: colorSemanticBlue100, fontSize: 9),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          show
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
