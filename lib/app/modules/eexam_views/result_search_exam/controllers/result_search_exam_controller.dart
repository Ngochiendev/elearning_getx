import 'package:elearning/app/data/models/book_models/list_books_model.dart';
import 'package:elearning/app/data/models/category_course_model.dart';
import 'package:elearning/app/data/models/grade_model.dart';
import 'package:elearning/app/data/models/model_search_exam.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/exam_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ResultSearchExamController extends GetxController {
  //TODO: Implement ResultSearchExamController

  var tabCtrl;
  final listGrades = List<GradeModel>.empty(growable: true).obs;
  final listCategoryCourse = List<CategoryCourse>.empty(growable: true).obs;
  final searchTextField = TextEditingController();
  final isTypingSearch = false.obs;
  var textSearch = "".obs;
  final index = 0.obs;
  final min = true.obs;
  final list = List<Exam>.empty(growable: true).obs;
  final selectedGrades = List<int>.empty(growable: true).obs;
  final selectedAuthors = List<int>.empty(growable: true).obs;
  final selectedSubjects = List<int>.empty(growable: true).obs;
  final selectedCategorys = List<int>.empty(growable: true).obs;
  final listExams = List<Exam>.empty(growable: true).obs;
  final grade = 0.obs;
  final subject = 0.obs;
  final category = 0.obs;
  final hasFilter = false.obs;
  RefreshController? refreshController;
  var nameClasses = [].obs;
  var listSubjects = [].obs;
  final modelSearch = ModelExam().obs;
  var listAuthor = [].obs;
  var listCategories = [].obs;
  var grades = List<GradeModel>.empty(growable: true).obs;
  final totalPage = 0.obs;
  final pageDefat = 1.obs;
  final pages = 1.obs;
  @override
  void onInit() async {
    super.onInit();
    // tabCtrl = TabController(vsync: this, length: 3);
    searchTextField.text = Get.arguments["item"] ?? "";
    grade.value = Get.arguments["grade"] ?? 0;
    subject.value = Get.arguments["subject"] ?? 0;
    category.value = Get.arguments["category"] ?? 0;
    nameClasses.value = Get.find<SearchService>().listGrades.take(4).toList();
    listCategories.value = Get.find<SearchService>().listCategoryBooks.take(4).toList();
    listAuthor.value = Get.find<SearchService>().publishers.take(4).toList();
    listSubjects.value = Get.find<SearchService>().listSubjects.take(4).toList();
    await filterExam();
    setIconFilter();

    // await getlistBook(searchTextField.text, null, "ASC",null,null,null );
    refreshController = RefreshController(initialRefresh: false);
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  filterExam({
    int page = 1,
    String sortOrder = "DESC",
    String sortBy = "createdAt",
  }) async {
    if (grade.value > 0) {
      if (selectedGrades.contains(grade.value)) {
        selectedGrades.remove(grade.value);
      }
      selectedGrades.add(grade.value);
      await getlistExam(
        null,
        sortOrder,
        [],
        selectedGrades,
        "",
        page: page,
      );
    } else if (category.value > 0) {
      if (selectedCategorys.contains(category.value)) {
        selectedCategorys.remove(category.value);
      }
      selectedCategorys.add(
        category.value,
      );

      await getlistExam(
        null,
        sortOrder,
        [],
        [],
        selectedCategorys.toString(),
        page: page,
      );
    }
    // else if (subject.value > 0) {
    //   if (selectedSubjects.contains(subject.value)) {
    //     selectedSubjects.remove(subject.value);
    //   }
    //   selectedSubjects.add(subject.value);

    //   await getlistExam(
    //     null,
    //     sortOrder,
    //     selectedSubjects,
    //     [],
    //     [],
    //     page: page,
    //   );
    // } else {
    //   await getlistExam(
    //     searchTextField.text,
    //     sortOrder,
    //     [],
    //     [],
    //     [],
    //     page: page,
    //   );
    // }
  }

  void onTapMin(bool onT) {
    min.value = onT;
  }

  void onLoading() async {
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    if (index.value == 1) {
      print("minnnnnn ${min.value}");
      if (min.value == true) {
        //  min.value = false;
        await filterExam(page: pages.value + 1, sortBy: "discountPrice");
      } else {
        // min.value = true;
        await filterExam(page: pages.value + 1, sortBy: "discountPrice", sortOrder: "ASC");
      }
    } else {
      await filterExam(page: pages.value + 1);
    }
    refreshController!.loadComplete();
  }

  setIconFilter() {
    selectedGrades.length > 0 ||
            selectedAuthors.length > 0 ||
            selectedSubjects.length > 0 ||
            selectedCategorys.length > 0
        ? hasFilter.value = true
        : hasFilter.value = false;
  }

  void toggleAuthor(int id) {
    if (selectedAuthors.contains(id)) {
      selectedAuthors.remove(id);
    } else {
      selectedAuthors.add(id);
    }
    setIconFilter();
    update();
  }

  void toggleSubject(int id) {
    subject.value = id;
    if (selectedSubjects.contains(subject.value)) {
      selectedSubjects.remove(subject.value);
      if (selectedCategorys.length == 0) {
        subject.value = 0;
      }
    } else {
      selectedSubjects.add(id);
    }
    setIconFilter();
    update();
  }

  void toggleGrade(int id) {
    grade.value = id;
    if (selectedGrades.contains(grade.value)) {
      selectedGrades.remove(grade.value);
      if (selectedGrades.length == 0) {
        grade.value = 0;
      }
    } else {
      selectedGrades.add(id);
    }
    setIconFilter();
    update();
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

  tapSubmit() async {
    list.clear();
    listExams.clear();
    final gradeObj = selectedGrades.length > 0 ? selectedGrades : null;
    final categoryObj = selectedCategorys.length > 0 ? selectedCategorys : null;
    final subjectObj = selectedSubjects.length > 0 ? selectedSubjects : null;
    await setListData(null, gradeObj, categoryObj, subjectObj);
    Get.back();
  }

  tapCategory(int item) async {
    final gradeObj = selectedGrades.length > 0 ? selectedGrades : null;
    final categoryObj = selectedCategorys.length > 0 ? selectedCategorys : null;
    final subjectObj = selectedSubjects.length > 0 ? selectedSubjects : null;
    final data = gradeObj == null && categoryObj == null && subjectObj == null ? searchTextField.text : null;
    index.value = item;
    await setListData(data, gradeObj, categoryObj, subjectObj);
  }

  tapSearch(String? data) async {
    list.clear();
    listExams.clear();
    await setListData(data, [], [], []);
  }

  setListData(
    String? data,
    List? grades,
    List? categorys,
    List? subjects,
  ) async {
    switch (index.value) {
      case 0:
        list.clear();
        listExams.clear();
        await getlistExam(data, "DESC", categorys ?? [], grades ?? [], "");
        break;
      case 1:
        if (min.value == true) {
          list.clear();
          listExams.clear();

          await getlistExam(data, "ASC", categorys ?? [], selectedGrades, "");

          print("min");
        } else {
          list.clear();
          listExams.clear();

          await getlistExam(data, "DESC", categorys ?? [], selectedGrades, "");

          print("max");
        }
        break;

      default:
        print("default");
        break;
    }
  }

  toNatiDetail(int? id) {
    Get.toNamed(Routes.EBOOK_DETAILS, arguments: {"id": id ?? 0});
  }

  tapSemoreGrade() {
    nameClasses.value = Get.find<SearchService>().listGrades;
    update();
  }

  tapSeeLessGrade() {
    nameClasses.value = Get.find<SearchService>().listGrades.take(4).toList();
    update();
  }

  tapSemoreSubject() {
    listSubjects.value = Get.find<SearchService>().listSubjects;
    update();
  }

  tapSeeLessSubject() {
    listSubjects.value = Get.find<SearchService>().listSubjects.take(4).toList();
    update();
  }

  tapSemoreCategory() {
    listCategories.value = Get.find<SearchService>().listCategoryBooks;
    update();
  }

  tapSeeLessCategory() {
    listCategories.value = Get.find<SearchService>().listCategoryBooks.take(4).toList();
    update();
  }

  tapSemorePublisher() {
    listAuthor.value = Get.find<SearchService>().publishers;
    update();
  }

  tapSeeLessPublisher() {
    listAuthor.value = Get.find<SearchService>().publishers.take(4).toList();
    update();
  }

  Future getlistExam(String? freeword, String? sortOrder, List categoryIds, List gradeIds, String happenStatus,
      {int page = 1}) async {
    final response =
        await ExamProvider.instance.getListFilterExam(freeword, sortOrder, categoryIds, gradeIds, happenStatus, page);

    if (response.error.isEmpty) {
      modelSearch.value = ModelExam.fromJson(response.data);

      // list.value=[];

      for (var item in modelSearch.value.data!.exams!) {
        list.add(item);
      }
      // print(list.length);
      // listBooks.clear();
      listExams.value = list;
      totalPage.value = response.data['data']['pagination']['total'];
      pages.value = response.data['data']['pagination']['page'];
      print(listExams.length);
      update();
    } else {
      return;
    }
  }
}
