import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/teacher_detail.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:elearning/generated/resource.dart';
import '../controllers/detail_couourse_teacher_controller.dart';

class DetailCouourseTeacherView
    extends GetView<DetailCouourseTeacherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(R.ASSETS_SVG_IC_BACK_BLACK_SVG),
          ),
        ),
        title: Text(
          "Giáo viên",
          style: typoBold16,
        ),
        backgroundColor: colorWhite,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [courseTeacher(context, controller.listCourseTeacher)],
        ),
      ),
    );
  }

  courseTeacher(BuildContext context, List<CourseDetailTeacher> list) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.listCourseTeacher.length > 0
                ? Wrap(
                    children: controller.listCourseTeacher
                        .map(
                          (e) => GestureDetector(
                              onTap: () => controller.toNatiDetail(e.id!),
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width - 64) /
                                        2,
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8)),
                                          ),
                                          child: AppNetworkImage(
                                            source: e.avatar ?? "",
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
                                                e.discountPercentage != null &&
                                                        e.isFree == false
                                                    ? Container(
                                                        width: 40,
                                                        height: 20,
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(16),
                                                          ),
                                                          color:
                                                              colorSemanticRed100,
                                                        ),
                                                        child: Text(
                                                          '-${e.discountPercentage ?? -50}' +
                                                              "%",
                                                          style: typoSemiBold10
                                                              .copyWith(
                                                                  color:
                                                                      colorWhite,
                                                                  fontSize: 8),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                    : SizedBox(height: 8),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e.title ?? "",
                                          style: typoLight14Course,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Container(
                                      height: 60,
                                      child: Visibility(
                                        child: Html(
                                          data: e.briefDescription ?? "",
                                          style: {
                                            '#': Style(
                                              color: colorNeutralGray60,
                                              fontSize: FontSize(12),
                                              maxLines: 3,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // height: 30,
                                      child: e.isFree == false
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        "${formatter.format(e.retailPrice ?? 0)} đ",
                                                        style:
                                                            typoBold12.copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          letterSpacing: 0.0,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    child: Text("",
                                                        style:
                                                            typoBold12.copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          letterSpacing: 0.0,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),
                                    Container(
                                      // height: 30,
                                      child: e.isFree == true
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text("Miễn phí",
                                                      style: typoBold14.copyWith(
                                                          color:
                                                              colorSemanticGreen100))
                                                ],
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "${formatter.format(e.price ?? 0)} đ",
                                                      style: typoBold14.copyWith(
                                                          color:
                                                              colorSemanticRed100,
                                                          letterSpacing: 0.0))
                                                ],
                                              ),
                                            ),
                                    ),
                                    // SizedBox(
                                    //   height: 8,
                                    // ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      child: ElevatedButtonBase(
                                        mainColor: e.isFree == true
                                            ? colorSemanticGreen100
                                            : colorPrimaryBlue100,
                                        height: 32,
                                        size: 14,
                                        buttonTitle: e.isFree == true
                                            ? "Học miễn phí"
                                            : e.isAllowTrial == 1
                                                ? "Học thử"
                                                : "Xem chi tiết",
                                        onPressed: () async {
                                          if (e.isFree == true) {
                                            controller
                                                .toNatiCouseLern(e.id ?? 0);
                                          } else if (e.isAllowTrial == 1) {
                                            Get.toNamed(Routes.COURE_TRAIL_PAGE,
                                                arguments: e.id ?? 0);
                                          } else {
                                            controller.toNatiDetail(e.id!);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                        .toList(),
                  )
                : Center(child: CircularProgressIndicator()),
          ],
        ),
      );
}
