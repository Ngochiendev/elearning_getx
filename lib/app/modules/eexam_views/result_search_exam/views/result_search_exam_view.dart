import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/book_models/authors_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';
import 'package:elearning/app/modules/ebook_views.dart/result_search_ebook/views/result_search_ebook_view.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/result_search_exam_controller.dart';

class ResultSearchExamView extends GetView<ResultSearchExamController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorWhite,
      // endDrawer: SideMenuBook(),
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          // title: Text("Kết quả", style: typoBold24),
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
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16, right: 6, bottom: 16),
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
                                  hintText: LocaleKeys.placeHolder_searchHolder.tr,
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
                          margin: EdgeInsets.only(left: 6, right: 16, bottom: 16),
                          height: 48,
                          width: 48,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: colorWhite,
                            boxShadow: boxShadow,
                          ),
                          child: Obx(() => SvgPicture.asset(controller.hasFilter.value == true
                              ? R.ASSETS_SVG_IC_FILTER_RED_SVG
                              : R.ASSETS_SVG_IC_FILTER_BLACK_SVG)),
                        ))
                  ],
                ),
                Container(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await controller.tapCategory(0);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Liên quan",
                                      style: typoRegular12.copyWith(
                                          color:
                                              controller.index.value == 0 ? colorSemanticRed100 : colorNeutralGray90)),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: controller.index.value == 0 ? colorSemanticRed100 : Colors.transparent,
                                      borderRadius:
                                          BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                    ),
                                    height: 4,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   child: GestureDetector(
                      //     onTap: () async {
                      //       await controller.tapCategory(1);
                      //     },
                      //     child: Column(
                      //       children: [
                      //         // Align(
                      //         //   alignment: Alignment.centerLeft,
                      //         //   child: Text("Mới nhất",
                      //         //       style: typoRegular12.copyWith(
                      //         //           color: controller.index.value == 0
                      //         //               ? colorSemanticRed100
                      //         //               : colorNeutralGray90)),
                      //         // ),
                      //         SizedBox(
                      //           height: 4,
                      //         ),
                      //         SizedBox(
                      //           width: 30,
                      //         ),
                      //         Align(
                      //           alignment: Alignment.centerLeft,
                      //           child: Container(
                      //             width: 70,
                      //             decoration: BoxDecoration(
                      //               color: controller.index.value == 0
                      //                   ? colorSemanticRed100
                      //                   : Colors.transparent,
                      //               borderRadius: BorderRadius.only(
                      //                   topLeft: Radius.circular(8),
                      //                   topRight: Radius.circular(8)),
                      //             ),
                      //             height: 4,
                      //             clipBehavior: Clip.antiAliasWithSaveLayer,
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await controller.tapCategory(1);
                            controller.onTapMin(controller.min.value = !controller.min.value);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Giá",
                                        style: typoRegular12.copyWith(
                                            color:
                                                controller.index.value == 1 ? colorSemanticRed100 : colorNeutralGray90),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Obx(() => SvgPicture.asset(
                                        controller.min.value
                                            ? R.ASSETS_SVG_IC_ROWDOWNRED_SVG
                                            : R.ASSETS_SVG_IC_ROWUPBLACK_SVG,
                                        color: controller.index.value == 1 ? colorSemanticRed100 : colorNeutralGray90)),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: controller.index.value == 1 ? colorSemanticRed100 : Colors.transparent,
                                      borderRadius:
                                          BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                    ),
                                    height: 4,
                                    width: 45,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                examResualNow(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  examResualNow(BuildContext context) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            controller.listExams.value.length > 0
                ? Wrap(
                    children: controller.listExams
                        .map((e) => Container(
                              height: 390,
                              child: Container(
                                width: (MediaQuery.of(context).size.width - 64) / 2,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
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
                                              topRight: Radius.circular(8),
                                            ),
                                          ),
                                          child: AppNetworkImage(
                                            source: e.avatar ?? "",
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          "Đang diễn ra",
                                          style: TextStyle(
                                              fontSize: 9, color: colorSemanticGreen100, fontWeight: (FontWeight.bold)),
                                        )),
                                        width: 69,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: colorSemanticGreen60,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.title ?? "",
                                        style: typoBold16,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(R.ASSETS_SVG_IC_CLOCK_RED_SVG),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("30 phút"),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(R.ASSETS_SVG_IC_CLOCK_BLUE_SVG),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("${e.totalQuestions ?? 0} câu hỏi"),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 13),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "800.000 đ",
                                          style: TextStyle(decoration: TextDecoration.lineThrough),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 13),
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "200.000 đ/3 lượt",
                                        style: typoRegular14Redd,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            //margin: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(16)),
                                            ),
                                            child: ElevatedButtonBase(
                                              //titleColor: ,
                                              mainColor: colorSemanticRed100,
                                              height: 32,
                                              size: 14,
                                              buttonTitle: "Mua lượt thi",
                                              onPressed: () {},
                                              //child: null,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            margin: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(16)),
                                            ),
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                                  side: BorderSide(color: Colors.blue, width: 3)),
                                              //titleColor: ,
                                              // mainColor: colorSemanticRed100,
                                              // height: 32,
                                              // size: 14,
                                              // buttonTitle: "Mua lượt thi",
                                              onPressed: () {},
                                              child: Text("Thêm vào giỏ"),
                                              //child: null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList())
                : Container(
                    height: 500,
                    child: Center(
                      child: Text("Không có phần thi này"),
                    ),
                  )
          ],
        ),
      );
}
