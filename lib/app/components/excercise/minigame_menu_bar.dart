import 'package:elearning/app/components/excercise/minigame_button.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';

class MinigameMenuBar extends StatelessWidget {
  const MinigameMenuBar({
    required this.closeGame,
    required this.reloadGame,
    required this.confirmGame,
    required this.mute,
    required this.titleImageAsset,
    Key? key,
  }) : super(key: key);
  final void Function() closeGame;
  final void Function() reloadGame;
  final void Function() confirmGame;
  final void Function() mute;
  final String titleImageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 18, 24, 0),
      child: Row(
        children: [
          MinigameButton(
            child: Image.asset(
              R.ASSETS_MINIGAME_SPEAKER_BTN_PNG,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            onPress: mute,
          ),
          SizedBox(width: 18),
          MinigameButton(
            child: Image.asset(
              R.ASSETS_MINIGAME_REPLAY_BTN_PNG,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            onPress: reloadGame,
          ),
          SizedBox(width: 70),
          Spacer(),
          Image.asset(
            titleImageAsset,
            height: 54,
          ),
          Spacer(),
          MinigameButton(
            child: Image.asset(
              R.ASSETS_MINIGAME_BTN_CONFIRM_PNG,
              width: 120,
              height: 44,
              fit: BoxFit.contain,
            ),
            onPress: confirmGame,
          ),
          SizedBox(width: 18),
          MinigameButton(
            child: Image.asset(
              R.ASSETS_MINIGAME_EXIT_BTN_PNG,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            onPress: closeGame,
          ),
        ],
      ),
    );
  }
}
