import 'package:elearning/app/data/models/teacher_detail.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DetailCouourseTeacherController extends GetxController {
  //TODO: Implement DetailCouourseTeacherController
  final listCourseTeacher = List<CourseDetailTeacher>.empty(growable: true).obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    listCourseTeacher.value = Get.arguments ?? [];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  toNatiDetail(int id) {
    Get.toNamed(Routes.COURCE_DETAILS, arguments: id);
  }

  toNatiCouseLernTrail(int id) {
    Get.toNamed(Routes.COURE_TRAIL_PAGE, arguments: id);
  }

  toNatiCouseLern(int id) {
    Get.toNamed(Routes.COURE_LEARN, arguments: id);
  }
}
