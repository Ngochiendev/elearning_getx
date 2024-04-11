import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  // FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('SearchView'),
        //   centerTitle: true,
        // ),
        body: SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: colorWhite,
                      boxShadow: boxShadow,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(R.ASSETS_SVG_IC_SEARCH_24_SVG),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            autofocus: false,
                            // onChanged: (text) {
                            //   if (text.length > 0) {
                            //     controller.isTypingSearch.value = true;

                            //     print(text);
                            //   } else {
                            //     controller.isTypingSearch.value = false;
                            //   }
                            // },
                            onSubmitted: (value) {
                              controller.tapSearchItem(value);
                            },
                            controller: controller.searchTextField,
                            textInputAction: TextInputAction.search,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
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
                  searchDefault(context),

                  // Visibility(
                  //     visible: !controller.isTypingSearch.value,
                  //     child: ),
                  // Visibility(
                  //     visible: controller.isTypingSearch.value,
                  //     child: typingSearch(context)),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget searchDefault(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Lớp học", style: typoBold14),
          SizedBox(
            height: 16,
          ),
          Container(
            child: GridView.count(
              childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 4),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              children: controller.listGrades.value
                  .map((e) => GestureDetector(
                        onTap: () {
                          controller.tapSearchGrade(e.id ?? 0);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: colorBorderViewSearch),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              e.name ?? "",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Text("Môn học", style: typoBold14),
          SizedBox(
            height: 16,
          ),
          Container(
            child: GridView.count(
              childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 5),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: controller.listCategoryCourse.value
                  .map((e) => GestureDetector(
                        onTap: () {
                          controller.tapSearchCate(e.id ?? 0);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: colorBorderViewSearch),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              e.name ?? "",
                              style: typoLight14,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Danh sách theo giáo viên ", style: typoBold14),
              InkWell(
                onTap: () {
                  controller.tapSearchTeacher();
                },
                child: Text("Xem thêm",
                    style: typoRegular12.copyWith(
                        decoration: TextDecoration.underline,
                        color: colorPrimaryBlue100)),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          )
        ],
      );

  // historySearch(BuildContext context) => Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text("Lịch sử tìm kiếm", style: typoBold14),
  //             Text("Xóa lịch sử",
  //                 style: typoRegular12.copyWith(
  //                     color: colorSemanticBlue100,
  //                     decoration: TextDecoration.underline)),
  //           ],
  //         ),
  //         SizedBox(
  //           height: 16,
  //         ),
  //         Column(
  //           children: controller.historys
  //               .take(5)
  //               .map((e) => GestureDetector(
  //                     onTap: () {
  //                       controller.tapSearchItem(e);
  //                     },
  //                     child: Container(
  //                       height: 32,
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.all(
  //                           Radius.circular(16),
  //                         ),
  //                       ),
  //                       child: Center(
  //                         child: Row(
  //                           children: [
  //                             SvgPicture.asset(R.ASSETS_SVG_IC_CLOCK_SVG,
  //                                 color: colorNeutralGray95),
  //                             SizedBox(
  //                               width: 16,
  //                             ),
  //                             Text(
  //                               e,
  //                               style: typoLight14,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ))
  //               .toList(),
  //         ),
  //       ],
  //     );

  // typingSearch(BuildContext context) => Column(
  //       children: [
  //         SizedBox(
  //           height: 16,
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: controller.typingList
  //               .map((e) => GestureDetector(
  //                     onTap: () {
  //                       controller.tapSearchItem(e);
  //                     },
  //                     child: Container(
  //                         margin: EdgeInsets.only(left: 32),
  //                         height: 32,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.all(
  //                             Radius.circular(16),
  //                           ),
  //                         ),
  //                         child: Text(
  //                           e,
  //                           style: typoLight14,
  //                         )),
  //                   ))
  //               .toList(),
  //         ),
  //       ],
  //     );

}
