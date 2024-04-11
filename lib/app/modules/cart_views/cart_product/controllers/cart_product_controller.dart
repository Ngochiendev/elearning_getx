import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/data/models/cart_model.dart';
import 'package:elearning/app/data/models/coupon_model.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/cart_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/cart_service.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CartProductController extends GetxController {
  final listCart = List<CartItem>.empty(growable: true).obs;
  final cartCource = CartClass().obs;
  final cartBook = CartClass().obs;
  final coupon = Coupon().obs;

  final titleCombo = 0.obs;
  final discountCombo = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    print("init cart");
    await getCartCourseInfo();
    await getCartBookInfo();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getCartCourseInfo() async {
    final response = await CartProvider.instance.getCarts();
    if (response.error.isEmpty) {
      cartCource.value = CartClass.fromJson(response.data["data"]["cart"]);
      final items = cartCource.value.cartItems;
      if (cartCource.value.combo != null) {
        titleCombo.value = cartCource.value.combo!.quantity!;
        discountCombo.value = cartCource.value.combo!.discountPercentage!;
      }
      if (items != null && items.length > 0) {
        listCart.value = [...items, ...(cartBook.value.cartItems ?? [])];
      } else {
        listCart.value = [...[], ...(cartBook.value.cartItems ?? [])];
      }
      Get.find<CartService>().setCarts(cartCource.value);
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

  getCartBookInfo() async {
    final response = await BookProvider.instance.getCarts();
    if (response.error.isEmpty) {
      cartBook.value = CartClass.fromJson(response.data["data"]["cart"]);
      final items = cartBook.value.cartItems;
      if (items != null && items.length > 0) {
        listCart.value = [...(cartCource.value.cartItems ?? []), ...items];
      } else {
        listCart.value = [...(cartCource.value.cartItems ?? []), ...[]];
      }
      Get.find<CartService>().setCartsBook(cartBook.value);
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

  selectCoupon() {
    Get.toNamed(Routes.CART_DISCOUNT_CODE);
  }

  setCouponCode(Coupon obj) {
    coupon.value = obj;
    print("amount ${numberFormat(coupon.value.amount!)}");
  }

  deleteItem(CartItem item) async {
    if (item.productId == null || item.productId == "") {
      return;
    }
    var response;
    if (item.productId!.contains("c")) {
      response = await CartProvider.instance.deleteCart([item.productId ?? ""]);
    } else {
      response = await BookProvider.instance.deleteCart([item.productId ?? ""]);
    }
    if (response.error.isEmpty) {
      await getCartCourseInfo();
      await getCartBookInfo();
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

  addItem(InforProduct package) async {
    String productId = "";
    var response;
    if ((package.bookId ?? 0) > 0) {
      productId = 'b_${package.id}';
      response = await BookProvider.instance.addCart(productId, 1);
    } else if ((package.courseId ?? 0) > 0) {
      productId = 'c_${package.id}';
      response = await CartProvider.instance.addCart(productId, 1);
    }
    if (response.error.isEmpty) {
      await getCartCourseInfo();
      await getCartBookInfo();
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

  orderCart() async {
    final total = (cartCource.value.totalAmount ?? 0) + (cartBook.value.totalAmount ?? 0) - (coupon.value.amount ?? 0);
    Get.toNamed(Routes.CART_PAYMENT_BANKING, arguments: {"couponCode": coupon.value.code});
  }
}
