import 'package:elearning/app/modules/cource_views/coure_learn/controllers/coure_learn_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentBookPage extends StatelessWidget {
  final controller = Get.find<CoureLearnController>();
  DocumentBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        children: controller.course.value.chapters!
            .map((e) => Column(
                  children: e.sessions!
                      .where((e1) => e1.id == controller.video.value.sessionId)
                      .map((e2) =>e2.documents!.length==0?Center(child: Text("Không có tài liệu "),): Container(
                            margin: EdgeInsets.only(bottom: 16,top:16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: colorNeutralGray40),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child:   Column(
                              children: e2.documents!
                                  .map(
                                    (element) => InkWell(
                                      onTap: () {
                                        launch(element.source ?? "");
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
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
                                                Container(
                                                  width: (MediaQuery.of(context).size.width)*0.6,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 8,
                                                                  horizontal: 16),
                                                          child: Row(
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                    element.fileName ??
                                                                        "",
                                                                       maxLines: 1,
                                                                       overflow: TextOverflow.ellipsis,
                                                                    style: typoBold14),
                                                              ),
                                                            ],
                                                          )),
                                                              Row(children: [
                                                                Text(
                                                                  fullStringTimeFormat(
                                                                  element.updatedAt ??
                                                                      ""),
                                                              style: typoRegular12
                                                                  .copyWith(
                                                                      color:
                                                                          colorNeutralGray60)
                                                                ),
                                                                SizedBox(width: 8,),
                                                                  Text(
                                                                  ".${element
                                                                      .fileType ??""}"
                                                                  ,
                                                              style: typoRegular12
                                                                  .copyWith(
                                                                      color:
                                                                          colorNeutralGray60)
                                                                )
                                                              ],),
                                                    ],
                                                  ),
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
