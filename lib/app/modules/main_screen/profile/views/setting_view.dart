import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingAndSignOut extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackgroundProfile,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          "Cài Đặt và Đăng xuất",
          style: typoBold24,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: colorWhite,
            child: buildButton(
              context,
              titleOne: LocaleKeys.label_aboutus.tr,
              titleTwo: LocaleKeys.label_appreviews.tr,
              titlethree: "Liên hệ",
              isShow2: true,
              nameIconThree: R.ASSETS_SVG_LOCATION_MARKER_SVG,
              nameIconOne: R.ASSETS_SVG_SEARCH_CIRCLE_SVG,
              nameIconTwo: R.ASSETS_SVG_STAR_SVG,
              showItem: true,
              onTapOne: () {},
              onTapTwo: () {},
              onTapThree: () => Get.toNamed(Routes.CONTACS),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            color: colorWhite,
            child: buildButton(
              context,
              titleOne: "Điều khoản sử dụng",
              titleTwo: "Điều khoản sử dụng",
              titlethree: "Chính sách bảo mật",
              title: "Hướng dẫn thanh toán",
              nameIconOne: R.ASSETS_SVG_INFORMATION_CIRCLE_SVG,
              nameIconTwo: R.ASSETS_SVG_QUESTION_MARK_CIRCLE_SVG,
              nameIconThree: R.ASSETS_SVG_VECTOR_SVG,
              nameIcon: R.ASSETS_SVG_VECTOR1_SVG,
              showItem: true,
              onTapOne: () {},
              onTapTwo: () {},
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: colorWhite,
            child: InkWell(
              onTap: () {
                controller.tapLogout();
              },
              child: Container(
                height: 73,
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
                            SvgPicture.asset(R.ASSETS_SVG_POWER_OFF_SVG),
                            SizedBox(
                              width: 10.2,
                            ),
                            Text(
                              LocaleKeys.label_logOut.tr,
                              style: typoRegular14Redd,
                            )
                          ],
                        ),
                        SvgPicture.asset(R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
    BuildContext context, {
    String? titleOne,
    String? titleTwo,
    String? titlethree,
    String? title,
    String? nameIconOne,
    String? nameIconTwo,
    String? nameIconThree,
    String? nameIcon,
    bool showItem = false,
    bool isShow1 = false,
    bool isShow2 = false,
    GestureTapCallback? onTapOne,
    GestureTapCallback? onTapTwo,
    GestureTapCallback? onTapThree,
    GestureTapCallback? onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 27),
      child: Column(
        children: [
          InkWell(
            onTap: onTapOne,
            child: Container(
              height: 73,
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
                      SvgPicture.asset(R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG),
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
          isShow1
              ? Container()
              : InkWell(
                  onTap: onTapThree,
                  child: Container(
                    height: 73,
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
                                  titlethree!,
                                  style: typoRegular14,
                                )
                              ],
                            ),
                            SvgPicture.asset(R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG),
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
          isShow2
              ? Container()
              : InkWell(
                  onTap: onTap,
                  child: Container(
                    height: 73,
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
                                SvgPicture.asset(nameIcon!),
                                SizedBox(
                                  width: 10.2,
                                ),
                                Text(
                                  title!,
                                  style: typoRegular14,
                                )
                              ],
                            ),
                            SvgPicture.asset(R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG),
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
          InkWell(
            onTap: onTapTwo,
            child: Container(
              height: 73,
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
                      SvgPicture.asset(R.ASSETS_SVG_ICF_ARROW_RIGHT_SVG),
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
        ],
      ),
    );
  }
}
