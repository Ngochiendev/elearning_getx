import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/modules/cource_views/result_search/views/result_search_view.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/detail_category_product_controller.dart';

class DetailCategoryProductView
    extends GetView<DetailCategoryProductController> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey1,
        endDrawer: NavDrawer(),
        endDrawerEnableOpenDragGesture: false,
        appBar: AppBar(
          backgroundColor: colorWhite,
          title: Text(
            controller.title.value,
            style: typoBold24,
          ),
          centerTitle: true,
          leading: BackButton(
            color: colorBlack,
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  _scaffoldKey1.currentState!.openEndDrawer();
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  height: 48,
                  width: 48,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: colorWhite,
                    boxShadow: boxShadow,
                  ),
                  child: Obx(() => SvgPicture.asset(
                      controller.hasFilter.value == true
                          ? R.ASSETS_SVG_IC_FILTER_RED_SVG
                          : R.ASSETS_SVG_IC_FILTER_BLACK_SVG)),
                ))
          ],
          // bottom: PreferredSize(
          //     preferredSize: Size.fromHeight(56),
          //     child: GestureDetector(
          //         // onTap: () {
          //         //   _scaffoldKey.currentState!.openEndDrawer();
          //         // },
          //         child: Container(
          //       margin: EdgeInsets.all(16),
          //       height: 48,
          //       width: 48,
          //       padding: EdgeInsets.symmetric(horizontal: 12),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.all(Radius.circular(8)),
          //         color: colorWhite,
          //         boxShadow: boxShadow,
          //       ),
          //       child: Obx(() => SvgPicture.asset(
          //           controller.hasFilter.value == true
          //               ? R.ASSETS_SVG_IC_FILTER_RED_SVG
          //               : R.ASSETS_SVG_IC_FILTER_BLACK_SVG)),
          //     ))),
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  controller.listCourse.value.length > 0
                      ? Expanded(
                          child: SmartRefresher(
                            controller: controller.refreshController!,
                            header: WaterDropHeader(),
                            footer: ClassicFooter(),
                            enablePullDown: false,
                            enablePullUp: true,
                            onRefresh: () => print("onRefresh"),
                            onLoading: () => controller.onLoading(),
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: controller.listCourse.value.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 0.55,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 0.0,
                                        mainAxisSpacing: 0.0),
                                itemBuilder: (BuildContext context, int i) {
                                  return GestureDetector(
                                    onTap: () => controller
                                        .toNatiDetail(controller.listCourse[i]),
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  64) /
                                              2,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          color: colorWhite,
                                          boxShadow: boxShadow),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 92,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8)),
                                                ),
                                                child: AppNetworkImage(
                                                  source: controller
                                                          .listCourse[i]
                                                          .avatar ??
                                                      "",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                  left: 16,
                                                  top: 8,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      controller.listCourse[i]
                                                                  .discountPercentage !=
                                                              null
                                                          ? Container(
                                                              width: 40,
                                                              height: 20,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          16),
                                                                ),
                                                                color:
                                                                    colorSemanticRed100,
                                                              ),
                                                              child: Text(
                                                                '-${controller.listCourse[i].discountPercentage ?? -50}' +
                                                                    "%",
                                                                style: typoSemiBold10
                                                                    .copyWith(
                                                                        color:
                                                                            colorWhite,
                                                                        fontSize:
                                                                            8),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
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
                                                      //       color: colorWhite, fontSize: 8),
                                                      // ),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                controller
                                                        .listCourse[i].title ??
                                                    "",
                                                style: typoLight14,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Container(
                                            height: 60,
                                            child: Html(
                                              data: controller.listCourse[i]
                                                      .briefDescription ??
                                                  "",
                                              style: {
                                                '#': Style(
                                                  fontSize: FontSize(12),
                                                  maxLines: 3,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            // height: 30,
                                            child: Visibility(
                                              visible: controller
                                                      .listCourse[i].isFree ==
                                                  false,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4, left: 8, right: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                        "${formatter.format(controller.listCourse[i].retailPrice) } đ",
                                                        style: typoLight12
                                                            .copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          letterSpacing: 0.0,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          controller.listCourse[i].isFree ==
                                                  true
                                              ? SizedBox(
                                                  height: 16,
                                                )
                                              : Container(),
                                          Container(
                                            height: 30,
                                            child: controller
                                                        .listCourse[i].isFree ==
                                                    true
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8,
                                                            left: 8,
                                                            right: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text("Miễn phí",
                                                            style: typoLight14
                                                                .copyWith(
                                                                    color:
                                                                        colorSemanticGreen100))
                                                      ],
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4,
                                                            left: 8,
                                                            right: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                            "${formatter.format(controller.listCourse[i].price ?? 0)} đ",
                                                            style: typoBold14
                                                                .copyWith(
                                                              color:
                                                                  colorSemanticRed100,
                                                              letterSpacing:
                                                                  0.0,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                            ),
                                            child: ElevatedButtonBase(
                                              mainColor: controller
                                                          .listCourse[i]
                                                          .isFree ==
                                                      true
                                                  ? colorSemanticGreen100
                                                  : colorPrimaryBlue100,
                                              height: 32,
                                              size: 14,
                                              buttonTitle: controller
                                                          .listCourse[i]
                                                          .isFree ==
                                                      true
                                                  ? "Học miễn phí"
                                                  : controller.listCourse[i]
                                                              .isAlreadyPurchased ==
                                                          1
                                                      ? "Học tiếp"
                                                      : controller.listCourse[i]
                                                                  .isAllowTrial ==
                                                              1
                                                          ? "Học thử"
                                                          : "Xem chi tiết",
                                              onPressed: () async {
                                                if (controller.listCourse[i]
                                                            .isFree ==
                                                        true ||
                                                    controller.listCourse[i]
                                                            .isAlreadyPurchased ==
                                                        1) {
                                                  controller.toNatiCouseLern(
                                                      controller.listCourse[i]
                                                              .id ??
                                                          0);
                                                } else if (controller
                                                        .listCourse[i]
                                                        .isAllowTrial ==
                                                    1) {
                                                  controller
                                                      .toNatiCouseLernTrail(
                                                          controller
                                                                  .listCourse[i]
                                                                  .id ??
                                                              0);
                                                } else {
                                                  controller.toNatiDetail(
                                                      controller.listCourse[i]);
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )
                      : Container(
                          height: 500,
                          child: Center(
                            child: Text("Không có khóa học này"),
                          ),
                        )
                ],
              ),
            )),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  final controller = Get.put(DetailCategoryProductController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: colorWhite,
            child: Obx(
              () => DraggableScrollbar.semicircle(
                backgroundColor: colorNeutralGray20,
                controller: controller.semicircleController,
                child: ListView(
                  controller: controller.semicircleController,
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chọn Lớp học',
                          style: typoBold18,
                        ),
                        GestureDetector(
                            onTap: () => Get.back(),
                            child:
                                SvgPicture.asset(R.ASSETS_SVG_IC_CANCEL_SVG)),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      height: 1,
                      decoration: BoxDecoration(
                        color: colorNeutralGray5,
                        boxShadow: boxShadow,
                      ),
                    ),
                    Text(
                      'Theo Lớp',
                      style: typoRegular16.copyWith(color: colorPrimaryBlue100),
                    ),
                    Container(
                      child: GridView.count(
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 4),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: controller.nameClasses
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    controller.toggleIssue(e.id);
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: controller.selectedGrades
                                                .contains(e.id)
                                            ? colorPrimaryBlue10
                                            : colorNeutralGray5,
                                        border: Border.all(
                                          width: 2,
                                          color: controller.selectedGrades
                                                  .contains(e.id)
                                              ? colorPrimaryBlue40
                                              : colorNeutralGray5,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          e.name,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ))
                            .toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              controller.nameClasses.length > 4
                                  ? controller.tapSeeLessGrade()
                                  : controller.tapSemoreGrade();
                            },
                            child: Text(
                                controller.nameClasses.length > 4
                                    ? "Thu gọn"
                                    : "Xem thêm",
                                style: typoRegular12.copyWith(
                                    color: colorSemanticBlue100)))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Theo Môn học',
                      style: typoRegular16.copyWith(color: colorPrimaryBlue100),
                    ),
                    Container(
                      child: GridView.count(
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 4),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: controller.listCategories
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    controller.toggleCategory(e.id);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    // height: 40,
                                    decoration: BoxDecoration(
                                      color: controller.selectedCategorys
                                              .contains(e.id)
                                          ? colorPrimaryBlue10
                                          : colorNeutralGray5,
                                      border: Border.all(
                                        width: 2,
                                        color: controller.selectedCategorys
                                                .contains(e.id)
                                            ? colorPrimaryBlue40
                                            : colorNeutralGray5,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        e.name,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              controller.listCategories.length > 4
                                  ? controller.tapSeeLessCategory()
                                  : controller.tapSemoreCategory();
                            },
                            child: Text(
                                controller.listCategories.length > 4
                                    ? "Thu gọn"
                                    : "Xem thêm",
                                style: typoRegular12.copyWith(
                                    color: colorSemanticBlue100)))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Theo Độ dài',
                      style: typoRegular16.copyWith(color: colorPrimaryBlue100),
                    ),
                    Container(
                      child: GridView.count(
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 4),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: controller.listLengthVideo
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    controller.toggleTime(e);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: controller.isSelect.contains(e)
                                          ? colorPrimaryBlue10
                                          : colorNeutralGray5,
                                      border: Border.all(
                                        width: 2,
                                        color: controller.isSelect.contains(e)
                                            ? colorPrimaryBlue40
                                            : colorNeutralGray5,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),

                    // Text(
                    //   'Theo Giáo viên',
                    //   style: typoRegular16.copyWith(color: colorPrimaryBlue100),
                    // ),
                    // Container(
                    //   child: GridView.count(
                    //     childAspectRatio: MediaQuery.of(context).size.width /
                    //         (MediaQuery.of(context).size.height / 4),
                    //     physics: NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     crossAxisCount: 2,
                    //     children: controller.nameClasses
                    //         .map((e) => GestureDetector(
                    //               onTap: () {
                    //                 controller.toggleIssue(e.id);
                    //               },
                    //               child: Container(
                    //                 margin: EdgeInsets.all(8),
                    //                 padding: EdgeInsets.symmetric(
                    //                     horizontal: 16, vertical: 8),
                    //                 height: 40,
                    //                 decoration: BoxDecoration(
                    //                   color:
                    //                       controller.selectedGrades.contains(e.id)
                    //                           ? colorPrimaryBlue10
                    //                           : null,
                    //                   border: Border.all(
                    //                       width: 1, color: colorBorderViewSearch),
                    //                   borderRadius: BorderRadius.all(
                    //                     Radius.circular(16),
                    //                   ),
                    //                 ),
                    //                 child: Center(
                    //                   child: Text(
                    //                     e.name,
                    //                     textAlign: TextAlign.center,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ))
                    //         .toList(),
                    //   ),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     TextButton(
                    //         onPressed: () {
                    //           controller.nameClasses.length > 4
                    //               ? controller.tapSeeLessGrade()
                    //               : controller.tapSemoreGrade();
                    //         },
                    //         child: Text(
                    //             controller.nameClasses.length > 4
                    //                 ? "Thu gọn"
                    //                 : "Xem thêm",
                    //             style: typoRegular12.copyWith(
                    //                 color: colorSemanticBlue100)))
                    //   ],
                    // ),

                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 3 / 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: boxShadow,
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: styleButtonWhiteBorder,
                        child: Text("Hủy bỏ"),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Obx(() => ElevatedButtonBase(
                            state: controller.selectedGrades.value.length > 0 ||
                                    controller.selectedCategorys.value.length >
                                        0 ||
                                    controller.isSelect.value.length > 0
                                ? AppElevatedButtonState.active
                                : AppElevatedButtonState.inactive,
                            height: 40,
                            size: 14,
                            weight: FontWeight.w700,
                            buttonTitle: "Áp dụng",
                            onPressed: () async {
                              await controller.tapSubmit();
                            },
                          )),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
