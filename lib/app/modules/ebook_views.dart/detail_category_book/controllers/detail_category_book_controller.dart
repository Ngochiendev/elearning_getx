import 'package:elearning/app/data/models/book_models/book_category_ishomedisplayed.dart';
import 'package:elearning/app/data/models/book_models/book_model.dart';
import 'package:elearning/app/data/models/book_models/book_sale_model.dart';
import 'package:elearning/app/data/models/book_models/list_books_model.dart';
import 'package:elearning/app/data/models/course_model.dart';
import 'package:elearning/app/data/models/news_model.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook/controllers/ebook_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DetailCategoryBookController extends GetxController {
  //TODO: Implement DetailCategoryBookController

  final title = "".obs;
  final sortBy = "".obs;
  final sortOrder = "".obs;
  final isHightlight = false.obs;
  final isFree = false.obs;
  final listCourse = List<Course>.empty(growable: true).obs;
  final news = List<NewsModel>.empty(growable: true).obs;
  final book = DataHome().obs;
  final bookCategoryHome = BookCategoryIsHomeDisplayed().obs;
  final bookSaleModel = List<BookHome>.empty(growable: true).obs;
  final listBooks = List<BookHome>.empty(growable: true).obs;
  final listSubjectBookHome = List<BookHome>.empty(growable: true).obs;
  final listCategoryHome =
      List<BookCategoryIsHomeDisplayed>.empty(growable: true).obs;

  @override
  void onInit() async {
    super.onInit();
    await getlistCategory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getlistCategory() async {
    final t = Get.arguments["isTitle"] ?? "";

    switch (t) {
      case "Tin tức":
        title.value = t;
        await getlistNews();
        break;
      case "Sách khuyến mại":
        title.value = t;
        await getlistBook();
        break;
      case "Sách cùng loại":
        title.value = t;
        await getlistBook();
        break;
      case "Top yêu thích":
        await getlistBook();
        break;

      default:
        title.value = t;
        bookCategoryHome.value =
            Get.arguments["obj"] ?? BookCategoryIsHomeDisplayed();
        break;
    }
  }

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
      news.value = list;
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
      final list = <BookHome>[];

      for (var item in response.data['data']['books']) {
        list.add(BookHome.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      listBooks.value = list;

      update();
    } else {
      return;
    }
  }

  Future getlistBook() async {
    final response = await BookProvider.instance.getListBooksHomepage();
    if (response.error.isEmpty) {
      book.value = DataHome.fromJson(response.data['data']);
      if (title.value == "Sách khuyến mại") {
        final bookSale = book.value.bookSales;
        if (bookSale != null && bookSale.length > 0) {
          bookSaleModel.value = bookSale.toList();
        }
      } else if (Get.arguments["isTitle"] == "Top yêu thích") {
        title.value = Get.find<EbookController>().title.value;
        print("hhhhh $title");
        final bookSubject = book.value.bookSubjects;
        if (bookSubject != null && bookSubject.length > 0) {
          for (int i = 0;
              i <
                  bookSubject
                      .where((e) => e.cate!.name == title.value)
                      .toList()
                      .length;
              i++) {
            if (title.value == "Top yêu thích") {
              listSubjectBookHome.value = bookSubject
                  .where((e) => e.cate!.name == "Top yêu thích")
                  .toList()[i]
                  .bookRating!
                  .toList();
            } else {
              print("aaaaaaaaaaaaaaaa");
              listSubjectBookHome.value = bookSubject
                  .where((e) => e.cate!.name == title.value)
                  .toList()[i]
                  .bookSpecifyCategoryAttributes!
                  .toList();
              print(listSubjectBookHome.length);
            }
          }

          // for (int i = 0; i < bookSubject.length; i++) {
          //   listSubjectBookHome.value = bookSubject[i].bookRating ?? [];
          // }
        }
      } else {
        listCategoryHome.value = book.value.bookCategoryIsHomeDisplayed!;
      }

      update();
    } else {
      return;
    }
  }
}
