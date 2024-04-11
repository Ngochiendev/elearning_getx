import 'package:elearning/app/components/app_expansion_tile.dart';
import 'package:elearning/app/components/app_expansion_title_children.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/controllers/ebook_details_controller.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbareBookPageView extends StatelessWidget {
  final controller = Get.find<EbookDetailsController>();

  TabbareBookPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: colorNeutralGray5)),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.showMore.value
                  ? controller.tableContent.length
                  : controller.tableContent.take(4).toList().length,
              itemBuilder: (context, item) => AppExpansionTile(
                title: Text(controller.tableContent[item].title ?? "",
                    style: typoBold14),
                initiallyExpanded: false,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        controller.tableContent[item].children?.length ?? 0,
                    itemBuilder: (context, index) => AppExpansionTileChildren(
                      title: Text(
                          controller
                                  .tableContent[item].children?[index].title ??
                              "",
                          style: typoBold14),
                      initiallyExpanded: false,
                      children: [
                        // ListView.builder(
                        //   physics: NeverScrollableScrollPhysics(),
                        //   shrinkWrap: true,
                        //   itemCount: controller.course.value.chapters?[item]
                        //           .sessions?[index].videos?.length ??
                        //       3,
                        //   itemBuilder: (context, video) => Row(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Container(
                        //           child: SvgPicture.asset(
                        //               R.ASSETS_SVG_IC_CALENDAR_SVG),
                        //         ),
                        //         SizedBox(
                        //           width: 8,
                        //         ),
                        //         Expanded(
                        //             child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Text(controller
                        //                     .course
                        //                     .value
                        //                     .chapters?[item]
                        //                     .sessions?[index]
                        //                     .videos?[video]
                        //                     .briefDescription ??
                        //                 ""),
                        //             SizedBox(
                        //               height: 8,
                        //             ),
                        //             Text("1 Video - 07:32"),
                        //           ],
                        //         )),
                        //       ]
                        //       // trailing: Text(
                        //       //   "Đọc thử",
                        //       //   style: typoRegular14.copyWith(
                        //       //       color: colorSemanticBlue100,
                        //       //       decoration:
                        //       //           TextDecoration.underline),
                        //       // ),
                        //       ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            controller.tableContent.length <= 4
                ? Container()
                : Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: styleButtonWhiteBorder,
                          child: Text(controller.showMore.value
                              ? "Thu gọn"
                              : "Xem thêm"),
                          onPressed: () {
                            // Get.back();
                            controller.ontapShowMore(controller.showMore.value);
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
