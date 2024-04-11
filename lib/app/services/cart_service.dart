import 'package:elearning/app/data/models/cart_model.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  var cart = CartClass();
  var cartBook = CartClass();

  setCarts(CartClass obj) {
    cart = obj;
  }

  setCartsBook(CartClass obj) {
    cartBook = obj;
  }
}
