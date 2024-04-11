import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:elearning/app/components/excercise/minigame_finish_popup.dart';
import 'package:elearning/app/config/event.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/modules/exercise_list/controllers/exercise_list_controller.dart';
import 'package:elearning/app/modules/exercise_step/controllers/exercise_step_controller.dart';
import 'package:elearning/generated/resource.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MinigameMatchingHiddenController extends GetxController {
  final Questions question = Get.arguments['question'];
  final audioPlayer = AssetsAudioPlayer();
  final eventGame = EventBus();
  final list = List<Sets>.empty(growable: true).obs;
  Sets? openedCard;
  int lockCount = 0;
  final resultPlayer = AssetsAudioPlayer();

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    question.mDisplayContent?.sets?.shuffle();
    list.addAll(question.mDisplayContent?.sets ?? []);
    list.addAll(question.mDisplayContent?.items ?? []);
  }

  @override
  void onReady() {
    super.onReady();
    playBackgroundMusic();
  }

  void playBackgroundMusic() async {
    await audioPlayer.open(
      Audio(R.ASSETS_MP3_BG_MATCHING_HIDDEN_MP3),
      showNotification: false,
      loopMode: LoopMode.single,
      autoStart: true,
    );
  }

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.restoreSystemUIOverlays();
    audioPlayer.stop();
    resultPlayer.stop();
  }

  void closeGame() {
    Get.back();
  }

  void reloadGame() {
    openedCard = null;
    lockCount = 0;
    for (var item in list) {
      eventGame.fire(EventMinigameFlipCardState(MiniGameFlipCardState.reset, item));
    }
    list.shuffle();
    update();
  }

  void mute() {
    audioPlayer.playOrPause();
  }

  void onToggleCard(Sets value, bool isOpen) async {
    if (isOpen) {
      final firstId = openedCard != null && openedCard!.answers != null && openedCard!.answers!.length > 0 ? openedCard!.answers![0].id : openedCard?.id;
      final secondId = value.answers != null && value.answers!.length > 0 ? value.answers![0].id : value.id;
      if (firstId == secondId) {
        // await resultPlayer.open(
        //   Audio(R.ASSETS_MP3_GAME_WIN_MP3),
        //   showNotification: false,
        //   loopMode: LoopMode.none,
        // );
        // resultPlayer.play();

        lockCount += 2;
        Future.delayed(Duration(milliseconds: 100)).then((val) {
          eventGame.fire(EventMinigameFlipCardState(MiniGameFlipCardState.lock, openedCard!));
          eventGame.fire(EventMinigameFlipCardState(MiniGameFlipCardState.lock, value));
          openedCard = null;
        });
      } else if (openedCard != null) {
        // await resultPlayer.open(
        //   Audio(R.ASSETS_MP3_GAME_OVER_MP3),
        //   showNotification: false,
        //   loopMode: LoopMode.none,
        // );
        // resultPlayer.play();

        Future.delayed(Duration(milliseconds: 400)).then((val) {
          eventGame.fire(EventMinigameFlipCardState(MiniGameFlipCardState.close, openedCard!));
          eventGame.fire(EventMinigameFlipCardState(MiniGameFlipCardState.close, value));
          openedCard = null;
        });
      } else {
        openedCard = value;
      }
    } else {
      openedCard = null;
    }
  }

  void confirmGame() async {
    if (lockCount == list.length) {
      await resultPlayer.open(
        Audio(R.ASSETS_MP3_GAME_WIN_MP3),
        showNotification: false,
        loopMode: LoopMode.none,
      );
      resultPlayer.play();

      question.mDisplayContent?.isCompleted = true;
      try {
        Get.find<ExerciseListController>().updateProcess(question);
      } catch (_) {}
      try {
        Get.find<ExerciseStepController>().updateProcess(question);
      } catch (_) {}
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        Get.dialog(
          minigameFinishDialog(
            Get.context!,
            onClose: () {
              Get.close(2);
            },
          ),
          barrierDismissible: false,
        );
      });
    } else {
      await resultPlayer.open(
        Audio(R.ASSETS_MP3_GAME_OVER_MP3),
        showNotification: false,
        loopMode: LoopMode.none,
      );
      resultPlayer.play();
    }
  }
}
