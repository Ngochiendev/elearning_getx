import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/modules/cart_views/cart_discount_code/components/discount_custom_paint.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:elearning/generated/resource.dart';
import '../controllers/cart_discount_code_controller.dart';

class CartDiscountCodeView extends GetView<CartDiscountCodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Mã giảm giá',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: controller.couponMessage.value.length > 0
                      ? colorSemanticRed100
                      : colorBorderViewSearch),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: TextField(
                      onChanged: (text) {
                        controller.setCoupon(text);
                      },
                      controller: controller.couponTextCtrl,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        // labelText: controller.textSearch.value,
                        hintText: "Nhập mã giảm giá",
                        hintStyle:
                            typoRegular14.copyWith(color: colorNeutralGray40),
                        border: InputBorder.none,
                      ),
                      onTap: () {
                        if (controller.couponMessage.value.length > 0) {
                          controller.couponMessage.value = "";
                          controller.update();
                        }
                      },
                    ),
                  ),
                ),
                InkWell(
                  onTap: controller.getCoupon,
                  child: Obx(
                    () => Container(
                      width: 130,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: controller.couponMessage.value.length == 0 &&
                                  controller.couponCode.value.length > 0
                              ? colorPrimaryBlue100
                              : colorNeutralGray40),
                      child: Text(
                        "Áp dụng",
                        style: typoBold14.copyWith(color: colorWhite),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.couponMessage.value.length > 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Text(
                  controller.couponMessage.value,
                  style: typoRegular14.copyWith(color: colorSemanticRed100),
                ),
              ),
            ),
          ),
          controller.listCombo.value.length==0?Container(): Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "Chương trình khuyến mại",
              style: typoBold18,
            ),
          ),
          Obx(
            () => Padding(  
              padding: const EdgeInsets.fromLTRB(16,0,16,0),
              child: Wrap(
                children: controller.listCombo
                    .map((e) => Row(
                          children: [
                            e.discountPercentage! >= 0 &&
                                    e.discountPercentage! <= 20
                                ? SvgPicture.asset(R.ASSETS_SVG_GIF1_SVG)
                                : e.discountPercentage! > 20 &&
                                        e.discountPercentage! <= 30
                                    ? SvgPicture.asset(R.ASSETS_SVG_GIF2_SVG)
                                    : SvgPicture.asset(R.ASSETS_SVG_GIF4_SVG),
                            SizedBox(
                              width: 15,
                            ),
                            Text(e.description!),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "Mã giảm giá",
              style: typoBold18,
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.coupons.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    controller.couponCode.value =
                        controller.coupons[index].code ?? "";
                    controller.update();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    height: 130,
                    child: Stack(
                      children: [
                        Obx(
                          () => CustomPaint(
                            size: Size(
                                MediaQuery.of(context).size.width - 32,
                                ((MediaQuery.of(context).size.width - 32) *
                                        0.37900874635568516)
                                    .toDouble()),
                            painter: DicountCustomPainter(
                                controller.couponCode.value ==
                                    controller.coupons[index].code),
                          ),
                        ),
                        Positioned(
                          left: 130,
                          top: 16,
                          child: Container(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.coupons[index].code ?? "",
                                  style: typoBold18.copyWith(
                                      color: colorSemanticRed100),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    controller.coupons[index].description ?? "",
                                    style: typoRegular12.copyWith(
                                        color: colorNeutralGray60),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.watch_later_outlined,
                                        color: colorSemanticRed100),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      fullStringTimeFormat(
                                          controller.coupons[index].appliedTo ??
                                              ""),
                                      style: typoRegular12.copyWith(
                                          color: colorSemanticRed100),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     ClipRect(
                    //       child: Container(
                    //           // padding: EdgeInsets.all(32),
                    //           width: 120,
                    //           height: 130,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(8),
                    //                   bottomLeft:
                    //                       Radius.circular(8)),
                    //               color: colorSemanticRed100),
                    //           child: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               CustomPaint(
                    //                 painter: CustomPaintNotch(),
                    //               ),
                    //               SvgPicture.asset(
                    //                   R.ASSETS_SVG_IC_STUDENT_SVG),
                    //               SizedBox()
                    //             ],
                    //           )),
                    //     ),
                    //   ],
                    // ),
                  ),
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
            height: 80,
            padding: EdgeInsets.all(16),
            child: ElevatedButtonBase(
              height: 40,
              size: 14,
              weight: FontWeight.w700,
              buttonTitle: "Áp dụng",
              onPressed: controller.getCoupon,
            ),
          ),
        ],
      ),
    );
  }
}
