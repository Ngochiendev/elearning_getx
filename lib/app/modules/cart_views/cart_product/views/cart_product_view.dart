import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/book_models/book_detail_model.dart';
import 'package:elearning/app/data/models/cart_model.dart';
import 'package:elearning/app/modules/cart_views/cart_discount_code/components/discount_custom_paint.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/cart_product_controller.dart';

class CartProductView extends GetView<CartProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(R.ASSETS_SVG_IC_BACK_BLACK_SVG),
          ),
        ),
        backgroundColor: colorWhite,
        title: Text(
          'Giỏ hàng',
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            "Đơn hàng (${(controller.cartCource.value.cartItems?.length ?? 0) + (controller.cartBook.value.cartItems?.length ?? 0)})",
                            style: typoBold18,
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.coupon.value.amount != null
                                ? "${numberFormat(((controller.cartCource.value.totalAmount ?? 0) + (controller.cartBook.value.totalAmount ?? 0) - controller.coupon.value.amount!) <= 0 ? 0 : (controller.cartCource.value.totalAmount ?? 0) + (controller.cartBook.value.totalAmount ?? 0) - controller.coupon.value.amount!)} đ"
                                : "${numberFormat((controller.cartCource.value.totalAmount ?? 0) + (controller.cartBook.value.totalAmount ?? 0))} đ",
                            style: typoBold18.copyWith(color: colorSemanticRed100),
                          ),
                        ),
                      ],
                    ),
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
                      itemCount: controller.listCart.length,
                      itemBuilder: (context, index) => listItem(context, controller.listCart[index], (package) async {
                        // await controller.deleteItem(controller.listCart[index]);
                        await controller.addItem(package);
                      }),
                    ),
                  ),
                ],
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
                          controller.cartCource.value.combo != null
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
                                              "Mua ${controller.titleCombo.value}",
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
                                                child: Text("-${controller.discountCombo.value}%",
                                                    style: typoRegular14.copyWith(color: colorSemanticRed100))),
                                          ],
                                        )),
                                  ],
                                )
                              : Container(),
                          SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: controller.selectCoupon,
                            child: Row(
                              children: [
                                Obx(
                                  () => Text(
                                    controller.coupon.value.code ?? "Nhập hoặc chọn mã giảm giá",
                                    style: typoRegular12.copyWith(color: colorPrimaryBlue100),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(R.ASSETS_SVG_IC_NEXTRIGHT_SVG)
                              ],
                            ),
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
                                "Tổng cộng (${(controller.cartCource.value.cartItems?.length ?? 0) + (controller.cartBook.value.cartItems?.length ?? 0)})",
                                style: typoRegular14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => Text(
                                controller.coupon.value.amount != null
                                    ? "${numberFormat(((controller.cartCource.value.totalAmount ?? 0) + (controller.cartBook.value.totalAmount ?? 0) - controller.coupon.value.amount!) <= 0 ? 0 : (controller.cartCource.value.totalAmount ?? 0) + (controller.cartBook.value.totalAmount ?? 0) - controller.coupon.value.amount!)} đ"
                                    : "${numberFormat((controller.cartCource.value.totalAmount ?? 0) + (controller.cartBook.value.totalAmount ?? 0))} đ",
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
                          child: ElevatedButtonBase(
                        height: 40,
                        size: 14,
                        weight: FontWeight.w700,
                        buttonTitle: "Thanh toán ngay",
                        onPressed: controller.orderCart,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  listItem(BuildContext context, CartItem item, void Function(InforProduct package) onSelectPackage) {
    final packagesCource = item.inforProduct?.course?.purchasePackages ?? [];
    final packagesBook = item.inforProduct?.book?.purchasePackages ?? [];
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
                    source: item.inforProduct?.course?.avatar ?? item.inforProduct?.book?.cover ?? "",
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
                    item.inforProduct?.course?.title ?? item.inforProduct?.book?.title ?? "",
                    style: typoBold14,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: item.inforProduct?.course != null
                        ? Text(
                            "GV: ${item.inforProduct?.course?.teacher?.firstName ?? ""}",
                            style: typoRegular12,
                          )
                        : Container(),
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
                    visible: packagesCource.length > 0,
                    child: Row(
                      children: [
                        Expanded(
                          child: packagesCource.length > 0
                              ? InkWell(
                                  onTap: () {
                                    Get.bottomSheet(
                                      CoursePackageBottomSheet(
                                        course: item.inforProduct!.course!,
                                        selectPackage: (InforProduct package) {
                                          onSelectPackage(package);
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1, color: colorNeutralGray5),
                                        borderRadius: BorderRadius.all(Radius.circular(8))),
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${item.inforProduct?.duration} tháng"),
                                        Icon(Icons.arrow_drop_down),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            controller.deleteItem(item);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: colorNeutralGray5),
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(R.ASSETS_SVG_IC_TRASH_SVG)),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: item.inforProduct?.book != null,
                    child: Row(
                      children: [
                        Expanded(
                          child: packagesBook.length > 0
                              ? InkWell(
                                  onTap: () {
                                    Get.bottomSheet(
                                      BookPackageBottomSheet(
                                        book: item.inforProduct!.book!,
                                        selectPackage: (InforProduct package) {
                                          onSelectPackage(package);
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1, color: colorNeutralGray5),
                                        borderRadius: BorderRadius.all(Radius.circular(8))),
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${item.inforProduct?.duration} tháng"),
                                        Icon(Icons.arrow_drop_down),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            controller.deleteItem(item);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: colorNeutralGray5),
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              padding: EdgeInsets.all(8),
                              child: SvgPicture.asset(R.ASSETS_SVG_IC_TRASH_SVG)),
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

class CoursePackageBottomSheet extends StatelessWidget {
  const CoursePackageBottomSheet({
    required this.course,
    required this.selectPackage,
    Key? key,
  }) : super(key: key);
  final Course course;
  final void Function(InforProduct package) selectPackage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorContainerBox,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: decorContainerBox,
        child: Wrap(
          children: course.purchasePackages!
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    selectPackage(e);
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16, left: 8, right: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      color: colorPrimaryBlue5,
                    ),
                    child: Text(
                      '${e.duration} tháng',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class BookPackageBottomSheet extends StatelessWidget {
  const BookPackageBottomSheet({
    required this.book,
    required this.selectPackage,
    Key? key,
  }) : super(key: key);
  final Book book;
  final void Function(InforProduct package) selectPackage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorContainerBox,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: decorContainerBox,
        child: Wrap(
          children: book.purchasePackages!
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    selectPackage(e);
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16, left: 8, right: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      color: colorPrimaryBlue5,
                    ),
                    child: Text(
                      '${e.duration} tháng',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
