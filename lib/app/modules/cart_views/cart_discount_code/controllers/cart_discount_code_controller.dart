import 'dart:ffi';

import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/data/models/coupon_model.dart';
import 'package:elearning/app/data/models/purchase_combo.dart';
import 'package:elearning/app/data/providers/cart_provider.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartDiscountCodeController extends GetxController {
  final couponTextCtrl = TextEditingController();
  var data;
  final coupons = List<Coupon>.empty(growable: true).obs;
  final listCombo=List<PurchaseComboElement>.empty(growable: true).obs;
  final comboModel=PurchaseCombo().obs;
  final couponMessage = "".obs;
  final couponCode = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
      getCombo();
    getListCoupon();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setCoupon(String text) {
    couponCode.value = text.trim();
    update();
  }

  void getCoupon() async {
    FocusScope.of(Get.context!).requestFocus(new FocusNode());

    final response = await CartProvider.instance.getCoupon(couponCode.value);
    if (response.error.isEmpty) {
      print(response.data['data']['couponCode'].length > 0);

      if (response.data['data']['couponCode'].length > 0) {
        final coupon = Coupon.fromJson(response.data['data']['couponCode'][0]);
        Get.find<CartProductController>().setCouponCode(coupon);
        Get.back();
      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) => couponTextCtrl.clear());
        couponMessage.value = "Mã giảm giá không tồn tại";
        update();
      }
    } else {
      couponMessage.value = response.error;
      update();
    }
  }
  void getCombo() async {
    FocusScope.of(Get.context!).requestFocus(new FocusNode());

    final response = await CartProvider.instance.getCombo();

    if (response.error.isEmpty) {
      comboModel.value=PurchaseCombo.fromJson(response.data);
      listCombo.value=comboModel.value.data!.purchaseCombo!;
    } else {
      listCombo.value=[];
      update();
    }
  }

  void getListCoupon() async {
    final response = await CartProvider.instance.getListCoupon();
    if (response.error.isEmpty) {
      List<Coupon> list = [];
      for (var item in response.data['data']['couponCode']) {
        list.add(Coupon.fromJson(item));
      }
      coupons.value = list;
      update();
    } else {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: response.error,
        ),
      );
    }
  }
}
