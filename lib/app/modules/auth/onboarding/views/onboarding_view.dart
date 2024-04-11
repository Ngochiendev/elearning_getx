import 'package:carousel_slider/carousel_slider.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Obx(
                () => controller.sliderEnded.value
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top + 64),
                              child: Center(
                                child: Image.asset(R.ASSETS_PNG_IC_LOGO_SC_PNG),
                              ),
                            ),
                            SizedBox(height: 100),
                            Image.asset(R.ASSETS_PNG_BANNER_4_PNG),
                            SizedBox(height: 36),
                            Text("Smartschool", style: typoBold24),
                            SizedBox(height: 12),
                            Container(
                              child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non finibus venenati...",
                                  textAlign: TextAlign.center,
                                  style: typoRegular16NoSpacing),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: colorWhite,
                                      border: Border.all(
                                        width: 1,
                                        color: colorPrimaryBlue100,
                                      ),
                                    ),
                                    child: AppTextButton(
                                      buttonTitle: "Đăng ký",
                                      onPressed: () {
                                        Get.offNamed(Routes.SIGNUP);
                                      },
                                      textStyle: typoRegular16NoSpacing
                                          .copyWith(color: colorPrimaryBlue100),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: colorPrimaryBlue100,
                                    ),
                                    child: AppTextButton(
                                      buttonTitle: "Đăng nhập",
                                      onPressed: () {
                                        Get.offNamed(Routes.SIGNIN);
                                      },
                                      textStyle: typoRegular16NoSpacing
                                          .copyWith(color: colorWhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 32),
                          ],
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top + 64),
                              child: Center(
                                child: Image.asset(R.ASSETS_PNG_IC_LOGO_SC_PNG),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 10),
                            CarouselSlider(
                              options: CarouselOptions(
                                enlargeCenterPage: false,
                                enableInfiniteScroll: false,
                                reverse: false,
                                viewportFraction: 1.5,
                                aspectRatio: 1.5,
                                initialPage: 0,
                                onPageChanged: (index, reason) {
                                  controller.setSliderIndex(index);
                                },
                              ),
                              carouselController: controller.carouselCtrl,
                              items: controller.onboardings.map(
                                (element) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Image.asset(
                                        element["image"] as String,
                                        fit: BoxFit.contain,
                                      );
                                    },
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(height: 36),
                            Obx(
                              () => AnimatedOpacity(
                                opacity:
                                    controller.textVisible.value ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 200),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 16),
                                      Text(
                                        controller.textTitle.value,
                                        style: typoBold24,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        controller.textContent.value,
                                        style: typoRegular16NoSpacing,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 48,
                            ),
                            Obx(
                              () => Container(
                                child: Visibility(
                                  visible: controller.lastSlide.value,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.7,
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      color: colorPrimaryBlue100,
                                    ),
                                    child: AppTextButton(
                                      buttonTitle: "Bắt đầu ngay",
                                      onPressed: () {
                                        controller.onStartApp();
                                      },
                                      textStyle: typoRegular16NoSpacing
                                          .copyWith(color: colorWhite),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Visibility(
                                    visible: !controller.lastSlide.value,
                                    child: AppTextButton(
                                      buttonTitle: "Bỏ qua",
                                      color: colorNeutralGray40,
                                      onPressed: () {
                                        controller.onSkip();
                                      },
                                      textStyle: typoRegular16NoSpacing,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: controller.onboardings.map(
                                      (element) {
                                        if (element["index"] ==
                                            controller.sliderIndex.value) {
                                          return Container(
                                            width: 8.0,
                                            height: 8.0,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 16.0,
                                                horizontal: 4.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6)),
                                              // border: Border.all(color: colorPrimaryBrand40, width: 2),
                                              color: colorPrimaryBlue100,
                                            ),
                                          );
                                        }
                                        return Container(
                                          width: 8.0,
                                          height: 8.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            color: colorNeutralGray60,
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                //          Obx(() => Container(
                                //   width: MediaQuery.of(context).size.width,
                                //   margin: EdgeInsets.all(32),
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.all(
                                //       Radius.circular(16),
                                //     ),
                                //   ),
                                //   child: ElevatedButtonBase(
                                //     state: controller.buttonState.value,
                                //     height: 50,
                                //     size: 16,
                                //     buttonTitle: "Tham gia",
                                //     onPressed: () async {
                                //       await controller.onJoin();
                                //     },
                                //   ),
                                // )),
                                Obx(
                                  () => Visibility(
                                      visible: !controller.lastSlide.value,
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: ElevatedButtonBase(
                                          height: 40,
                                          size: 14,
                                          buttonTitle: "Tiếp theo",
                                          onPressed: () async {
                                            controller.onContinue();
                                          },
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).padding.bottom,
                            )
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
