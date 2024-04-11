import 'package:elearning/app/data/models/book_models/book_history_model.dart';
import 'package:elearning/app/data/models/order_model.dart';

import 'package:elearning/app/data/models/orders_detail_model.dart'as m;
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

class TransactionDetailController extends GetxController {
  //TODO: Implement TransactionDetailController

  final id = "".obs;
  final oderItemDetail = Order().obs;
  final orderDetailCoupe = m.OrderCourseHistory().obs;
  final listDetail = List<OrderItem>.empty(growable: true).obs;
  final orderItemBookDetail = UserBookHistory().obs;
  final listBookDetail = List<OrderItemss>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    id.value = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
    getProductDetail();
    getProductBookDetail();
  }

  @override
  void onClose() {}
  getProductDetail() async {
    final response = await UserProvider.instance.getOrderDetail(id.value);
    if (response.error.isEmpty) {
      print("detail${response.data['data']}");
      oderItemDetail.value = Order.fromJson(response.data['data']['order']);
      listDetail.value = oderItemDetail.value.orderItems!;
      print("detail${listDetail.length}");
      orderDetailCoupe.value = m.OrderCourseHistory.fromJson(response.data['data']['order']);

    }
  }

  getProductBookDetail() async {
    final response = await BookProvider.instance.getOrderBookDetail(id.value);
    if (response.error.isEmpty) {
      oderItemDetail.value = Order.fromJson(response.data['data']['order']);
      print("detail${response.data['data']}");
      orderItemBookDetail.value = UserBookHistory.fromJson(response.data['data']['order']);
      listDetail.value = oderItemDetail.value.orderItems!;
      print("detail${listDetail.length}");
      //orderDetailCoupe.value = m.OrderCourseHistory.fromJson(response.data['data']['order']);
      orderDetailCoupe.value = m.OrderCourseHistory.fromJson(response.data['data']['order']);


    }
  }

}
