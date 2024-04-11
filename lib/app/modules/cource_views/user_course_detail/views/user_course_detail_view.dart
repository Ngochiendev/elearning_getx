import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/user_course_detail_controller.dart';

class UserCourseDetailView extends GetView<UserCourseDetailController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text("Tài liệu tham khảo", style: typoBold18),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              launch(controller.document.value.source ?? "");
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: colorNeutralGray5),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFE5F3FE),
                          border: Border.all(
                            width: 1,
                            color: Color(0xFFE5F3FE),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          )),
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        R.ASSETS_SVG_IC_DOCX_SVG,
                        width: 16,
                        height: 20,
                      )),
                  Expanded(
                      child: Column(
                        children: [
                          Text(
                              controller.document.value.fileName ??
                                  "Không có tài liệu",
                              style: typoBold14),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            fullStringTimeFormat(
                                controller.document.value.updatedAt ?? "") +
                                "  ${controller.document.value.fileType ?? ""}",
                            style: typoRegular12,
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Text("Lợi ích khóa học", style: typoBold18),
          SizedBox(
            height: 16,
          ),
          Html(
            data: controller.course.value.benefit ?? "",
            style: {
              '#': Style(
                color: colorNeutralGray60,
                fontSize: FontSize(14),
              ),
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Text("Yêu cầu", style: typoBold18),
          SizedBox(
            height: 16,
          ),
          Html(
            data: controller.course.value.requirement ?? "",
            style: {
              '#': Style(
                color: colorNeutralGray60,
                fontSize: FontSize(14),
              ),
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Text("Mô tả khóa học", style: typoBold18),
          SizedBox(
            height: 16,
          ),
          Html(
            data: controller.course.value.description ?? "",
            style: {
              '#': Style(
                color: colorNeutralGray60,
                fontSize: FontSize(14),
              ),
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Khóa học khuyến mại", style: typoBold18),
              Text(
                "Xem thêm",
                style: typoRegular12.copyWith(
                    color: colorSemanticBlue100,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
          SizedBox(height: 16),
          controller.listCourse.length > 0
              ? Container(
            height: 360,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.listCourse.length,
                itemBuilder: (context, e) => Container(
                  width: (MediaQuery.of(context).size.width - 64) / 2,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      color: colorWhite,
                      boxShadow: boxShadow),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 92,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              color: Colors.yellow,
                            ),
                            child: AppNetworkImage(
                              source: controller
                                  .listCourse.value[e].avatar ??
                                  "",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              left: 16,
                              top: 8,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  controller.listCourse.value[e]
                                      .discountPercentage !=
                                      null
                                      ? Container(
                                    width: 40,
                                    height: 20,
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      color:
                                      colorSemanticRed100,
                                    ),
                                    child: Text(
                                      '-${controller.listCourse.value[e].discountPercentage ?? -50}' +
                                          "%",
                                      style: typoSemiBold10
                                          .copyWith(
                                          color: colorWhite,
                                          fontSize: 8),
                                      textAlign:
                                      TextAlign.center,
                                    ),
                                  )
                                      : SizedBox(height: 8),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  // Text(
                                  //   e.teacher ?? "Thầy Văn Tuấn",
                                  //   style: typoRegular10.copyWith(
                                  //       color: colorWhite),
                                  // ),
                                  // SizedBox(
                                  //   height: 8,
                                  // ),
                                  // Text(
                                  //   "Hóa học - Lớp 3",
                                  //   style: typoRegular10.copyWith(
                                  //       color: colorWhite,
                                  //       fontSize: 8),
                                  // ),
                                ],
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.listCourse.value[e].title ?? "",
                          style: typoLight14,
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Html(
                          data: controller.listCourse.value[e]
                              .briefDescription ??
                              "",
                          style: {
                            '#': Style(
                              color: colorNeutralGray60,
                              fontSize: FontSize(12),
                              maxLines: 3,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8, left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                "${formatter.format(controller.listCourse.value[e].retailPrice ?? 0)} đ",
                                style: typoLight12.copyWith(
                                    decoration:
                                    TextDecoration.lineThrough))
                          ],
                        ),
                      ),
                      Visibility(
                        visible:
                        controller.listCourse.value[e].price !=
                            null,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  "${formatter.format(controller.listCourse.value[e].price ?? 0)} đ",
                                  style: typoLight14.copyWith(
                                      color: colorSemanticRed100))
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                        controller.listCourse.value[e].price ==
                            null,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Miễn phí",
                                  style: typoLight14.copyWith(
                                      color: colorSemanticGreen100))
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: ElevatedButtonBase(
                          height: 32,
                          size: 14,
                          buttonTitle: "Học thử",
                          onPressed: () async {
                            // _scrollController.jumpTo(0);
                            await controller.toCourseDiscount(
                                controller.listCourse.value[e]);
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          )
              : Ink(),
          // Container(
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     boxShadow: boxShadow,
          //   ),
          //   padding: EdgeInsets.all(16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: ElevatedButtonBase(
          //           height: 40,
          //           size: 14,
          //           weight: FontWeight.w700,
          //           buttonTitle: "Học thử",
          //           onPressed: () async {
          //             Get.back();
          //           },
          //         ),
          //       ),
          //       SizedBox(
          //         width: 16,
          //       ),
          //       Expanded(
          //         child: ElevatedButtonBase(
          //           mainColor: colorSemanticRed100,
          //           height: 40,
          //           size: 14,
          //           weight: FontWeight.w700,
          //           buttonTitle: "Thêm vào giỏ",
          //           onPressed: () async {
          //             await controller.addToCart();
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
