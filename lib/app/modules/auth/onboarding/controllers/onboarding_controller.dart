import 'package:carousel_slider/carousel_slider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController
  final onboardings = [
    {
      "index": 0,
      "image": R.ASSETS_PNG_BANNER_1_PNG,
      "title": "SMART SCHOOL",
      "content":
          "Hãy cho SmartSchool biết một số thông tin của bạn nhé, chúng tôi sẽ đưa ra các gợi ý phù hợp nhất cho bạn"
    },
    {
      "index": 1,
      "image": R.ASSETS_PNG_BANNER_2_PNG,
      "title": "SMART SCHOOL",
      "content":
          "Hãy cho SmartSchool biết một số thông tin của bạn nhé, chúng tôi sẽ đưa ra các gợi ý phù hợp nhất cho bạn"
    },
    {
      "index": 2,
      "image": R.ASSETS_PNG_BANNER_3_PNG,
      "title": "SMART SCHOOL",
      "content":
          "Hãy cho SmartSchool biết một số thông tin của bạn nhé, chúng tôi sẽ đưa ra các gợi ý phù hợp nhất cho bạn"
    },
  ];

  final sliderIndex = 0.obs;
  final textVisible = false.obs;
  final textTitle = "".obs;
  final textContent = "".obs;
  final carouselCtrl = CarouselController();
  final count = 0.obs;
  final sliderEnded = false.obs;
  final lastSlide = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    textTitle.value = onboardings[sliderIndex.value]["title"] as String;
    textContent.value = onboardings[sliderIndex.value]["content"] as String;
    textVisible.value = true;
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void setSliderIndex(int inx) async {
    sliderIndex.value = inx;
    textVisible.value = false;
    update();
    await Future.delayed(Duration(milliseconds: 300));
    textTitle.value = onboardings[inx]["title"] as String;
    textContent.value = onboardings[inx]["content"] as String;
    textVisible.value = true;
    if (sliderIndex.value == onboardings.length - 1) {
      lastSlide.value = true;
    }
    update();
  }

  void onSkip() {
    Get.offAndToNamed(Routes.SIGNIN);
  }

  void onContinue() {
    if (sliderIndex.value < onboardings.length - 1) {
      carouselCtrl.nextPage();
      setSliderIndex(sliderIndex.value + 1);
    } else {
      // Get.offAndToNamed(Routes.SIGNIN);
    }
  }

  void onStartApp() {
    sliderEnded.value = true;
  }
}
