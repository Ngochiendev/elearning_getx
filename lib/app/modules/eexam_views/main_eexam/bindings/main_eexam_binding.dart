import 'package:elearning/app/modules/eexam_views/eexam/controllers/eexam_controller.dart';
import 'package:elearning/app/modules/eexam_views/main_eexam/controllers/main_eexam_controller.dart';
import 'package:elearning/app/modules/eexam_views/notifyexam/controllers/notifyexam_controller.dart';
import 'package:elearning/app/modules/eexam_views/result_search_exam/controllers/result_search_exam_controller.dart';
import 'package:elearning/app/modules/eexam_views/search_exam/controllers/search_exam_controller.dart';

import 'package:get/get.dart';

class MainEexamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainEexamController>(
      () => MainEexamController(),
    );
    Get.lazyPut<EexamController>(
      () => EexamController(),
    );
    Get.lazyPut<SearchExamController>(
      () => SearchExamController(),
    );
    Get.lazyPut<ResultSearchExamController>(
      () => ResultSearchExamController(),
    );
    Get.lazyPut<NotifyexamController>(
      () => NotifyexamController(),
    );
  }
}
