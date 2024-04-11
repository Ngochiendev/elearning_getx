// import 'package:elearning/app/data/models/appslide_model.dart';
import 'package:elearning/app/data/models/category_course_model.dart';
import 'package:elearning/app/data/models/course_home_model.dart';
// import 'package:elearning/app/data/models/course_model.dart';
import 'package:elearning/app/data/models/news_model.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/modules/main_screen/main/controllers/main_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCourseController extends GetxController {
  //TODO: Implement HomeCourseController

  final subjects = [
    {"icon": R.ASSETS_SVG_IC_MATH_SVG, "label": "Toán"},
    {"icon": R.ASSETS_SVG_IC_PHYSIC_SVG, "label": "Vật lý"},
    {"icon": R.ASSETS_SVG_IC_BIOLOGICAL_SVG, "label": "Sinh học"},
    {"icon": R.ASSETS_SVG_IC_CHEMISTRY_SVG, "label": "Hóa học"},
    {"icon": R.ASSETS_SVG_IC_PHYSIC_SVG, "label": "Văn học"},
    {"icon": R.ASSETS_SVG_IC_PHYSIC_SVG, "label": "Địa lý"},
  ];

  final listCourseHighlight = List<CourseHome>.empty(growable: true).obs;
  final listCourseDiscount = List<CourseHome>.empty(growable: true).obs;
  final listCourseNewest = List<CourseHome>.empty(growable: true).obs;
  final listCourseFree = List<CourseHome>.empty(growable: true).obs;
  var listHighlight = List<CourseHome>.empty(growable: true).obs;
  var listDiscount = List<CourseHome>.empty(growable: true).obs;
  var listNewest = List<CourseHome>.empty(growable: true).obs;
  var listFree = List<CourseHome>.empty(growable: true).obs;
  final listCategoryCourse = List<CategoryCourse>.empty(growable: true).obs;
  final homeModel = DataHomeCourse().obs;
  final listSlides = List<AppBanner>.empty(growable: true).obs;
  final appbanners = List<AppBanner>.empty(growable: true).obs;
  final sliderIndex = 0.obs;
  final sliderTopIndex = 0.obs;
  final news = List<NewsModel>.empty(growable: true).obs;
  final nameBanner = "".obs;
  final hasFilter = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getHomeCouse();
    // listSlides.value = await getlistAppSlide("appSlide") ?? [];
    // appbanners.value = await getlistAppSlide("appBanner") ?? [];
    await getlistNews();
    await getlistCategoriesCourse();
    // if (appbanners.length > 0) {
    //   nameBanner.value = appbanners.first.source ?? "";
    // }
    // listCourseHighlight.value =
    //     await getlistCourse(null, "DESC", true, null) ?? <Course>[];
    // listHighlight.value = listCourseHighlight.take(8).toList();
    // listCourseDiscount.value =
    //     await getlistCourse("discountPercentage", "DESC", null, null) ??
    //         <Course>[];
    // listDiscount.value = listCourseDiscount.take(8).toList();

    // listCourseNewest.value =
    //     await getlistCourse(null, "DESC", null, null) ?? <Course>[];
    // listNewest.value = listCourseNewest.take(8).toList();

    // listCourseFree.value =
    //     await getlistCourse(null, "DESC", null, true) ?? <Course>[];

    // listFree.value = listCourseFree.take(8).toList();
  }

  @override
  void onReady() {
    super.onReady();
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

  void setSliderTopIndex(int inx) async {
    sliderTopIndex.value = inx;
    update();
    await Future.delayed(Duration(milliseconds: 300));
    update();
  }

  // Future getlistAppSlide(String type) async {
  //   final response = await HomeProvider.instance.getListAppSlide(type, true);
  //   if (response.error.isEmpty) {
  //     final list = <AppBanner>[];

  //     for (var item in response.data['data']['rows']) {
  //       list.add(AppBanner.fromJson(item));
  //     }
  //     var data = list.where((e) => !e.source!.contains(".mp4")).toList();
  //     update();

  //     return data;
  //   }
  // }

  Future getHomeCouse() async {
    final response = await HomeProvider.instance.getHomeCouse();

    homeModel.value = DataHomeCourse.fromJson(response.data['data']);
    if (response.error.isEmpty) {
      // listCourseHighlight.value=
      listSlides.value = homeModel.value.banners?.appBanners ?? [];

      appbanners.value = homeModel.value.banners?.appSlides ?? [];
      listFree.value = homeModel.value.courses?.freeCourses ?? [];
      listDiscount.value = homeModel.value.courses?.discountCourses ?? [];
      listHighlight.value = homeModel.value.courses?.highLightCourses ?? [];
      listNewest.value = homeModel.value.courses?.newestCourses ?? [];
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
      update();
    }
  }

  detailNews(int? id) {
    Get.toNamed(Routes.DETAIL_NEWS, arguments: id ?? 0);
  }

  Future getlistCourse(String? sortBy, String? sortOrder, bool? isHightlight,
      bool? isFree) async {
    final response = await HomeProvider.instance
        .getListCourseType(sortBy, sortOrder, isHightlight, isFree);
    if (response.error.isEmpty) {
      final list = <CourseHome>[];

      for (var item in response.data['data']['orders']) {
        list.add(CourseHome.fromJson(item));
      }
      update();

      // print(jsonEncode(response.data['data']));
      return list;
    }
  }

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

  onSelectService(e) {
    print(e["label"]);
  }

  tapSearch() {
    Get.find<MainController>().changeTabIndex(1);
    Get.toNamed(Routes.MAIN);
  }

  toNatiDetail(CourseHome course) {
    print(course);
    Get.toNamed(Routes.COURCE_DETAILS, arguments: course.id);
  }

  toNatiCouseLern(int id) {
    Get.toNamed(Routes.COURE_LEARN, arguments: id);
  }

  toNatiCouseLernTrail(int id) {
    Get.toNamed(Routes.COURE_TRAIL_PAGE, arguments: id);
  }

  tapSemore(String? name, String? sortBy, String? sortOrder, bool? isHightlight,
      bool? isFree, bool isDiscount) async {
    // Get.until((route) => route.isFirst);
    await Get.toNamed(Routes.DETAIL_CATEGORY_PRODUCT, arguments: {
      "isTitle": name,
      "isSortBy": sortBy,
      "isSortOrder": sortOrder,
      "isHighlight": isHightlight,
      "isFree": isFree,
      "isDiscount": isDiscount,
    });
    update();
  }

  tapSemoreNews(String? name) async {
    // Get.until((route) => route.isFirst);
    await Get.toNamed(Routes.DETAIL_CATEGORY_BOOK,
        arguments: {"isTitle": name});
    update();
  }
}
