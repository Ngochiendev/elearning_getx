import 'package:elearning/app/components/excercise/minigame_background_image.dart';
import 'package:elearning/app/components/excercise/minigame_menu_bar.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/minigame_drag_and_drop_controller.dart';
import 'dart:math';

class MinigameDragAndDropView extends GetView<MinigameDragAndDropController> {
  @override
  Widget build(BuildContext context) {
    final itemLength = (controller.question.mDisplayContent?.sets ?? []).length;
    final boxSize = MediaQuery.of(context).size.width * 0.5 / [itemLength, 4].reduce(max);
    final rootSize = boxSize * 1.2;
    return Scaffold(
      body: Stack(
        children: [
          MinigameBackgroundImage(
            image: R.ASSETS_MINIGAME_BG_DRAG_PNG,
          ),
          // Positioned(
          //   bottom: 10,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         ...(controller.question.mDisplayContent?.items ?? [])
          //             .map((e) => Container(
          //                   width: rootSize,
          //                   child: Image.asset(R.ASSETS_MINIGAME_ROOT_TREE_PNG),
          //                 ))
          //             .toList(),
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => controller.stateCorrect.value
                      ? Image.asset(
                          R.ASSETS_MINIGAME_IC_WIN_2_PNG,
                          width: 64,
                        )
                      : Container(),
                ),
                SizedBox(width: 80),
                Obx(
                  () => controller.stateWrong.value
                      ? Image.asset(
                          R.ASSETS_MINIGAME_IC_LOST_2_PNG,
                          width: 64,
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MinigameMenuBar(
                reloadGame: controller.reloadGame,
                closeGame: controller.closeGame,
                confirmGame: controller.confirmGame,
                mute: controller.mute,
                titleImageAsset: R.ASSETS_MINIGAME_DRAG_DROP_TITLE_PNG,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(80),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  controller.question.mDisplayContent?.title ?? "Kéo đáp án vào đúng khu vực gợi ý",
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: (controller.question.mDisplayContent?.sets ?? []).map((e) {
                    final index = controller.question.mDisplayContent!.sets!.indexOf(e);
                    final item = (controller.question.mDisplayContent?.items ?? []).length > index ? controller.question.mDisplayContent!.items![index] : null;
                    return Column(
                      children: [
                        SizedBox(height: 16),
                        DragTarget<Sets>(
                          onAccept: (data) {
                            controller.addDraggableToTarget(data, e);
                          },
                          // builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
                          //   return Container(
                          //     width: boxSize,
                          //     height: boxSize,
                          //     child: Stack(
                          //       children: [
                          //         Image.asset(R.ASSETS_MINIGAME_BOX_MATCHED_PNG),
                          //         html2WidgetDragDrop(e.content ?? ""),
                          //         Obx(() => controller.findAnserEachTarget(e.id ?? 0) != null ? html2WidgetDragDrop(controller.findAnserEachTarget(e.id ?? 0)?.content ?? "") : Container()),
                          //       ],
                          //     ),
                          //   );
                          // },
                          builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
                            return Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                html2WidgetDragDrop(e.content ?? "", type: 2, width: boxSize),
                                Obx(() => controller.findAnserEachTarget(e.id ?? 0) != null ? html2WidgetDragDrop(controller.findAnserEachTarget(e.id ?? 0)?.content ?? "", type: 3, width: boxSize) : Container()),
                              ],
                            );
                          },
                        ),
                        Spacer(),
                        Obx(
                          () => Draggable<Sets>(
                            data: item,
                            feedback: controller.result.contains(item) ? Container() : html2WidgetDragDrop(item?.content ?? "", width: boxSize),
                            child: controller.result.contains(item) ? Container() : html2WidgetDragDrop(item?.content ?? "", width: boxSize),
                            childWhenDragging: Container(),
                          ),
                        ),
                        Container(
                          width: rootSize,
                          child: Image.asset(R.ASSETS_MINIGAME_ROOT_TREE_PNG),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
