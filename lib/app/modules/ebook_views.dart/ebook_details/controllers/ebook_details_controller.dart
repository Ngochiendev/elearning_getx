import 'dart:convert';

import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/book_models/authors_model.dart';
import 'package:elearning/app/data/models/book_models/book_detail_model.dart';
import 'package:elearning/app/data/models/book_models/information_model.dart';
import 'package:elearning/app/data/models/book_models/list_books_model.dart';
import 'package:elearning/app/data/models/book_models/rating_book_model.dart';
import 'package:elearning/app/data/models/book_models/specify_categories_model.dart';
import 'package:elearning/app/data/models/cart_model.dart';
import 'package:elearning/app/data/models/document_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class EbookDetailsController extends GetxController
    with SingleGetTickerProviderMixin {
  //TODO: Implement EbookDetailsController
  var tabCtrl;
  final bookDetailModel = EbookDetailsModel().obs;
  final author = AuthorModel().obs;
  final tableContent = [].obs;
  final questionContent = List<AskedQuestions>.empty(growable: true).obs;
  final name = "Toan hoc 2".obs;
  final listTableCategory = ["Mục lục", "Tài liệu", "Câu hỏi", "Thông tin"];
  final itemSelected = 0.obs;
  final informations = List<InformationBookModel>.empty(growable: true).obs;
  final listType = [].obs;
  final purchasePackages = List<InforProduct>.empty(growable: true).obs;
  final listBooks = List<ListBooksModel>.empty(growable: true).obs;
  final listAuthor = List<AuthorModel>.empty(growable: true).obs;
  final ratingModel = RatingBookModel().obs;
  final myRating = List<Rating>.empty(growable: true).obs;
  final listRating = List<Rating>.empty(growable: true).obs;
  final purchase = InforProduct().obs;
  final documents = List<DocumentsModel>.empty(growable: true).obs;
  PageController? pageController;
  final count = 0.obs;
  final indicator = 0.obs;
  final indicatorAuthor = 0.obs;
  final isNewSort = true.obs;
  final rating = 0.obs;
  final idUser = "".obs;
  final box = GetStorage();
  final cartController = Get.find<CartProductController>();
  final specifyCategoryRefs =
      List<SpecifyCategoriesModel>.empty(growable: true).obs;
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  final showMore = false.obs;
  get commentCtrl => null;

  @override
  void onInit() {
    super.onInit();
    tabCtrl = TabController(vsync: this, length: 2);
    pageController = PageController();
    final value = box.read<String>(StorageBox.IdUser);

    if (value != null) {
      idUser.value = value;
      print("useModel$value");
    }
  }

  @override
  void onReady() async {
    super.onReady();
    final id = Get.arguments?['id'] ?? 0;
    await getDetailBook(id.toString());
    await getRatingBook(id);
  }

  @override
  void onClose() {}

  ontapShowMore(bool tap) {
    showMore.value = !tap;
  }

  onTapItem(int index) {
    itemSelected.value = index;
  }

  void nextScreen(int id) {
    Get.toNamed(Routes.EBOOK_DETAILS, arguments: id);
  }

  setPurchasePackage(InforProduct index) {
    purchase.value = index;
  }

  tapSemore(String? name) async {
    // Get.until((route) => route.isFirst);
    await Get.toNamed(Routes.DETAIL_CATEGORY_BOOK,
        arguments: {"isTitle": name});
    update();
  }

  void onchange(int page) {
    indicator.value = page;
    update();
  }

  void onchangeAuthor(int page) {
    indicatorAuthor.value = page;
    update();
  }

  void sortList(bool isNew) {
    isNewSort.value = isNew;
    if (isNewSort.value) {
      listRating.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    } else {
      listRating.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    }
  }

  void selectRate(int rate) {
    rating.value = rate;
    if (rating.value == 5) {
      listRating.value =
          ratingModel.value.data!.ratings!.where((e) => e.rating == 5).toList();
      print(rating.value);
    } else if (rating.value == 4) {
      listRating.value =
          ratingModel.value.data!.ratings!.where((e) => e.rating == 4).toList();
      print(4);
    } else if (rating.value == 3) {
      listRating.value =
          ratingModel.value.data!.ratings!.where((e) => e.rating == 3).toList();
      print(3);
    } else if (rating.value == 2) {
      listRating.value =
          ratingModel.value.data!.ratings!.where((e) => e.rating == 2).toList();
      print(2);
    } else if (rating.value == 1) {
      listRating.value =
          ratingModel.value.data!.ratings!.where((e) => e.rating == 1).toList();
      print(1);
    } else if (rating.value == 0) {
      listRating.value = ratingModel.value.data!.ratings!;
      print(listRating.length);
    }
    update();
  }

  Future getDetailBook(String id) async {
    final response = await BookProvider.instance.getDetailBook(id);
    if (response.error.isEmpty) {
      bookDetailModel.value =
          EbookDetailsModel.fromJson(response.data['data']['book']);
      final categorieList = bookDetailModel.value.categories;
      if (categorieList != null && categorieList.length > 0) {
        listType.value =
            categorieList.where((e) => e.id != null).map((e) => e.id).toList();
        await getlistBookSameKind(null, null, "DESC", null, listType, null);
      }

      final authors = bookDetailModel.value.authorRefs;
      final table = bookDetailModel.value.tableOfContent;
      final listDocs = bookDetailModel.value.documents;
      final listQuestion = bookDetailModel.value.askedQuestion;
      final infors = bookDetailModel.value.information;
      final listPackages = bookDetailModel.value.bookPackages;
      final listCate = bookDetailModel.value.specifyCategoryRefs;
      print("specifyCategoryRefs.length ${listCate?.length}");
      if (listPackages != null && listPackages.length > 0) {
        purchasePackages.value = listPackages;
        setPurchasePackage(purchasePackages.first);
      }
      if (infors != null && infors.length > 0) {
        informations.value = infors;
      }
      if (listCate != null && listCate.length > 0) {
        specifyCategoryRefs.value = listCate;
        print("specifyCategoryRefs.length ${specifyCategoryRefs.length}");
      }
      if (listDocs != null && listDocs.length > 0) {
        documents.value = listDocs;
      }
      if (authors != null && authors.length > 0) {
        author.value = authors.first;
      }
      if (table != null && table.length > 0) {
        tableContent.value = table;
      }
      if (listQuestion != null && listQuestion.length > 0) {
        questionContent.value = listQuestion;
      }
      update();
    }
  }

  Future getlistBookSameKind(
      String? freeword,
      String? sortBy,
      String? sortOrder,
      dynamic specifyCategoryIds,
      dynamic categoryIds,
      dynamic gradeIds,
      {int page = 1}) async {
    final response = await BookProvider.instance.getListBooksFilter(freeword,
        sortBy, sortOrder, specifyCategoryIds, categoryIds, gradeIds, page);
    if (response.error.isEmpty) {
      final list = <ListBooksModel>[];

      for (var item in response.data['data']['books']) {
        list.add(ListBooksModel.fromJson(item));
      }
      print(
          "jsonEncode(response.data['data']) ${jsonEncode(response.data['data'])}");
      listBooks.value = list;

      update();
    } else {
      return;
    }
  }

  Future getRatingBook(int idBook) async {
    final response = await BookProvider.instance.getRatingBook(idBook);
    if (response.error.isEmpty) {
      ratingModel.value = RatingBookModel.fromJson(response.data);
      listRating.value = ratingModel.value.data!.ratings!;
      final ratingUser =
          listRating.where((e) => e.userId!.contains(idUser.value));
      myRating.value = ratingUser.toList();
      Logger().d(myRating.length);
      update();
    } else {
      return;
    }
  }

  addToCart() async {
    // Logger().d(bookDetailModel.value.toJson());

    if (cartController.listCart
        .where((e) => e.inforProduct!.bookId
            .toString()
            .contains("${bookDetailModel.value.id}"))
        .isNotEmpty) {
      appSnackbar("Sản phẩm đã có trong giỏ hàng", type: SnackbarType.error);
    } else {
      final response =
          await BookProvider.instance.addCart("b_${purchase.value.id}", 1);
      if (response.error.isEmpty) {
        Get.toNamed(Routes.CART_PRODUCT);
        await cartController.getCartCourseInfo();
        await cartController.getCartBookInfo();
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
}
