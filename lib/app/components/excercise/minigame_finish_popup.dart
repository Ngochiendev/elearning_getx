import 'package:elearning/app/components/excercise/minigame_button.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';

const BG_SIZE = Size(464, 624);

Dialog minigameFinishDialog(BuildContext context, {Function? onClose}) {
  final bgHeigh = MediaQuery.of(context).size.height * 0.8;
  final bgWidth = bgHeigh * BG_SIZE.width / BG_SIZE.height;

  return Dialog(
    backgroundColor: colorTransparent,
    child: Container(
      child: Stack(
        children: [
          Image.asset(
            R.ASSETS_MINIGAME_BG_FINISH_PNG,
            width: bgWidth,
            height: bgHeigh,
          ),
          Container(
            width: bgWidth,
            height: bgHeigh,
            child: Column(
              children: [
                SizedBox(
                  height: bgHeigh * 0.07,
                ),
                Image.asset(
                  R.ASSETS_MINIGAME_TEXT_DONE_PNG,
                  height: bgHeigh * 0.06,
                ),
                SizedBox(
                  height: bgHeigh * 0.22,
                ),
                Image.asset(
                  R.ASSETS_MINIGAME_TEXT_HAPPY_PNG,
                  height: bgHeigh * 0.12,
                ),
                SizedBox(
                  height: bgHeigh * 0.23,
                ),
                MinigameButton(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        R.ASSETS_MINIGAME_BG_BTN_FINISH_PNG,
                        height: bgHeigh * 0.2,
                      ),
                      Image.asset(
                        R.ASSETS_MINIGAME_TEXT_NEXT_PNG,
                        height: bgHeigh * 0.08,
                      ),
                    ],
                  ),
                  onPress: () {
                    if (onClose != null) {
                      onClose();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
