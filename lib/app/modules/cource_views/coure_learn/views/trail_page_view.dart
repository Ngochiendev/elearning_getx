import 'package:elearning/app/modules/cource_views/coure_learn/controllers/coure_learn_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentTrailCourePage extends StatelessWidget {
  final controller = Get.find<CoureLearnController>();
  DocumentTrailCourePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        children: controller.course.value.trialChapters!
            .map((e) => Column(
                  children: e.sessions!
                      .where((e1) => e1.id == controller.video.value.sessionId!)
                      .map((e2) => Container(
                            margin: EdgeInsets.only(bottom: 16,top:16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: colorNeutralGray40),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Column(
                              children: e2.documents!
                                  .map(
                                    (element) => InkWell(
                                      onTap: () {
                                        launch(element.source ?? "");
                                      },
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    width: 60,
                                                    height: 60,
                                                    padding: EdgeInsets.all(16),
                                                    child: Container(
                                                      width: 2,
                                                      height: 5,
                                                      child: SvgPicture.asset(
                                                        R.ASSETS_SVG_AKAR_ICONS_FILE_SVG,
                                                      ),
                                                    )),
                                                Column(
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 8,
                                                                horizontal: 16),
                                                        child: Text(
                                                            element.fileName ??
                                                                "",
                                                            style: typoBold14)),
                                                    RichText(
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                            text: fullStringTimeFormat(
                                                                element.updatedAt ??
                                                                    ""),
                                                            style: typoRegular12
                                                                .copyWith(
                                                                    color:
                                                                        colorNeutralGray60),
                                                          ),
                                                          TextSpan(text: "   "),
                                                          TextSpan(
                                                            text: element
                                                                    .fileType ??
                                                                "",
                                                            style: typoRegular12
                                                                .copyWith(
                                                                    color:
                                                                        colorNeutralGray60),
                                                          ),
                                                        ])),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                                width: 60,
                                                    height: 60,
                                                    padding: EdgeInsets.all(16),
                                                child: Container(
                                                  width: 2,
                                                  height: 5,
                                                  child: SvgPicture.asset(
                                                    R.ASSETS_SVG_FLUENT_ARROW_DOWNLOAD_24_FILLED_SVG,
                                                    color: colorBlack,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}
