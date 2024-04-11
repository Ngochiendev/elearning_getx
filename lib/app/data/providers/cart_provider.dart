import 'package:elearning/app/data/models/coupon_model.dart';
import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';

class CartProvider extends BaseProvider {
  static final CartProvider instance = CartProvider._internal();
  factory CartProvider() => instance;
  CartProvider._internal() {
    initProvider("BASE_API_COURSE");
  }

  Future<ApiResult> getCarts() async => await GET('u/carts');
  Future<ApiResult> addCart(String productId, int quantity) async => await POST('u/carts', {
        "product_id": productId,
        "quantity": quantity,
      });

  Future<ApiResult> deleteCart(List<String> productIds) async {
    return await DELETE('u/carts', {
      "product_ids": productIds,
    });
  }

  Future<ApiResult> getListCoupon() async => await GET('u/coupon_codes');
  Future<ApiResult> getCoupon(String code) async => await GET('u/coupon_codes?code=$code');
  Future<ApiResult> getCombo() async => await GET('u/purchase_combos');
}
