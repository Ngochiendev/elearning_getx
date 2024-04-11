import 'dart:io';

import 'package:elearning/app/data/models/appslide_model.dart';
import 'package:elearning/app/data/models/book_models/book_category_ishomedisplayed.dart';
import 'package:elearning/app/data/models/book_models/book_model.dart';
import 'package:elearning/app/data/models/book_models/book_sale_model.dart';
import 'package:elearning/app/data/models/book_models/specify_categories_model.dart';
import 'package:elearning/app/data/models/category_course_model.dart';
import 'package:elearning/app/data/models/course_model.dart';
import 'package:elearning/app/data/models/news_model.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/modules/ebook_views.dart/main_ebook/controllers/main_ebook_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/ebook_service.dart';
import 'package:elearning/app/services/search_service.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class EbookController extends GetxController {
  // final listBook = List<BookModel>.empty(growable: true).obs;
  final bookSaleModel = List<BookHome>.empty(growable: true).obs;
  final listSubjectBook = List<BookSubject>.empty(growable: true).obs;
  final listSubjectBookHome = List<BookHome>.empty(growable: true).obs;
  final listCateSubject = List<BookSubjectCate>.empty(growable: true).obs;
  final news = List<NewsModel>.empty(growable: true).obs;
  final listSlides = List<AppBanner>.empty(growable: true).obs;
  final appbanners = List<AppBanner>.empty(growable: true).obs;
  final bookCategoryHome =
      List<BookCategoryIsHomeDisplayed>.empty(growable: true).obs;
  final sliderIndex = 0.obs;
  final book = DataHome().obs;
  final nameBanner = "".obs;
  final listSubjectBook2 =
      List<SpecifyCategoriesModel>.empty(growable: true).obs;
  final title = "".obs;
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await getlistBook();
    await getlistSubjectBook();
    await getlistNews();

    // listSlides.value = await getlistAppSlide("appSlide");
    // appbanners.value = await getlistAppSlide("appBanner");
    if (appbanners.length > 0) {
      nameBanner.value = appbanners.first.source ?? "";
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSliderIndex(int inx) async {
    sliderIndex.value = inx;
    update();
    await Future.delayed(Duration(milliseconds: 300));
    update();
  }

  detailNews(int? id) {
    Get.toNamed(Routes.DETAIL_NEWS, arguments: id ?? 0);
  }

  Future getlistAppSlide(String type) async {
    final response = await HomeProvider.instance.getListAppSlide(type, true);
    if (response.error.isEmpty) {
      final list = <AppSlides>[];

      for (var item in response.data['data']['rows']) {
        list.add(AppSlides.fromJson(item));
      }
      var data = list.where((e) => !e.source!.contains(".mp4")).toList();
      update();

      return data;
    }
  }

  // detailNews(int? id) {
  //   Get.toNamed(Routes.DETAIL_NEWS, arguments: id ?? 0);
  // }

  Future getlistNews() async {
    final response = await HomeProvider.instance.getListNew();
    if (response.error.isEmpty) {
      final list = <NewsModel>[];

      for (var item in response.data['data']['rows']) {
        list.add(NewsModel.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      news.value = list.take(8).toList();
      update();
    }
  }

  selectCate(String tile) {
    title.value = tile;
    for (int i = 0;
        i < listSubjectBook.where((e) => e.cate!.name == tile).toList().length;
        i++) {
      if (tile == "Top yêu thích") {
        listSubjectBookHome.value = listSubjectBook
            .where((e) => e.cate!.name == "Top yêu thích")
            .toList()[i]
            .bookRating!;
      } else {
        listSubjectBookHome.value = listSubjectBook
            .where((e) => e.cate!.name == tile)
            .toList()[i]
            .bookSpecifyCategoryAttributes!;
      }
    }
  }

  Future getlistBook() async {
    appbanners.value = [];
    listSlides.value = [];
    final response = await BookProvider.instance.getListBooksHomepage();
    if (response.error.isEmpty) {
      book.value = DataHome.fromJson(response.data['data']);
      bookCategoryHome.value = book.value.bookCategoryIsHomeDisplayed!;
      final bookSubject = book.value.bookSubjects;
      final bookSale = book.value.bookSales;
      appbanners.value = book.value.banners!.appBanners!.toList();

      listSlides.value = book.value.banners!.appSlides!.toList();
      if (bookSale != null && bookSale.length > 0) {
        bookSaleModel.value = bookSale.take(8).toList();
      }
      if (bookSubject != null && bookSubject.length > 0) {
        listSubjectBook.value = bookSubject;
        for (int i = 0;
            i <
                listSubjectBook
                    .where((e) => e.cate!.name == "Top yêu thích")
                    .toList()
                    .length;
            i++) {
          listSubjectBookHome.value = listSubjectBook
              .where((e) => e.cate!.name == "Top yêu thích")
              .toList()[i]
              .bookRating!;
        }
        title.value = listSubjectBook.first.cate!.name!;
        update();
      }
    } else {
      return;
    }
  }

  onSelectService(e) {
    print(e["label"]);
  }

  tapSearch() {
    Get.find<MainEbookController>().changeTabIndex(1);
    // Get.toNamed(Routes.MAIN);
  }

  toNatiDetail(Course course) {
    print(course);
    Get.toNamed(Routes.READ_BOOK, arguments: course.id);
  }

  tapSemore(String? name) async {
    // Get.until((route) => route.isFirst);
    await Get.toNamed(Routes.DETAIL_CATEGORY_BOOK,
        arguments: {"isTitle": name});
    update();
  }

  Future getlistSubjectBook() async {
    final response = await BookProvider.instance.getListSubjectBooks();
    if (response.error.isEmpty) {
      final list = <SpecifyCategoriesModel>[];

      for (var item in response.data['data']['specifyCategory']) {
        list.add(SpecifyCategoriesModel.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      listSubjectBook2.value = list;
      Get.find<SearchService>().setListSubjectBook(listSubjectBook2.value);

      update();
    }
  }

  tapSemoreBookCategoryIsHomeDisplayed(
      BookCategoryIsHomeDisplayed? bookCategory) async {
    // Get.until((route) => route.isFirst);
    await Get.toNamed(Routes.DETAIL_CATEGORY_BOOK, arguments: {
      "isTitle": bookCategory!.cate!.name ?? "",
      "obj": bookCategory
    });
    update();
  }
}
