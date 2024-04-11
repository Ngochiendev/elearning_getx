import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/result_search_controller.dart';

class ResultSearchView extends GetView<ResultSearchController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorWhite,
      endDrawer: NavDrawer(),
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        // title: Text(
        //   "Két quả tìm kiếm",
        //   style: typoBold24,
        // ),
        elevation: 0.5,
        backgroundColor: colorWhite,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(85),
            child: Obx(
              () => Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(16),
                          height: 48,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: colorWhite,
                            boxShadow: boxShadow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(R.ASSETS_SVG_IC_SEARCH_24_SVG),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  onChanged: (text) {
                                    // if (text.length > 0) {
                                    //   controller.isTypingSearch.value = true;

                                    //   print(text);
                                    // } else {
                                    //   controller.isTypingSearch.value = false;
                                    // }
                                  },
                                  onSubmitted: (value) {
                                    controller.tapSearch(value);
                                  },
                                  controller: controller.searchTextField,
                                  textInputAction: TextInputAction.search,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    // labelText: controller.textSearch.value,
                                    // label: Text(controller.textSearch.value),
                                    hintText:
                                        LocaleKeys.placeHolder_searchHolder.tr,
                                    hintStyle: typoRegular12,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: Container(
                            margin: EdgeInsets.all(16),
                            height: 48,
                            width: 48,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: colorWhite,
                              boxShadow: boxShadow,
                            ),
                            child: Obx(() => SvgPicture.asset(
                                controller.hasFilter.value == true
                                    ? R.ASSETS_SVG_IC_FILTER_RED_SVG
                                    : R.ASSETS_SVG_IC_FILTER_BLACK_SVG)),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await controller.tapCategory(0);
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(
                                          controller.keyT.value == "teacher"
                                              ? "Giáo viên"
                                              : "Liên quan",
                                          style: typoRegular12.copyWith(
                                              color: controller.index.value == 0
                                                  ? colorSemanticRed100
                                                  : colorNeutralGray90)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        color: controller.index.value == 0
                                            ? colorSemanticRed100
                                            : Colors.transparent,
                                      ),
                                      height: 4,
                                      width: 70,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await controller.tapCategory(2);
                            controller.onChangeMinMax(
                                controller.min.value = !controller.min.value);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                            child: Column(
                              children: [
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: Text(
                                            controller.keyT.value == "teacher"
                                                ? "Đánh giá"
                                                : "Giá",
                                            style: typoRegular12.copyWith(
                                                color:
                                                    controller.index.value == 2
                                                        ? colorSemanticRed100
                                                        : colorNeutralGray90),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Obx(
                                          () => SvgPicture.asset(
                                              controller.min.value
                                                  ? R
                                                      .ASSETS_SVG_IC_ROWDOWNRED_SVG
                                                  : R
                                                      .ASSETS_SVG_IC_ROWUPBLACK_SVG,
                                              color: controller.index.value == 2
                                                  ? colorSemanticRed100
                                                  : colorNeutralGray90),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 50,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      color: controller.index.value == 2
                                          ? colorSemanticRed100
                                          : Colors.transparent,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.keyT.value != "teacher"
                      ? controller.listCourse.value.length > 0
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
                                          childAspectRatio: 0.52,
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 0.0,
                                          mainAxisSpacing: 0.0),
                                  itemBuilder: (BuildContext context, int i) {
                                    return GestureDetector(
                                      onTap: () => controller.toNatiDetail(
                                          controller.listCourse[i]),
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
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 88,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: AppNetworkImage(
                                                    source: controller
                                                            .listCourse[i]
                                                            .avatar ??
                                                        "",
                                                    fit: BoxFit.cover,
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
                                                            : SizedBox(
                                                                height: 8),
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  controller.listCourse[i]
                                                          .title ??
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
                                              height: 25,
                                              child: Visibility(
                                                visible: controller
                                                        .listCourse[i].isFree ==
                                                    false,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8,
                                                          left: 8,
                                                          right: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                          "${controller.listCourse[i].retailPrice ?? 0} đ",
                                                          style: typoLight12.copyWith(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 25,
                                              child: controller.listCourse[i]
                                                          .isFree ==
                                                      true
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8,
                                                              left: 8,
                                                              right: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
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
                                                              bottom: 8,
                                                              left: 8,
                                                              right: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                              "${formatter.format(controller.listCourse[i].price ?? 0)} đ",
                                                              style: typoLight14
                                                                  .copyWith(
                                                                      color:
                                                                          colorSemanticRed100))
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
                                                        : "Học thử",
                                                onPressed: () async {
                                                  controller.toNatiDetail(
                                                      controller.listCourse[i]);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container(
                              height: 500,
                              child: Center(
                                child: Text("Không có khóa học này"),
                              ),
                            )
                      : controller.listTeacherData.length > 0
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
                                  itemCount: controller.listTeacherData.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.8,
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 0.0,
                                          mainAxisSpacing: 0.0),
                                  itemBuilder: (BuildContext context, int i) {
                                    return GestureDetector(
                                      onTap: () => controller
                                          .tapSeeDetailTeacher(controller
                                              .listTeacherData[i].teacher!.id!),
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
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 88,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: controller
                                                          .listTeacherData[i]
                                                          .teacher
                                                          ?.attributes
                                                          ?.avatar ==
                                                      ""
                                                  ? SvgPicture.asset(
                                                      R.ASSETS_SVG_DEFAULTTEACHER_SVG,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                    )
                                                  : AppNetworkImage(
                                                      source:
                                                          "$baseUrlImage${controller.listTeacherData[i].teacher!.attributes?.avatar}",
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  controller.listTeacherData[i]
                                                          .teacher!.firstName ??
                                                      "",
                                                  style: typoLight14,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    R.ASSETS_SVG_AKAR_ICONS_FILE_SVG,
                                                    color: colorPrimaryBlue100,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                      "${controller.listTeacherData[i].totalCourse} khóa học",
                                                      style: typoLight14,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Tiếng anh, Toán",
                                                  style: typoRegular12,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "${controller.listTeacherData[i].totalRating} ",
                                                      style: typoLight14,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  SvgPicture.asset(
                                                    R.ASSETS_SVG_IC_STAR_YELLOW_SVG,
                                                    width: 13,
                                                    height: 13,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container(
                              height: 500,
                              child: Center(
                                child: Text("Không có giáo viên nào"),
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
  final controller = Get.put(ResultSearchController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: colorWhite,
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  // padding: EdgeInsets.zero,
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
                                  child: controller.selectedGrades
                                              .contains(e.id) ==
                                          true
                                      ? Container(
                                          margin: EdgeInsets.all(8),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: controller.selectedGrades
                                                    .contains(e.id)
                                                ? colorPrimaryBlue10
                                                : null,
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.blue,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              e.name,
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              textAlign: TextAlign.center,
                                            ),
                                          ))
                                      : Container(
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
                                              width: 1,
                                              color: colorBorderViewSearch,
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
                                    controller. toggleCategory(e.id);
                                  },
                                  child: controller.selectedCategorys
                                              .contains(e.id) ==
                                          true
                                      ? Container(
                                          margin: EdgeInsets.all(8),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: controller.selectedCategorys
                                                    .contains(e.id)
                                                ? colorPrimaryBlue10
                                                : null,
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.blue,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              e.name,
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              textAlign: TextAlign.center,
                                            ),
                                          ))
                                      : Container(
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
                                              width: 1,
                                              color: colorBorderViewSearch,
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
                    controller.keyT.value == "teacher"
                        ? Container()
                        : Text(
                            'Theo Độ dài',
                            style: typoRegular16.copyWith(
                                color: colorPrimaryBlue100),
                          ),
                    controller.keyT.value == "teacher"
                        ? Container()
                        : Container(
                            child: GridView.count(
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 4),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              children: controller.listLengthVideo
                                  .map((e) => GestureDetector(
                                      onTap: () {
                                        controller.toggleTime(e);
                                      },
                                      child: controller.isSelect.contains(e) ==
                                              true
                                          ? Container(
                                              margin: EdgeInsets.all(8),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 8),
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: controller.isSelect
                                                        .contains(e)
                                                    ? colorPrimaryBlue10
                                                    : null,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.blue),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(16),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  e,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.all(8),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 8),
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: controller.isSelect
                                                        .contains(e)
                                                    ? colorPrimaryBlue10
                                                    : colorNeutralGray5,
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        colorBorderViewSearch),
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
                                            )))
                                  .toList(),
                            ),
                          ),
                    controller.keyT.value == "teacher"
                        ? Container()
                        : Row(
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
