import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/search_exam_controller.dart';

class SearchExamView extends GetView<SearchExamController> {
  //final controller = Get.find<SearchExamController>();
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
                              hintText: "Nhập nội dung cần tìm kiếm",
                              hintStyle: typoRegular14.copyWith(color: colorNeutralGray60),
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
                  searchDefault(context)
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
          Text("Hot search", style: typoBold14),
          SizedBox(
            height: 16,
          ),
          Container(
            child: GridView.count(
              childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 5),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: controller.listSubjectBook.value
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.RESULT_SEARCH_EXAM,
                          // arguments: {"subject": e.id ?? 0}
                        );
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
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
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
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
          // InkWell(
          //                 customBorder: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(12),
          //                 ),
          //                 onTap: () {
          //                   controller.tapSearchGrade(e.id ?? 0);
          //                 },
          //                 child:
          SizedBox(
            height: 16,
          ),
          Text("Môn học", style: typoBold14),
          SizedBox(
            height: 16,
          ),
          Column(
            children: controller.listCategoryCourse.value
                .map((e) => GestureDetector(
                      onTap: () {
                        // Get.toNamed(Routes.RESULT_SEARCH_EBOOK,
                        //     arguments: {"subject": e.id ?? 0});
                        controller.tapSearchCate(e.id ?? 0);
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: colorBorderViewSearch),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(child: SvgPicture.asset(R.ASSETS_SVG_IC_PRIMARYSCHOOL_SVG)),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              child: Text(
                                e.name ?? "",
                                style: typoLight14,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(
            height: 56,
          ),
        ],
      );
}
