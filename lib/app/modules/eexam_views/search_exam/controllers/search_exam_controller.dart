import 'package:elearning/app/data/models/book_models/cate_model.dart';
import 'package:elearning/app/data/models/book_models/specify_categories_model.dart';
import 'package:elearning/app/data/models/category_course_model.dart';
import 'package:elearning/app/data/models/grade_model.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/exam_provider.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchExamController extends GetxController {
  FocusNode? focusNode;
  final listGrades = List<GradeModel>.empty(growable: true).obs;
  final publishers = List<CateModel>.empty(growable: true).obs;
  //final listCategoryExam = ;
  final listSubjectBook = List<SpecifyCategoriesModel>.empty(growable: true).obs;
  final listCateBook = List<CateModel>.empty(growable: true).obs;
  final searchService = SearchService();
  final searchTextField = TextEditingController();
  final isTypingSearch = false.obs;
  final listCategoryCourse = List<CategoryCourse>.empty(growable: true).obs;

  @override
  void onInit() async {
    super.onInit();
    setFocus();
    await getlistGrade();
    await getlistCategoriesExam();
    await getlistCategoriesCourse();
    await getlistPublisher();
    await getlistSubjectBook();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setFocus() {
    focusNode = new FocusNode();
    focusNode?.addListener(() => print('focusNode updated: hasFocus: ${focusNode?.hasFocus}'));
    // FocusScope.of(Get.context!).requestFocus(focusNode);
  }

  tapSearchItem(String item) {
    print(item);
    Get.toNamed(Routes.RESULT_SEARCH_EXAM, arguments: {"item": item});
  }

  tapSearchCate(int cate) {
    Get.toNamed(Routes.RESULT_SEARCH_EXAM, arguments: {"categoryIds": cate});
  }

  tapSearchGrade(int grade) {
    print("grade;");
    Get.toNamed(Routes.RESULT_SEARCH_EXAM, arguments: {"grade": grade});
  }

  Future getlistSubjectBook() async {
    final response = await BookProvider.instance.getListSubjectBooks();
    if (response.error.isEmpty) {
      final list = <SpecifyCategoriesModel>[];

      for (var item in response.data['data']['specifyCategory']) {
        list.add(SpecifyCategoriesModel.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      listSubjectBook.value = list;
      Get.find<SearchService>().setListSubjectBook(listSubjectBook.value);

      update();
    }
  }

  Future getlistCategoriesExam() async {
    final response = await BookProvider.instance.getListCategory();
    if (response.error.isEmpty) {
      final list = <CateModel>[];

      for (var item in response.data['data']['categories']) {
        list.add(CateModel.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      listCateBook.value = list;
      //Get.find<SearchService>().setListCategorysExam(listCateExam.value);

      update();
    }
  }

  Future getlistCategoriesCourse() async {
    final response = await HomeProvider.instance.getListCategoryCourse();
    if (response.error.isEmpty) {
      final list = <CategoryCourse>[];

      for (var item in response.data['data']['categories']) {
        list.add(CategoryCourse.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      listCategoryCourse.value = list;
      Get.find<SearchService>().setListCategorys(listCategoryCourse.value);

      update();
    }
  }

  Future getlistGrade() async {
    final response = await ExamProvider.instance.getListGrade();
    if (response.error.isEmpty) {
      final list = <GradeModel>[];

      for (var item in response.data['data']['grades']) {
        list.add(GradeModel.fromJson(item));
      }
      listGrades.value = list;
      Get.find<SearchService>().setCurrentGrade(listGrades.value);

      update();
    }
  }

  Future getlistPublisher() async {
    final response = await BookProvider.instance.getListPublisher();
    if (response.error.isEmpty) {
      final list = <CateModel>[];

      for (var item in response.data['data']['specifyCategory']) {
        list.add(CateModel.fromJson(item));
      }
      publishers.value = list;
      Get.find<SearchService>().setAuthors(publishers.value);
      update();
    }
  }
}
