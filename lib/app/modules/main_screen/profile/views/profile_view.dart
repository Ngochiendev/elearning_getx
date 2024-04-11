import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackgroundProfile,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).padding.top + 8, 0, 0),
                  height: 150,
                  color: Colors.white,
                  child: Obx(() => buildCircleAvatar(context, controller))),
              SizedBox(
                height: 16,
              ),
              Container(
                  color: Colors.white,
                  child: Obx(
                    () => buildButton(context,
                        titleOne: "Ví smartschool",
                        nameIconOne: R.ASSETS_SVG_IC_MONEY_SVG,
                        titleTwo: "Tích điểm",
                        nameIconTwo: R.ASSETS_SVG_ICF_GIFT_SVG,
                        titleThree: "Lịch sử giao dịch",
                        nameIconThree: R.ASSETS_SVG_ICF_HISTORY_PAY_SVG,
                        showOne: true,
                        controller: controller, onTapOne: () {
                      Get.toNamed(Routes.WALLET_USER);
                    }, onTapTwo: () {
                      Get.toNamed(Routes.POINT_HISTORY);
                    }, onTapThree: () {
                      Get.toNamed(Routes.TRANSACTION_HISTORY);
                    }),
                  )),
              SizedBox(
                height: 16,
              ),
              Container(
                  color: Colors.white,
                  child: buildButton(context,
                      titleOne: "Tiến trình học tập",
                      nameIconOne: R.ASSETS_SVG_ICF_LEARNNING_PROGRESS_SVG,
                      titleTwo: "Tiến trình đọc sách",
                      nameIconTwo: R.ASSETS_SVG_ICF_BOOK_PROGRES_SVG,
                      titleThree: "Kết quả thi",
                      nameIconThree: R.ASSETS_SVG_ICF_TEST_RESULTS_SVG,
                      onTapOne: () {
                    Get.toNamed(Routes.LEARNING_PROGRESS);
                  }, onTapTwo: () {
                    Get.toNamed(Routes.BOOK_PROGRESS);
                  }, onTapThree: () {
                    print("three");
                  })),
              SizedBox(
                height: 16,
              ),
              Container(
                  color: Colors.white,
                  child: buildButton(context,
                      titleOne: "Đổi mật khẩu",
                      nameIconOne: R.ASSETS_SVG_ICF_KEY_LOCK_SVG,
                      titleTwo: "Cài đặt và đăng xuất",
                      nameIconTwo: R.ASSETS_SVG_ICF_SETTTING_SVG,
                      titleThree: "Kết quả thi",
                      nameIconThree: R.ASSETS_SVG_ICF_TEST_RESULTS_SVG,
                      showItem: true, onTapOne: () {
                    Get.toNamed(Routes.CHANGE_PASSWORD);
                  }, onTapTwo: () {
                    Get.toNamed(Routes.SETTING_PAGE);
                  }, onTapThree: () {
                    print("three");
                  })),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCircleAvatar(BuildContext context, ProfileController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.EDIT_PROFILE);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                controller.userModel.value.attributes?.avatar != ''
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "$baseUrlImage${controller.userModel.value.attributes?.avatar}"),
                      )
                    : SvgPicture.asset(
                        R.ASSETS_SVG_AVATAR_DEFAULT_SVG,
                        width: 90,
                        height: 90,
                      ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 64) / 2,
                  height: 150,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "${controller.userModel.value.firstName ?? ''} ${controller.userModel.value.lastName ?? ''} ",
                                style: typoBalo18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              controller.userModel.value.phone ?? "",
                              style: typoRegular14,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                controller.userModel.value.username ?? "",
                                style: typoRegular14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SvgPicture.asset(R.ASSETS_SVG_IC_EDIT_SVG)
          ],
        ),
      ),
    );
  }

  Widget buildButton(
    BuildContext context, {
    String? titleOne,
    String? titleTwo,
    String? titleThree,
    String? nameIconOne,
    String? nameIconTwo,
    String? nameIconThree,
    bool showOne = false,
    bool showTwo = false,
    bool showItem = false,
    GestureTapCallback? onTapOne,
    GestureTapCallback? onTapTwo,
    GestureTapCallback? onTapThree,
    ProfileController? controller,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InkWell(
            onTap: onTapOne,
            child: Container(
              height: 70,
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(nameIconOne!),
                          SizedBox(
                            width: 10.2,
                          ),
                          Text(
                            titleOne!,
                            style: typoRegular14,
                          )
                        ],
                      ),
                      showOne
                          ? Row(
                              children: [
                                Text(
                                  "${formatter.format(controller!.walletUser.toInt())}",
                                  style: typoRegular14Blue,
                                ),
                                Text(
                                  LocaleKeys.general_currencyUnit.tr,
                                  style: typoRegular8Blue,
                                ),
                              ],
                            )
                          : SvgPicture.asset(R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: onTapTwo,
            child: Container(
              height: 70,
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(nameIconTwo!),
                          SizedBox(
                            width: 10.2,
                          ),
                          Text(
                            titleTwo!,
                            style: typoRegular14,
                          )
                        ],
                      ),
                      showOne
                          ? Row(
                              children: [
                                Text(
                                  "${formatter.format(controller!.pointCtrl.toInt())} ${LocaleKeys.general_rewardUnit.tr}",
                                  style: typoRegular14Blue,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  height: 16.8,
                                  width: 16.8,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              R.ASSETS_PNG_IC_REWARD_PNG))),
                                )
                              ],
                            )
                          : SvgPicture.asset(R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  showItem
                      ? Container()
                      : Divider(
                          height: 1,
                          color: Colors.grey,
                        )
                ],
              ),
            ),
          ),
          showItem
              ? Container()
              : InkWell(
                  onTap: onTapThree,
                  child: Container(
                    height: 70,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment
                              .center, //Center Row contents vertically,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(nameIconThree!),
                                SizedBox(
                                  width: 10.2,
                                ),
                                Text(
                                  titleThree!,
                                  style: typoRegular14,
                                )
                              ],
                            ),
                            showTwo
                                ? Text(
                                    "213.500",
                                    style: typoRegular14Blue,
                                  )
                                : SvgPicture.asset(
                                    R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
