import 'dart:math';

import 'package:elearning/app/data/models/appslide_model.dart';
import 'package:elearning/app/data/models/exam_model.dart';
import 'package:elearning/app/data/providers/exam_provider.dart';
import 'package:elearning/app/modules/eexam_views/main_eexam/controllers/main_eexam_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EexamController extends GetxController {
  //TODO: Implement EexamController
  final listSlides = List<AppSlides>.empty(growable: true).obs;
  final appbaner = List<AppBanner>.empty(growable: true).obs;
  final listdoing = List<HappeningExam>.empty(growable: true).obs;
  final listfuture = List<WillHappenExam>.empty(growable: true).obs;

  final sliderIndex = 0.obs;
  final exam = DataExam().obs;
  final sum = 0.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await getlistExam();
  }
  //  sumTotalQuestion(){
  //    listdoing.value.forEach((element) {
  //      int sum =  element.totalQuestions! + element.totalConfigQuestions!;
  //       });

  //  }
  // sumTotalQuestion() {
  //   //int? sum = 0;
  //   (listdoing.first.totalQuestions!);
  //   // int sum =0;
  //   // listdoing.value.forEach((element) {
  //   //  element.totalQuestions! + element.totalConfigQuestions;
  //   //   print("Thương em anh mới xin là${element.totalQuestions! + element.totalConfigQuestions}");
  //   // });
  // }

  tapSearchExam() {
    Get.find<MainEexamController>().changeTabIndex(1);
    //Get.toNamed(Routes.MAIN);
  }

  toNatiDetail() {
    Get.toNamed(Routes.EXAM_DETAIL);
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void setSliderIndex(int inx) async {
    sliderIndex.value = inx;
    update();
    await Future.delayed(Duration(microseconds: 300));
    update();
  }

  Future getlistExam() async {
    appbaner.value = [];
    listSlides.value = [];
    final response = await ExamProvider.instance.getListExamsHomepage();
    exam.value = DataExam.fromJson(response.data['data']);
    if (response.error.isEmpty) {
      appbaner.value = exam.value.banners?.topBanners ?? [];
      listSlides.value = exam.value.banners!.appSlides!.cast<AppSlides>().toList();
      listdoing.value = exam.value.happeningExams!;
      listfuture.value = exam.value.willHappenExams!;
      print("$listdoing");
      update();
    } else {
      return;
    }
  }
}
