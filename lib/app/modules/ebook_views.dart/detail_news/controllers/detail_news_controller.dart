import 'package:elearning/app/data/models/news_model.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailNewsController extends GetxController {
  //TODO: Implement DetailNewsController

  final count = 0.obs;
  final news = NewsModel().obs;
  final newss = List<NewsModel>.empty(growable: true).obs;
  var time = "".obs;
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    final id = Get.arguments ?? 0;
    await getdetailNews(id);
      await getlistNews();
  }

  @override
  void onClose() {}

detailNews(int? id) {
    Get.toNamed(Routes.DETAIL_NEWS, arguments: id ?? 0);
  }

 Future getlistNews() async {
    final response = await HomeProvider.instance.getListNew();
    if (response.error.isEmpty) {
      final list = <NewsModel>[];

      for (var item in response.data['data']['rows']) {
        list.add(NewsModel.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      newss.value = list.take(8).toList();
      update();
    }
  }

  Future getdetailNews(int id) async {
    final response = await HomeProvider.instance.getDetailNews(id);
    if (response.error.isEmpty) {
      news.value = NewsModel.fromJson(response.data['data']['news']);
      time.value = news.value.updatedAt ?? "";
      update();
    }
  }
}
