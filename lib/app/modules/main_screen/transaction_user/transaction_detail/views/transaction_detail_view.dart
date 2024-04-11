import 'dart:math';

import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/order_model.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/cart_views/cart_product/views/cart_product_view.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';

import '../controllers/transaction_detail_controller.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  final controllerCart = Get.find<CartProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Đơn ",
                style: typoBold24,
              ),
              Text(
                "DH${controller.id.value.toString().substring(controller.id.value.toString().length - 6)}",
                style: typoBold24Blue,
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {},
          //       child: SvgPicture.asset(R.ASSETS_SVG_IC_FILTER_BLACK_SVG,
          //           color: colorBlack),
          //     ),
          //     SizedBox(
          //       width: 16,
          //     )
          //   ],
          // )
        ],
      ),
      body: Obx(
        () => controller.oderItemDetail.value.id == null
            ? Container()
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${fullStringTimerFormat(DateTime.fromMillisecondsSinceEpoch(controller.oderItemDetail.value.orderDate!.toInt() * 1000).toString())} ngày ${fullStringTimeFormat(DateTime.fromMillisecondsSinceEpoch(controller.oderItemDetail.value.orderDate!.toInt() * 1000).toString())}",
                                  style: typoBold18,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Thanh toán bằng ${controller.oderItemDetail.value.payment!.paymentMethod!}",
                                  style: typoRegular14,
                                ),
                                Text(
                                  controller.oderItemDetail.value.orderStatus == "complete"
                                      ? "Thành Công"
                                      : controller.oderItemDetail.value.orderStatus == "pending"
                                          ? "CHờ xác nhận"
                                          : "Thất bại",
                                  style: typoRegular14,
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              height: 1,
                              decoration: BoxDecoration(
                                color: colorNeutralGray5,
                                boxShadow: boxShadow,
                              ),
                            ),
                            Obx(
                              () => ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.listDetail.length,
                                itemBuilder: (context, index) =>
                                    listItem(context, controller.listDetail[index], (package) async {}),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: boxShadow,
                      color: colorWhite,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    padding: EdgeInsets.all(16),
                    child: Obx(
                      () => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Khuyến mãi",
                                style: typoBold14,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  controller.orderDetailCoupe.value.comboDiscount!.length > 0
                                      ? Row(
                                          children: [
                                            Container(
                                                width: 69,
                                                height: 32,
                                                child: Stack(
                                                  children: [
                                                    SvgPicture.asset(R.ASSETS_SVG_SUBTRACTS_SVG),
                                                    Center(
                                                        child: Text(
                                                      "Mua ${controller.orderDetailCoupe.value.comboDiscount?.first.quantity ?? 0}",
                                                      style: typoRegular14.copyWith(color: colorPrimaryBlue100),
                                                    )),
                                                  ],
                                                )),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Container(
                                                width: 69,
                                                height: 32,
                                                child: Stack(
                                                  children: [
                                                    SvgPicture.asset(R.ASSETS_SVG_SUBTRACT_SVG),
                                                    Center(
                                                        child: Text(
                                                            "-${controller.orderDetailCoupe.value.comboDiscount?.first.discountPercentage ?? 0}%",
                                                            style: typoRegular14.copyWith(color: colorSemanticRed100))),
                                                  ],
                                                )),
                                          ],
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(vertical: 16),
                            height: 1,
                            decoration: BoxDecoration(
                              color: colorNeutralGray20,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Text(
                                        "Tổng cộng (${(controller.listDetail.length)})",
                                        style: typoRegular14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Obx(
                                      () => Text(
                                        controller.oderItemDetail.value.id != null
                                            ? "${numberFormat((controller.oderItemDetail.value.finalAmount ?? 0))} đ"
                                            : "${numberFormat((controllerCart.cartCource.value.totalAmount ?? 0) + (controllerCart.cartBook.value.totalAmount ?? 0))} đ",
                                        style: typoBold20.copyWith(color: colorSemanticRed100),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  child: controller.oderItemDetail.value.orderStatus == "complete"
                                      ? Container(
                                          height: 40,
                                          width: 92,
                                          child: Center(
                                              child: Text(
                                            "Thành công",
                                            style: TextStyle(color: colorSemanticGreen100),
                                          )),
                                          //color: Colors.redAccent,
                                          decoration: BoxDecoration(
                                            color: colorSemanticGreen20,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          //onPressed: controllerCart.orderCart,
                                        )
                                      : Container(
                                          height: 40,
                                          width: 92,
                                          child: Center(
                                              child: Text(
                                            "Thất bại",
                                            style: TextStyle(color: colorSemanticRed100),
                                          )),
                                          //color: Colors.redAccent,
                                          decoration: BoxDecoration(
                                            color: colorSemanticRed20,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          //onPressed: controllerCart.orderCart,
                                        )),
                            ],
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

  listItem(BuildContext context, OrderItem item, void Function(InforProduct package) onSelectPackage) {
    final controller = Get.find<CartProductController>();
    // final packagesCource = item.inforProduct?.course?.purchasePackages ?? [];
    // final packagesBook = item.inforProduct?.book?.purchasePackages ?? [];
    return Container(
      padding: EdgeInsets.all(16),
      child: Wrap(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack(
              //   children: [
              Container(
                width: 120,
                height: item.inforProduct?.course != null ? 70 : 165,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(item.inforProduct?.course != null ? 8 : 0),
                  child: AppNetworkImage(
                    source: item.inforProduct?.course != null
                        ? item.inforProduct?.course?.avatar ?? ""
                        : item.inforProduct?.book?.cover ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.inforProduct?.course != null
                        ? item.inforProduct?.course?.title ?? ""
                        : item.inforProduct?.book?.title ?? "",
                    style: typoBold14,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        (item.unitDiscount ?? 0) > 0 ? "${numberFormat(item.unitDiscount ?? 0)} đ" : "",
                        style: typoRegular12.copyWith(decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: (item.totalDiscount ?? 0) > 0 ? 8 : 0,
                      ),
                      Text(
                        "${numberFormat(item.unitPrice ?? 0)} đ",
                        style: typoBold14.copyWith(color: colorSemanticRed100),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Visibility(
                    // visible: packagesCource.length > 0,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: colorNeutralGray5,
                              border: Border.all(width: 1, color: colorNeutralGray20),
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${item.inforProduct?.duration ?? 0} tháng"),
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          // onTap: () {
                          //   controller.deleteItem(item);
                          // },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: colorSemanticBlue20,
                                  border: Border.all(width: 1, color: colorNeutralGray5),
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(R.ASSETS_SVG_MYEYE_SVG)),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
        ],
      ),
    );
  }
}
