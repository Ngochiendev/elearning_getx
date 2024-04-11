import 'package:elearning/app/data/models/liveclass_models/docs_liveclass_models.dart';
import 'package:elearning/app/data/models/liveclass_models/message_models.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/live_class_textbook_controller.dart';

class LiveClassTextbookView extends GetView<LiveClassTextbookController> {
  timeLine(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
        // Text("xxxx"),
        // Expanded(child: Container(color: colorNeutralGray100))
        Center(
            child: Container(
          width: 2,
          height: 14,
          decoration: BoxDecoration(color: colorPrimaryBlue100),
        )),
        Center(
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: colorPrimaryBlue100, borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),

        Container(
          width: 2,
          height: 270,
          decoration: BoxDecoration(color: colorPrimaryBlue100),
        ),
      ]);

  // ]),

  childList1(DataDocsLiveModel? data) => ListView.builder(
      shrinkWrap: true,
      itemCount: data?.dataChildFirst?.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, idData) => Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data?.dataChildFirst?[idData].title ?? "", style: typoBold14.copyWith(color: colorNeutralGray100)),
                SizedBox(
                  height: 16,
                ),
                childList2(data?.dataChildFirst?[idData]),
              ],
            ),
          ));

  childList2(DataChildLiveModel? dataChild) {
    List<ExerciseLiveModel>? exercisesModel;
    List<AttachmentModel>? attachmentsModel;
    if (dataChild != null && dataChild.exercises != null && dataChild.exercises!.length > 0) {
      exercisesModel = dataChild.exercises!;
    }
    if (dataChild != null && dataChild.attachments != null && dataChild.attachments!.length > 0) {
      attachmentsModel = dataChild.attachments;
    }
    return Column(
      children: [
        attachmentsModel != null
            ? Wrap(
                children: attachmentsModel
                    .map(
                      (element) => GestureDetector(
                          onTap: () {
                            if (element.url != null) {
                              launch(element.url!);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(R.ASSETS_SVG_IC_EXCERSICELIV_SVG),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text(element.name ?? "",
                                        style: typoBold12.copyWith(color: colorNeutralGray100))),
                                SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(R.ASSETS_SVG_IC_DOWNLOAD_LIV_SVG),
                              ],
                            ),
                          )),
                    )
                    .toList(),
              )
            : Ink(),
        exercisesModel != null
            ? Wrap(
                children: exercisesModel
                    .map(
                      (element) => GestureDetector(
                        onTap: () {
                          controller.demoToExercise(element.exerciseId!);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(R.ASSETS_SVG_IC_DOCLIV_SVG),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Text(element.title ?? "",
                                      style: typoBold12.copyWith(color: colorNeutralGray100))),
                              SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(R.ASSETS_SVG_IC_GAMESTATION_SVG, color: colorNeutralGray90),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            : Ink(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF4F5),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Obx(() => Text(
                'Giáo trình (${controller.listData.value.dataDocs?.length})',
                style: typoBold24,
              )),
          centerTitle: true,
          leading: BackButton(
            color: colorBlack,
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xFFFCF4F5), boxShadow: boxShadow),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listData.value.dataDocs?.length,
            itemBuilder: (context, id) {
              final doc = controller.listData.value.dataDocs?[id];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                // height: MediaQuery.of(context).size.height / 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    timeLine(context),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(doc?.title ?? "", style: typoBold16.copyWith(color: colorNeutralGray100)),
                          SizedBox(
                            height: 16,
                          ),
                          childList1(doc),
                        ]),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
