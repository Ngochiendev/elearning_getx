import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:elearning/app/components/excercise/minigame_finish_popup.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/modules/exercise_list/controllers/exercise_list_controller.dart';
import 'package:elearning/app/modules/exercise_step/controllers/exercise_step_controller.dart';
import 'package:elearning/generated/resource.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MinigameDragAndDropController extends GetxController {
  final Questions question = Get.arguments['question'];
  final audioPlayer = AssetsAudioPlayer();
  final eventGame = EventBus();
  final result = List<Sets>.empty(growable: true).obs;
  final resultPlayer = AssetsAudioPlayer();
  final stateWrong = false.obs;
  final stateCorrect = false.obs;

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    question.mDisplayContent?.sets?.shuffle();
    question.mDisplayContent?.items?.shuffle();
    Logger().d(question.toJson(), 'question');
  }

  @override
  void onReady() {
    super.onReady();
    playBackgroundMusic();
  }

  void playBackgroundMusic() async {
    await audioPlayer.open(
      Audio(R.ASSETS_MP3_BG_DRAG_AND_DROP_MP3),
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
    question.mDisplayContent?.sets?.shuffle();
    question.mDisplayContent?.items?.shuffle();
    result.clear();
    update();
  }

  void mute() {
    audioPlayer.playOrPause();
  }

  addDraggableToTarget(Sets item, Sets target) async {
    if (item.answers?[0].id == target.id) {
      result.add(item);
    } else {
      stateWrong.value = true;
      update();
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        stateCorrect.value = false;
        stateWrong.value = false;
        update();
      });
      await resultPlayer.open(
        Audio(R.ASSETS_MP3_GAME_OVER_MP3),
        showNotification: false,
        loopMode: LoopMode.none,
      );
      resultPlayer.play();
    }
  }

  void confirmGame() async {
    final isCorrect = result.length == question.mDisplayContent?.items?.length;
    stateCorrect.value = isCorrect;
    stateWrong.value = !isCorrect;
    update();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      stateCorrect.value = false;
      stateWrong.value = false;
      update();
    });
    await resultPlayer.open(
      Audio(isCorrect ? R.ASSETS_MP3_GAME_WIN_MP3 : R.ASSETS_MP3_GAME_OVER_MP3),
      showNotification: false,
      loopMode: LoopMode.none,
    );
    resultPlayer.play();
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
    } else {
      await resultPlayer.open(
        Audio(R.ASSETS_MP3_GAME_OVER_MP3),
        showNotification: false,
        loopMode: LoopMode.none,
      );
      resultPlayer.play();
    }
  }

  Sets? findAnserEachTarget(int targetId) {
    Sets? matched;
    result.forEach((element) {
      if (element.answers?[0].id == targetId) {
        matched = element;
      }
    });
    return matched;
  }
}
