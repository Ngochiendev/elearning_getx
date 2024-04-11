import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_expansion_tile.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/cart_payment_banking_controller.dart';

class CartPaymentBankingView extends GetView<CartPaymentBankingController> {
  final controlerCart = Get.find<CartProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Thanh toán',
            style: typoBold24,
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Obx(
          () => controller.isPaymentDone.value
              ? PaymentStatusDone()
              : controller.isPaymentError.value
                  ? PaymentStatusError()
                  : Stack(
                      children: [
                        Container(
                          child: SingleChildScrollView(
                            physics: new ClampingScrollPhysics(),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppExpansionTile(
                                    color: colorPrimaryBlue5,
                                    title: Text("Thông tin tài khoản",
                                        style: typoBold16),
                                    initiallyExpanded: true,
                                    children: [
                                      Column(
                                        children: [
                                          Divider(
                                            height: 1,
                                            color: Color(0xFFFBEBEB),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 16),
                                            child: Row(children: [
                                              Container(
                                                width: 64,
                                                height: 64,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                  child: Image.network(
                                                    "https://images.squarespace-cdn.com/content/v1/573e57871bbee0d6dea60fff/1551203818326-Y2YY9W2OHZT2R28UZ2UC/what-is-teacher-burnout.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 16),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Obx(
                                                    () => Text(
                                                      "${controller.user.value.firstName ?? ""} ${controller.user.value.lastName ?? ""}",
                                                      style: typoBold14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(R
                                                          .ASSETS_SVG_IC_WALLET_SVG),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Obx(
                                                        () => RichText(
                                                            text: TextSpan(
                                                                children: [
                                                              TextSpan(
                                                                  text:
                                                                      "Số dư:  ",
                                                                  style:
                                                                      typoRegular14),
                                                              TextSpan(
                                                                text:
                                                                    "${numberFormat(controller.balance.value)} đ",
                                                                style: typoBold16
                                                                    .copyWith(
                                                                        color:
                                                                            colorPrimaryBlue100),
                                                              ),
                                                            ])),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ))
                                            ]),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  AppExpansionTile(
                                    color: colorPrimaryBlue5,
                                    title: Text(
                                        "Đơn hàng (${(controller.cartCourse.cartItems?.length ?? 0) + (controller.cartBook.cartItems?.length ?? 0)})",
                                        style: typoBold16),
                                    initiallyExpanded: true,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: ([
                                          ...(controller.cartCourse.cartItems ??
                                              []),
                                          ...(controller.cartBook.cartItems ??
                                              [])
                                        ])
                                            .map(
                                              (e) => Text(
                                                "${e.inforProduct?.course?.title ?? e.inforProduct?.book?.title}",
                                                style: typoBold14,
                                                textAlign: TextAlign.left,
                                              ),
                                            )
                                            .toList(),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 16),
                                    child: Text("Chọn hình thức thanh toán",
                                        style: typoBold16),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.listPayment.length,
                                    itemBuilder: (context, item) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: colorNeutralGray20),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Obx(
                                        () => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 58,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: RadioListTile(
                                                      title: Text(controller
                                                                  .listPayment[
                                                              item]["label"] ??
                                                          ""),
                                                      value: item,
                                                      activeColor:
                                                          colorSemanticRed100,
                                                      groupValue: controller
                                                          .valueRadio.value,
                                                      onChanged: (itemIndex) =>
                                                          controller
                                                              .tapItemRadio(
                                                                  itemIndex),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16),
                                                    width: 40,
                                                    child: controller
                                                                    .listPayment[
                                                                item]["icon"] !=
                                                            null
                                                        ? Image.asset(controller
                                                                .listPayment[
                                                            item]["icon"]!)
                                                        : InkWell(),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Visibility(
                                              visible: item == 0 &&
                                                  controller.valueRadio.value ==
                                                      0,
                                              child: Divider(
                                                height: 1,
                                                color: colorNeutralGray20,
                                              ),
                                            ),
                                            Visibility(
                                              visible: item == 0 &&
                                                  controller.valueRadio.value ==
                                                      0,
                                              child: Padding(
                                                padding: EdgeInsets.all(16),
                                                child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "Số dư ví:  ",
                                                        style: typoRegular16),
                                                    TextSpan(
                                                      text:
                                                          "${numberFormat(controller.balance.value)} đ",
                                                      style: typoBold18,
                                                    ),
                                                  ]),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 120,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: boxShadow,
                              color: colorWhite,
                            ),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tổng cộng (${(controller.cartCourse.cartItems?.length ?? 0) + (controller.cartBook.cartItems?.length ?? 0)})",
                                      style: typoRegular14,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                        controlerCart.coupon.value.amount !=
                                                null
                                            ? "${numberFormat(((controlerCart.cartCource.value.totalAmount ?? 0) + (controlerCart.cartBook.value.totalAmount ?? 0) - controlerCart.coupon.value.amount!) <= 0 ? 0 : (controlerCart.cartCource.value.totalAmount ?? 0) + (controlerCart.cartBook.value.totalAmount ?? 0) - controlerCart.coupon.value.amount!)} đ"
                                            : "${numberFormat((controlerCart.cartCource.value.totalAmount ?? 0) + (controlerCart.cartBook.value.totalAmount ?? 0))} đ",
                                        style: typoBold24.copyWith(
                                            color: colorSemanticRed100)),
                                  ],
                                )),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                    child: Obx(
                                  () => ElevatedButtonBase(
                                    height: 40,
                                    size: 14,
                                    weight: FontWeight.w700,
                                    buttonTitle: "Thanh toán ngay",
                                    onPressed: controller.createOrder,
                                    state: controller.stateButton.value,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
        ));
  }

//Mọi thắc mắc vui lòng liên hệ Hotline:
// 1900 1551 hoặc email: smartschool@gmail.com
  Widget PaymentStatusDone() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(R.ASSETS_SVG_ORDER_DONE_SVG),
            SizedBox(
              height: 45,
            ),
            Text(
              "Thanh toán thành công !",
              style: typoBold14.copyWith(
                  color: colorSemanticGreen100, fontSize: 24),
            ),
            SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                text: 'Mọi thắc mắc vui lòng liên hệ Hotline:',
                style: typoRegular14,
                children: <TextSpan>[
                  TextSpan(text: '1900 1551', style: typoBold14),
                  TextSpan(text: ' hoặc email:', style: typoRegular14),
                  TextSpan(text: 'smartschool@gmail.com', style: typoBold14),
                ],
              ),
            ),
            SizedBox(
              height: 49,
            ),
            AppElevatedButton(
              onPressed: () {
                controller.onTabDone();
              },
              buttonTitle: "Học tập ngay !",
            )
          ]),
    );
  }

  Widget PaymentStatusError() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(R.ASSETS_SVG_EMPTY_SVG),
            SizedBox(
              height: 45,
            ),
            Text(
              "Thanh toán thất bại :(",
              style:
                  typoBold14.copyWith(color: colorSemanticRed100, fontSize: 24),
            ),
            SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                text: 'Mọi thắc mắc vui lòng liên hệ Hotline:',
                style: typoRegular14,
                children: <TextSpan>[
                  TextSpan(text: '1900 1551', style: typoBold14),
                  TextSpan(text: ' hoặc email:', style: typoRegular14),
                  TextSpan(text: 'smartschool@gmail.com', style: typoBold14),
                ],
              ),
            ),
            SizedBox(
              height: 49,
            ),
            AppElevatedButton(
              onPressed: () {
                controller.onTabReOder();
              },
              buttonTitle: "Thanh toán lại !",
            )
          ]),
    );
  }
}
