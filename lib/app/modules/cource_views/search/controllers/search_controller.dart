import 'package:elearning/app/data/models/category_course_model.dart';
import 'package:elearning/app/data/models/grade_model.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/search_service.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  FocusNode? focusNode;
  final listGrades = List<GradeModel>.empty(growable: true).obs;
  final listCategoryCourse = List<CategoryCourse>.empty(growable: true).obs;
  final searchService = SearchService();
  final searchTextField = TextEditingController();
  final isTypingSearch = false.obs;

  @override
  void onInit() async {
    super.onInit();
    setFocus();
    await getlistGrade();
    await getlistCategoriesCourse();
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
    focusNode?.addListener(
        () => print('focusNode updated: hasFocus: ${focusNode?.hasFocus}'));
    // FocusScope.of(Get.context!).requestFocus(focusNode);
  }

    tapSearchItem(String item) {
    Get.toNamed(Routes.RESULT_SEARCH, arguments: {"item": item});
  }

  tapSearchGrade(int grade) {
    Get.toNamed(Routes.RESULT_SEARCH, arguments: {"grade": grade});
  }
  tapSearchCate(int cate) {
    Get.toNamed(Routes.RESULT_SEARCH, arguments: {"categoryIds": cate});
  }

  tapSearchTeacher() {
    Get.toNamed(Routes.RESULT_SEARCH,arguments: {"teacher":"teacher"});
  }
  tapItemHistory() {
    Get.toNamed(Routes.RESULT_SEARCH, arguments: {
      "listCategoryCourse": listCategoryCourse.value,
      "listGrades": listGrades.value,
    });
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
    final response = await HomeProvider.instance.getListGrade();
    if (response.error.isEmpty) {
      final list = <GradeModel>[];

      for (var item in response.data['data']['grades']) {
        list.add(GradeModel.fromJson(item));
        print("item $item");
      }
      listGrades.value = list;
      Get.find<SearchService>().setCurrentGrade(listGrades.value);

      update();
    }
  }
}
