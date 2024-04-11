import 'package:elearning/app/data/models/category_course_model.dart';
import 'package:elearning/app/data/models/course_model.dart';
import 'package:elearning/app/data/models/grade_model.dart';
import 'package:elearning/app/data/models/teacher_filter.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ResultSearchController extends GetxController
    with SingleGetTickerProviderMixin {
  //TODO: Implement ResultSearchController
  var tabCtrl;
  final listGrades = List<GradeModel>.empty(growable: true).obs;
  final listCategoryCourse = List<CategoryCourse>.empty(growable: true).obs;
  final listLengthVideoCourse = List<Course>.empty(growable: true).obs;
  final searchTextField = TextEditingController();
  final isTypingSearch = false.obs;
  var textSearch = "".obs;
  final index = 0.obs;
  final min = true.obs;
  final selectedGrades = List<int>.empty(growable: true).obs;
  final selectedCategorys = List<int>.empty(growable: true).obs;
  final selectedVideoLengths = List<int>.empty(growable: true).obs;
  final listCourse = List<Course>.empty(growable: true).obs;
  final list = List<Course>.empty(growable: true).obs;
  final listTeacherFill = List<TeacherPagination>.empty(growable: true).obs;
  final listTeacherData = List<TeacherPagination>.empty(growable: true).obs;
  final grade = 0.obs;
  final category = 0.obs;
  final videoLength = 0.obs;
  RefreshController? refreshController;
  var nameClasses = [].obs;
  var listTeacher = [].obs;
  var listLengthVideo = [].obs;
  var listCategories = [].obs;
  var grades = List<GradeModel>.empty(growable: true).obs;
  var categorys = [].obs;
  final hasFilter = false.obs;
  final isSelect = "".obs;
  final fromvideo = ''.obs;
  final tovideo = ''.obs;
  final pages = 1.obs;
  final keyT = "".obs;
  final modelTeacher = DataTeacher().obs;
  @override
  void onInit() async {
    super.onInit();
    // tabCtrl = TabController(vsync: this, length: 3);
    keyT.value = Get.arguments["teacher"] ?? "";
    categorys.value = Get.find<SearchService>().listcategorys.value;
    grades.value = Get.find<SearchService>().listGrades.value;
    searchTextField.text = Get.arguments["item"] ?? "";
    category.value = Get.arguments["categoryIds"] ?? 0;
    grade.value = Get.arguments["grade"] ?? 0;
    nameClasses.value = grades.take(4).toList();
    listCategories.value = categorys.take(4).toList();
    await getFilterCourse();
    setIconFilter();
    // await getlistCourse(searchTextField.text, null, null, "ASC");
    refreshController = RefreshController(initialRefresh: false);
    update();
    listLengthVideo.value = [
      "0-1 giờ",
      "1-3 giờ",
      "3-6 giờ",
      "6-17 giờ",
    ];
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
    String sortOrder = "DESC",
    String sortBy = "createdAt",
  }) async {
    if (keyT.value == "teacher") {
      await getlistTeacherCourse("", "rating", [], [], page: page);
    } else if (grade.value > 0) {
      if (selectedGrades.contains(grade.value)) {
        selectedGrades.remove(grade.value);
      }
      selectedGrades.add(grade.value);
      if (keyT.value == "teacher") {
        await getlistTeacherCourse("", "rating", [], selectedGrades,
            page: page);
      } else {
        await getlistCourse(
          null,
          sortBy,
          sortOrder,
          null,
          null,
          null,
          [],
          selectedGrades,
          null,
          null,
          page: page,
        );
      }
      // await setListData(null, null, selectedGrades,"","");
    } else if (category.value > 0) {
      if (selectedCategorys.contains(category.value)) {
        selectedCategorys.remove(category.value);
      }
      selectedCategorys.add(category.value);
      if (keyT.value == "teacher") {
        await getlistTeacherCourse("", "rating", selectedCategorys, [],
            page: page);
      } else {
        await getlistCourse(
          null,
          sortBy,
          sortOrder,
          null,
          null,
          null,
          selectedCategorys,
          [],
          null,
          null,
          page: page,
        );
      }
    } else {
      await getlistCourse(
        searchTextField.text,
        sortBy,
        sortOrder,
        null,
        null,
        null,
        [],
        [],
        null,
        null,
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

    if (keyT.value == "teacher") {
      await setListTeacherData(null, categoryObj, gradeObj);
    } else {
      await setListData(
          null, categoryObj, gradeObj, fromvideo.value, tovideo.value);
    }
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
    if (keyT.value == "teacher") {
      await setListTeacherData(data, categoryObj, gradeObj);
    } else {
      await setListData(data, categoryObj, gradeObj, "", "");
    }
  }

  tapSearch(String? data) async {
    list.clear();
    listCourse.clear();
    if (keyT.value == "teacher") {
      await setListTeacherData(data, selectedCategorys, selectedGrades);
    } else {
      await setListData(data, selectedCategorys, selectedGrades, "", "");
    }
  }

  onChangeMinMax(bool change) {
    min.value = change;
  }

  setListData(
    String? data,
    List? cates,
    List? grade,
    String fromvideoLength,
    String tovideoLength,
  ) async {
    switch (index.value) {
      case 0:
        list.clear();
        listCourse.clear();
        await getlistCourse(data, null, "DESC", null, null, null, cates ?? [],
            selectedGrades, fromvideoLength, tovideoLength);
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

  setListTeacherData(
    String? data,
    List? cates,
    List? grade,
  ) async {
    switch (index.value) {
      case 0:
        listTeacherFill.clear();
        listTeacherData.clear();
        await getlistTeacherCourse(data, "rating", cates ?? [], selectedGrades);
        break;
      // case 1:
      //   await getlistCourse(data, null, "ASC", false, false, grade);
      //   break
      case 2:
        if (min.value) {
          listTeacherFill.clear();
          listTeacherData.clear();
          await getlistTeacherCourse(
            data,
            "rating",
            cates ?? [],
            selectedGrades,
          );

          print("min");
        } else {
          listTeacherFill.clear();
          listTeacherData.clear();
          await getlistTeacherCourse(
            data,
            "totalCourse",
            cates ?? [],
            selectedGrades,
          );

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
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    print("load");
    if (keyT.value == "teacher") {
      if (index.value == 2) {
        print("minnnnnn ${min.value}");
        if (min.value == true) {
          //  min.value = false;
          await getFilterCourse(
            page: pages.value + 1,
            sortBy: "price",
          );
        } else {
          // min.value = true;
          await getFilterCourse(
              page: pages.value + 1, sortBy: "price", sortOrder: "ASC");
        }
      } else {
        await getFilterCourse(page: pages.value + 1);
      }
    } else {
      if (index.value == 2) {
        print("minnnnnn ${min.value}");
        if (min.value == true) {
          //  min.value = false;
          await getFilterCourse(
            page: pages.value + 1,
            sortBy: "price",
          );
        } else {
          // min.value = true;
          await getFilterCourse(
              page: pages.value + 1, sortBy: "price", sortOrder: "ASC");
        }
      } else {
        await getFilterCourse(page: pages.value + 1);
      }
    }
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

  tapSemoreCategory() {
    listCategories.value = categorys.value;
    update();
  }

  tapSeeLessCategory() {
    listCategories.value = categorys.value.take(4).toList();
    update();
  }

  tapSeeDetailTeacher(String id) {
    Get.toNamed(Routes.DETAL_TEACHER, arguments: id);
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

  Future getlistTeacherCourse(
      String? freeWord, String? sortBy, List categories, List byGrade,
      {int page = 1}) async {
    final response = await HomeProvider.instance.getListTeacherFilterCourse(
        freeWord, sortBy, categories, byGrade,
        page: page);
    if (response.error.isEmpty) {
      // print(jsonEncode(response.data['data']));
      for (var item in response.data['data']['teacherPaginations']) {
        listTeacherFill.add(TeacherPagination.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      listTeacherData.value = listTeacherFill;
      // totalPage.value = response.data['data']['pagination']['total'];
      pages.value = response.data['data']['pagination']['page'];
      print("bết ${pages.value}");

      update();
    }
  }
}
