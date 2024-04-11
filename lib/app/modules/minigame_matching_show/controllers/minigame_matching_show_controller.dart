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
import 'package:logger/logger.dart';

class MinigameMatchingShowController extends GetxController {
  final Questions question = Get.arguments['question'];
  final audioPlayer = AssetsAudioPlayer();
  final eventGame = EventBus();
  final list = List<Sets>.empty(growable: true).obs;
  Sets? selectedItem;
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
    Logger().d(question.toJson());
  }

  void playBackgroundMusic() async {
    await audioPlayer.open(
      Audio(R.ASSETS_MP3_BACKGROUND_MUSIC_MP3),
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
    selectedItem = null;
    lockCount = 0;
    for (var item in list) {
      eventGame.fire(EventMinigameChooseOptionState(MinigameChooseOptionState.reset, item));
    }
    list.shuffle();
    update();
  }

  void mute() {
    audioPlayer.playOrPause();
  }

  void chooseAnswer(Sets item, bool isOpen) async {
    if (isOpen) {
      final firstId = selectedItem != null && selectedItem!.answers != null && selectedItem!.answers!.length > 0 ? selectedItem!.answers![0].id : selectedItem?.id;
      final secondId = item.answers != null && item.answers!.length > 0 ? item.answers![0].id : item.id;
      if (firstId == secondId) {
        // await resultPlayer.open(
        //   Audio(R.ASSETS_MP3_GAME_WIN_MP3),
        //   showNotification: false,
        //   loopMode: LoopMode.none,
        // );
        // resultPlayer.play();

        lockCount += 2;
        Future.delayed(Duration(milliseconds: 100)).then((val) {
          eventGame.fire(EventMinigameChooseOptionState(MinigameChooseOptionState.lock, selectedItem!));
          eventGame.fire(EventMinigameChooseOptionState(MinigameChooseOptionState.lock, item));

          selectedItem = null;
        });
      } else if (selectedItem != null) {
        // await resultPlayer.open(
        //   Audio(R.ASSETS_MP3_GAME_OVER_MP3),
        //   showNotification: false,
        //   loopMode: LoopMode.none,
        // );
        // resultPlayer.play();

        Future.delayed(Duration(milliseconds: 400)).then((val) {
          eventGame.fire(EventMinigameChooseOptionState(MinigameChooseOptionState.close, selectedItem!));
          eventGame.fire(EventMinigameChooseOptionState(MinigameChooseOptionState.close, item));
          selectedItem = null;
        });
      } else {
        selectedItem = item;
      }
    } else {
      selectedItem = null;
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
