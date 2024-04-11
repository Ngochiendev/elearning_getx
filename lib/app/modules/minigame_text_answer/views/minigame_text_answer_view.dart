import 'package:elearning/app/components/excercise/minigame_background_image.dart';
import 'package:elearning/app/components/excercise/minigame_menu_bar.dart';
import 'package:elearning/app/components/excercise/shake_widget.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/minigame_text_answer_controller.dart';

class MinigameTextAnswerView extends GetView<MinigameTextAnswerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // TextField(
          //   controller: controller.inputCtrl,
          //   focusNode: controller.inputNode,
          //   showCursor: false,
          //   onChanged: (text) {
          //     controller.setInput(text);
          //   },
          //   onEditingComplete: controller.onComplete,
          // ),
          MinigameBackgroundImage(
            image: R.ASSETS_MINIGAME_BG_ENTER_PNG,
          ),
          SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            // physics: const NeverScrollableScrollPhysics(),
            controller: controller.scrollCtrl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MinigameMenuBar(
                  reloadGame: controller.reloadGame,
                  closeGame: controller.closeGame,
                  confirmGame: controller.confirmGame,
                  mute: controller.mute,
                  titleImageAsset: R.ASSETS_MINIGAME_TEXT_ANSWER_TITLE_PNG,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(80),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Text(
                          controller.question.mDisplayContent?.title ?? "Nhập đáp án đúng theo gợi ý",
                          style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Image.asset(
                              controller.mascotImage.value,
                              width: 160,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: controller.questionClick,
                              child: controller.audioSrc.isNotEmpty
                                  ? Container(
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
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withAlpha(127),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                      // child: Image.asset(
                                      //   R.ASSETS_MINIGAME_LISTEN_SPEAKER_PNG,
                                      //   width: 64,
                                      // ),
                                      child: Html(
                                        data: controller.question.mDisplayContent?.content,
                                      ),
                                      // child: Html(
                                      //   data: r"""
                                      // <audio controls>
                                      //   <source src="https://www.bensound.com/bensound-music/bensound-creativeminds.mp3" type="audio/mpeg">
                                      // Your browser does not support the audio element.
                                      // </audio>
                                      // """,
                                      // ),
                                    ),
                            ),
                          ),
                          SizedBox(width: 160),
                        ],
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Center(
                            child: Image.asset(
                              R.ASSETS_MINIGAME_ANNA_LEPESHKINA_GUI_PNG,
                              width: MediaQuery.of(context).size.width - 200,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 16),
                                height: 50,
                                width: MediaQuery.of(context).size.width - 350,
                                child: Obx(
                                  () => TextField(
                                    controller: controller.inputCtrl,
                                    focusNode: controller.inputNode,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: controller.hasFocus.value ? '' : 'Nhập đáp án',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintStyle: GoogleFonts.baloo(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffb55c01),
                                      ),
                                    ),
                                    style: GoogleFonts.baloo(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffb55c01),
                                    ),
                                    showCursor: true,
                                    onTap: () {
                                      controller.hasFocus.value = true;
                                      controller.update();
                                      Future.delayed(Duration(milliseconds: 300)).then((value) => controller.scrollCtrl.animateTo(controller.scrollCtrl.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.ease));
                                    },
                                    // onChanged: (text) {
                                    //   controller.setInput(text);
                                    // },
                                    onEditingComplete: controller.onComplete,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: -50,
                            child: Obx(
                              () => ShakeWidget(
                                controller: controller.shakeWidgetCtrl,
                                child: controller.resultImage.value.isNotEmpty
                                    ? Image.asset(
                                        controller.resultImage.value,
                                        width: 64,
                                        height: 64,
                                      )
                                    : Container(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
