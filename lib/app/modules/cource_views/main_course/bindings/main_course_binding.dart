import 'package:elearning/app/modules/cource_views/home_course/controllers/home_course_controller.dart';
import 'package:elearning/app/modules/cource_views/search/controllers/search_controller.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_course_controller.dart';

class MainCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainCourseController>(
      () => MainCourseController(),
    );
    Get.lazyPut<HomeCourseController>(
      () => HomeCourseController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    // Get.lazyPut<DetailCategoryProductController>(
    //   () => DetailCategoryProductController(),
    // );
  }
}
