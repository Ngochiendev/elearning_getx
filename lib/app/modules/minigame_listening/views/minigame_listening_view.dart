import 'package:bordered_text/bordered_text.dart';
import 'package:elearning/app/components/excercise/egg_result.dart';
import 'package:elearning/app/components/excercise/minigame_background_image.dart';
import 'package:elearning/app/components/excercise/minigame_box_option.dart';
import 'package:elearning/app/components/excercise/minigame_menu_bar.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/minigame_listening_controller.dart';

class MinigameListeningView extends GetView<MinigameListeningController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MinigameBackgroundImage(
            image: R.ASSETS_MINIGAME_BG_LISTEN_PNG,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MinigameMenuBar(
                reloadGame: controller.reloadGame,
                closeGame: controller.closeGame,
                confirmGame: controller.confirmGame,
                mute: controller.mute,
                titleImageAsset: R.ASSETS_MINIGAME_LISTENING_TITLE_PNG,
              ),
              Spacer(flex: 1),
              Container(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(80),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Text(
                        controller.question.mDisplayContent?.title ?? "Lắng nghe âm thanh",
                        style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Obx(
                          () => Image.asset(
                            controller.mascotImage.value,
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: controller.playQuestionAudio,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(127),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            alignment: Alignment.center,
                            child: Image.asset(
                              R.ASSETS_MINIGAME_LISTEN_SPEAKER_PNG,
                              width: 64,
                            ),
                          ),
                        ),
                        Spacer(),
                        EggResult(controller: controller.resultCtrl),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: (controller.question.mDisplayContent?.sets ?? [])
                          // .map(
                          //   (e) => MinigameBoxOption(
                          //     child: Html(data: e.content),
                          //     value: e,
                          //     eventBus: controller.eventGame,
                          //     onChoose: controller.chooseAnswer,
                          //   ),
                          // )
                          .map(
                            (e) => MinigameBoxOption(
                              child: html2Widget(e.content ?? ""),
                              value: e,
                              eventBus: controller.eventGame,
                              onChoose: controller.chooseAnswer,
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 8),
                    // Html(
                    //   data: controller.question.mDisplayContent?.answerExplanation ?? "",
                    //   style: {
                    //     "p": Style(
                    //       color: Color(0xff96440C),
                    //       padding: EdgeInsets.all(16),
                    //       fontSize: FontSize(16),
                    //       fontWeight: FontWeight.w900,
                    //     ),
                    //     "span": Style(
                    //       color: Color(0xff96440C),
                    //       padding: EdgeInsets.all(16),
                    //       fontSize: FontSize(16),
                    //       fontWeight: FontWeight.w900,
                    //     ),
                    //   },
                    // ),
                    BorderedText(
                      strokeColor: Color(0xffae5010),
                      strokeWidth: 8,
                      child: Text(
                        removeAllHtmlTags(controller.question.mDisplayContent?.answerExplanation ?? ""),
                        style: GoogleFonts.baloo(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2),
            ],
          )
        ],
      ),
    );
  }
}
