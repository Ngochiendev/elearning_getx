import 'package:elearning/app/components/excercise/minigame_background_image.dart';
import 'package:elearning/app/components/excercise/minigame_menu_bar.dart';
import 'package:elearning/app/components/excercise/movement_result.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/minigame_reorder_controller.dart';

class MinigameReorderView extends GetView<MinigameReorderController> {
  @override
  Widget build(BuildContext context) {
    final itemLength = (controller.question.mDisplayContent?.sets ?? []).length;
    final boxWidth = MediaQuery.of(context).size.width * 0.8 / (itemLength > 0 ? itemLength : 1);
    return Scaffold(
      body: Stack(
        children: [
          MinigameBackgroundImage(
            image: R.ASSETS_MINIGAME_BG_SORT_PNG,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MinigameMenuBar(
                reloadGame: controller.reloadGame,
                closeGame: controller.closeGame,
                confirmGame: controller.confirmGame,
                mute: controller.mute,
                titleImageAsset: R.ASSETS_MINIGAME_REORDER_TITLE_PNG,
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(80),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  controller.question.mDisplayContent?.title ?? "Xếp từ theo đúng thứ tự để thành câu",
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                ),
              ),
              Spacer(flex: 1),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: 0,
                    left: -(MediaQuery.of(context).size.width * 0.1),
                    child: Obx(
                      () => Image.asset(
                        controller.mascotImage.value,
                        height: 150,
                      ),
                    ),
                  ),
                  MovementResult(
                    controller: controller.movementResultCtrl,
                  ),
                  DragTarget<Sets>(
                    onAccept: (data) {
                      controller.addDraggableToTarget(data);
                    },
                    builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.6 * 0.14,
                        child: Stack(
                          children: [
                            Image.asset(
                              R.ASSETS_MINIGAME_BOARDS_PNG,
                              fit: BoxFit.fill,
                            ),
                            Align(
                              child: Obx(
                                () => Text(
                                  controller.list.map((element) => element.content).join(" "),
                                  style: GoogleFonts.itim(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff832f00),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              Spacer(flex: 1),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: (controller.question.mDisplayContent?.sets ?? [])
                      .map(
                        (element) => Draggable<Sets>(
                          data: element,
                          feedback: Container(
                            width: boxWidth,
                            height: 32,
                            child: !controller.list.contains(element)
                                ? Stack(
                                    children: [
                                      Image.asset(
                                        R.ASSETS_MINIGAME_BOARDS_PNG,
                                        fit: BoxFit.fill,
                                        width: boxWidth,
                                        height: 32,
                                      ),
                                      Center(
                                        child: Text(
                                          element.content ?? "",
                                          style: GoogleFonts.itim(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff832f00),
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                          child: Container(
                            width: boxWidth,
                            height: 32,
                            child: !controller.list.contains(element)
                                ? Stack(
                                    children: [
                                      Image.asset(
                                        R.ASSETS_MINIGAME_BOARDS_PNG,
                                        fit: BoxFit.fill,
                                        width: boxWidth,
                                        height: 32,
                                      ),
                                      Center(
                                        child: Text(
                                          element.content ?? "",
                                          style: GoogleFonts.itim(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff832f00),
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                          childWhenDragging: Container(
                            width: boxWidth,
                            height: 32,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
