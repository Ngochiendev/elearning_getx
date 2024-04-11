
import 'package:elearning/app/data/models/book_models/book_history_model.dart';
import 'package:elearning/app/data/models/order_model.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionHistoryController extends GetxController {
  //TODO: Implement TransactionHistoryController
  final listOrderHistory = List<Order>.empty(growable: true).obs;
  final listOrderBookHistory = List<OrderBook>.empty(growable: true).obs;
  final point = 0.obs;
  final orderHistoryModel = OrderHistory().obs;
  final orderHistoryModelBook = UserBookHistory().obs;
  var tabCtrl;
  final tabIndex=0.obs;

  final count = 0.obs;
  @override
  void onInit() {

    super.onInit();
    print("init");

  }

  @override
  void onReady() async{
    super.onReady();
    print("onReady");
    await getListOrderCourse();
    await getListOrderBookHistory();
  }
  void onChangeTab(int index){
    tabIndex.value = index;
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  Future getListOrderCourse() async {
    final response=await UserProvider.instance.getListOrderCourse();
    if(response.error.isEmpty){
      orderHistoryModel.value=OrderHistory.fromJson(response.data);
      listOrderHistory.value=orderHistoryModel.value.data!.orders!;
      print(listOrderHistory.length);
    }else{
      listOrderHistory.value=[];
    }
  }
  Future getListOrderBookHistory () async {
    final response= await BookProvider.instance.getListOrderBook();
    if(response.error.isEmpty){
      orderHistoryModelBook.value=UserBookHistory.fromJson(response.data);
      listOrderBookHistory.value=orderHistoryModelBook.value.data!.orders!;
      print(listOrderHistory.length);
    }else{
      listOrderBookHistory.value=[];
      print("lấy api bị lỗi");
    }
  }

  void getOrderDetail()async{
    // final response=await UserProvider.instance.getOrderDetail(orderID);
    // if(response.error.isEmpty){
    //   orderHistoryModel.value=OrderHistory.fromJson(response.data);
    //   listOrderHistory.value=orderHistoryModel.value.data!.orders!;
    //   print(listOrderHistory.length);
    // }else{
    //   print("lỗi lấy dữ liệu");
    // }
  }

}
