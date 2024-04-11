import 'dart:math';

import 'package:elearning/app/data/models/course_model.dart';
import 'package:elearning/app/data/models/grade_model.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/search_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailCategoryProductController extends GetxController {
  //TODO: Implement DetailCategoryProductController

  final title = "".obs;
  final sortBy = "".obs;
  final sortOrder = "".obs;
  final isHightlight = false.obs;
  final isFree = false.obs;
  final isDiscount = false.obs;
  final listCourse = List<Course>.empty(growable: true).obs;
  final searchTextField = TextEditingController();
  final hasFilter = false.obs;
  final index = 0.obs;
  final min = true.obs;
  var nameClasses = [].obs;
  var listTeacher = [].obs;
  var listLengthVideo = [].obs;
  var listCategories = [].obs;
  var grades = List<GradeModel>.empty(growable: true).obs;
  var categorys = [].obs;
  final isSelect = "".obs;
  final fromvideo = ''.obs;
  final tovideo = ''.obs;
  final category = 0.obs;
  final videoLength = 0.obs;
  final grade = 0.obs;
  final selectedGrades = List<int>.empty(growable: true).obs;
  final selectedCategorys = List<int>.empty(growable: true).obs;
  final selectedVideoLengths = List<int>.empty(growable: true).obs;
  final pages = 1.obs;
  final list = List<Course>.empty(growable: true).obs;
  RefreshController? refreshController;
  ScrollController semicircleController = ScrollController();
  @override
  void onInit() async {
    super.onInit();
    title.value = Get.arguments["isTitle"] ?? "";
    sortBy.value = Get.arguments["isSortBy"] ?? "";
    sortOrder.value = Get.arguments["isSortOrder"] ?? "";
    isHightlight.value = Get.arguments["isHighlight"] ?? false;
    isFree.value = Get.arguments["isFree"] ?? false;
    isDiscount.value = Get.arguments["isDiscount"] ?? false;
    // listCourse.value = await getlistCourse(
    //     sortBy.value, sortOrder.value, isHightlight.value, isFree.value);
    categorys.value = Get.find<SearchService>().listcategorys.value;
    grades.value = Get.find<SearchService>().listGrades.value;
    searchTextField.text = Get.arguments["item"] ?? "";
    category.value = Get.arguments["categoryIds"] ?? 0;
    grade.value = Get.arguments["grade"] ?? 0;
    nameClasses.value = grades.take(4).toList();
    listCategories.value = categorys.take(4).toList();
    await getFilterCourse();
    refreshController = RefreshController(initialRefresh: false);
    setIconFilter();
    listLengthVideo.value = [
      "0-1 giờ",
      "1-3 giờ",
      "3-6 giờ",
      "6-17 giờ",
    ];
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  setIconFilter() {
    selectedGrades.length > 0 || selectedCategorys.length > 0
        ? hasFilter.value = true
        : hasFilter.value = false;
  }

  getFilterCourse({
    int page = 1,
    String sortBy = "createdAt",
  }) async {
    if (isHightlight.value == true) {
      await getlistCourse(
        null,
        sortBy,
        "DESC",
        isHightlight.value,
        isFree.value,
        isDiscount.value,
        selectedCategorys,
        selectedGrades,
        fromvideo,
        tovideo,
        page: page,
      );
      // await setListData(null, null, selectedGrades,"","");
    } else if (isFree.value == true) {
      await getlistCourse(
        null,
        sortBy,
        "DESC",
        isHightlight.value,
        isFree.value,
        isDiscount.value,
        selectedCategorys,
        selectedGrades,
        fromvideo,
        tovideo,
        page: page,
      );
    } else if (isDiscount.value == true) {
      await getlistCourse(
        null,
        "discountPercentage",
        "ASC",
        isHightlight.value,
        isFree.value,
        isDiscount.value,
        selectedCategorys,
        selectedGrades,
        fromvideo,
        tovideo,
        page: page,
      );
    } else {
      await getlistCourse(
        searchTextField.text,
        sortBy,
        "DESC",
        isHightlight.value,
        isFree.value,
        isDiscount.value,
        selectedGrades,
        selectedCategorys,
        fromvideo,
        tovideo,
        page: page,
      );
      // await setListData(searchTextField.text, null, null,'','');
    }
  }

  void toggleIssue(int id) {
    grade.value = id;
    print("grade ${grade.value}");
    if (selectedGrades.contains(grade.value)) {
      selectedGrades.remove(grade.value);
      print(selectedGrades.toString());
      if (selectedGrades.length == 0) {
        grade.value = 0;
      }
    } else {
      selectedGrades.add(grade.value);
      print(selectedGrades.toString());
    }

    setIconFilter();
    update();
  }

  void toggleTime(String name) {
    if (isSelect.contains(name)) {
      isSelect.value = "";
      fromvideo.value = "";
      tovideo.value = "";
    } else {
      isSelect.value = name;
    }

    setIconFilter();
    update();
  }

  tapSubmit() async {
    list.clear();
    listCourse.clear();
    print("selectedGrades.toString() ${selectedGrades.toString()}");
    final gradeObj = selectedGrades.length > 0 ? selectedGrades : null;

    final categoryObj = selectedCategorys.length > 0 ? selectedCategorys : null;

    switch (isSelect.value) {
      case "0-1 giờ":
        fromvideo.value = "0";
        tovideo.value = "3600";
        break;
      case "1-3 giờ":
        fromvideo.value = "3600";
        tovideo.value = "10800";
        break;
      case "3-6 giờ":
        fromvideo.value = "10800";
        tovideo.value = "21000";
        break;
      case "6-17 giờ":
        fromvideo.value = "21000";
        tovideo.value = "61200";
        break;
    }

    await setListData(null, isHightlight.value, isFree.value, isDiscount.value,
        categoryObj, gradeObj, fromvideo.value, tovideo.value);
    Get.back();
  }

  void toggleCategory(int id) {
    category.value = id;
    if (selectedCategorys.contains(category.value)) {
      selectedCategorys.remove(category.value);
      if (selectedCategorys.length == 0) {
        category.value = 0;
      }
    } else {
      selectedCategorys.add(id);
    }
    setIconFilter();
    update();
  }

  tapCategory(int item) async {
    final gradeObj = selectedGrades.length > 0 ? selectedGrades : null;
    final categoryObj = selectedCategorys.length > 0 ? selectedCategorys : null;
    final data =
        gradeObj == null && categoryObj == null ? searchTextField.text : null;
    index.value = item;
    await setListData(data, isHightlight.value, isFree.value, isDiscount.value,
        categoryObj, gradeObj, "", "");
  }

  tapSearch(String? data) async {
    list.clear();
    listCourse.clear();
    await setListData(data, isHightlight.value, isFree.value, isDiscount.value,
        selectedCategorys, selectedGrades, "", "");
  }

  onChangeMinMax(bool change) {
    min.value = change;
  }

  setListData(
    String? data,
    bool? isHightlight,
    bool? isFree,
    bool? isDiscount,
    List? cates,
    List? grade,
    String fromvideoLength,
    String tovideoLength,
  ) async {
    switch (index.value) {
      case 0:
        await getlistCourse(
            data,
            null,
            "DESC",
            isHightlight,
            isFree,
            isDiscount,
            cates ?? [],
            grade ?? [],
            fromvideoLength,
            tovideoLength);
        break;
      // case 1:
      //   await getlistCourse(data, null, "ASC", false, false, grade);
      //   break
      case 2:
        if (min.value) {
          list.clear();
          listCourse.clear();
          await getlistCourse(data, "price", "ASC", null, null, null,
              cates ?? [], selectedGrades, fromvideoLength, tovideoLength);

          print("min");
        } else {
          list.clear();
          listCourse.clear();
          await getlistCourse(data, "price", "DESC", null, null, null,
              cates ?? [], selectedGrades, fromvideoLength, tovideoLength);

          print("max");
        }
        break;
      default:
        print("default");
        break;
    }
  }

  void onLoading() async {
    // await Future.delayed(Duration(milliseconds: 1000));

    getFilterCourse(page: pages.value + 1);

    refreshController!.loadComplete();
  }

  toNatiDetail(Course course) {
    print(course);
    Get.toNamed(Routes.COURCE_DETAILS, arguments: course.id);
  }

  tapSemoreGrade() {
    nameClasses.value = grades.value;
    update();
  }

  tapSeeLessGrade() {
    nameClasses.value = grades.value.take(4).toList();
    update();
  }

  toNatiCouseLern(int id) {
    Get.toNamed(Routes.COURE_LEARN, arguments: id);
  }

  toNatiCouseLernTrail(int id) {
    Get.toNamed(Routes.COURE_TRAIL_PAGE, arguments: id);
  }

  tapSemoreCategory() {
    listCategories.value = categorys.value;
    update();
  }

  tapSeeLessCategory() {
    listCategories.value = categorys.value.take(4).toList();
    update();
  }

  Future getlistCourse(
      String? freeWord,
      String? sortBy,
      String? sortOrder,
      bool? isHightlight,
      bool? isFree,
      bool? isDiscount,
      List categories,
      List byGrade,
      dynamic fromVideoLengths,
      dynamic toVideoLengths,
      {int page = 1}) async {
    final response = await HomeProvider.instance.getListFilterCourse(
        freeWord,
        sortBy,
        sortOrder,
        isHightlight,
        isFree,
        isDiscount,
        categories,
        byGrade,
        fromVideoLengths,
        toVideoLengths,
        page: page);
    if (response.error.isEmpty) {
      for (var item in response.data['data']['orders']) {
        list.add(Course.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      listCourse.value = list;
      // totalPage.value = response.data['data']['pagination']['total'];
      pages.value = response.data['data']['pagination']['page'];
      print("bết ${pages.value}");
      update();
    }
  }
}
