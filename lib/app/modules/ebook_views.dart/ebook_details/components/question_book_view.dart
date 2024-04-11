import 'package:elearning/app/components/app_expansion_tile.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/controllers/ebook_details_controller.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class QuestionBookPage extends StatelessWidget {
  final controller = Get.find<EbookDetailsController>();
  QuestionBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(
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
              itemCount: controller.questionContent.length,
              itemBuilder: (context, item) => AppExpansionTile(
                title: Text(controller.questionContent[item].question ?? "",
                    style: typoBold14),
                initiallyExpanded: false,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Html(
                    data: controller.questionContent[item].answer.toString(),
                    style: {
                      '#': Style(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: FontSize(14),
                        letterSpacing: 1.02,
                        color: colorNeutralGray90,
                      ),
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: styleButtonWhiteBorder,
                    child: Text("Xem thêm"),
                    onPressed: () {
                      // Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
