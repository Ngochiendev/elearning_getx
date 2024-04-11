import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:elearning/app/components/excercise/minigame_finish_popup.dart';
import 'package:elearning/app/components/excercise/movement_result.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/modules/exercise_list/controllers/exercise_list_controller.dart';
import 'package:elearning/app/modules/exercise_step/controllers/exercise_step_controller.dart';
import 'package:elearning/generated/resource.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MinigameReorderController extends GetxController {
  final Questions question = Get.arguments['question'];
  final audioPlayer = AssetsAudioPlayer();
  final eventGame = EventBus();
  final list = List<Sets>.empty(growable: true).obs;
  final resultPlayer = AssetsAudioPlayer();
  final mascotImage = R.ASSETS_MINIGAME_BEAR_GIF.obs;
  final movementResultCtrl = MovementResultController();

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    question.mDisplayContent?.sets?.shuffle();
    Logger().d(question.toJson());
  }

  @override
  void onReady() {
    super.onReady();
    playBackgroundMusic();
  }

  void playBackgroundMusic() async {
    await audioPlayer.open(
      Audio(R.ASSETS_MP3_BG_REORDER_MP3),
      showNotification: false,
      loopMode: LoopMode.single,
    );
    audioPlayer.play();
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
    list.clear();
    mascotImage.value = R.ASSETS_MINIGAME_BEAR_GIF;
    update();
  }

  void mute() {
    audioPlayer.playOrPause();
  }

  addDraggableToTarget(Sets item) async {
    list.add(item);
    update();
    // final isComplete = question.mDisplayContent?.answers?.length == list.length;
    // if (!isComplete) {
    //   return;
    // }
    // var isCorrect = true;
    // for (int i = 0; i < list.length; i++) {
    //   if (question.mDisplayContent!.answers![i].id != list[i].id) {
    //     isCorrect = false;
    //   }
    // }
    // await resultPlayer.open(
    //   Audio(isCorrect ? R.ASSETS_MP3_GAME_WIN_MP3 : R.ASSETS_MP3_GAME_OVER_MP3),
    //   showNotification: false,
    //   loopMode: LoopMode.none,
    // );
    // resultPlayer.play();
    // mascotImage.value = isCorrect ? R.ASSETS_MINIGAME_BEAR_WIN_GIF : R.ASSETS_MINIGAME_BEAR_LOSE_GIF;
    // movementResultCtrl.showResult(isCorrect);
  }

  void confirmGame() async {
    final isComplete = question.mDisplayContent?.answers?.length == list.length;
    if (!isComplete) {
      await resultPlayer.open(
        Audio(R.ASSETS_MP3_GAME_OVER_MP3),
        showNotification: false,
        loopMode: LoopMode.none,
      );
      resultPlayer.play();
      mascotImage.value = R.ASSETS_MINIGAME_BEAR_LOSE_GIF;
      movementResultCtrl.showResult(false);
      update();
      return;
    }
    var isCorrect = true;
    for (int i = 0; i < list.length; i++) {
      if (question.mDisplayContent!.answers![i].id != list[i].id) {
        isCorrect = false;
      }
    }
    await resultPlayer.open(
      Audio(isCorrect ? R.ASSETS_MP3_GAME_WIN_MP3 : R.ASSETS_MP3_GAME_OVER_MP3),
      showNotification: false,
      loopMode: LoopMode.none,
    );
    resultPlayer.play();
    mascotImage.value = isCorrect ? R.ASSETS_MINIGAME_BEAR_WIN_GIF : R.ASSETS_MINIGAME_BEAR_LOSE_GIF;
    movementResultCtrl.showResult(isCorrect);
    update();
    if (isCorrect) {
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
    }
  }
}
