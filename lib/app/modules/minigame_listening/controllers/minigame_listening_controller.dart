import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:elearning/app/components/excercise/egg_result.dart';
import 'package:elearning/app/components/excercise/minigame_finish_popup.dart';
import 'package:elearning/app/config/event.dart';
import 'package:elearning/app/data/models/minigame_content_model.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/modules/exercise_list/controllers/exercise_list_controller.dart';
import 'package:elearning/app/modules/exercise_step/controllers/exercise_step_controller.dart';
import 'package:event_bus/event_bus.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:logger/logger.dart';

class MinigameListeningController extends GetxController {
  final Questions question = Get.arguments['question'];
  final audioPlayer = AssetsAudioPlayer();
  final questionPlayer = AssetsAudioPlayer();
  final eventGame = EventBus();
  var audioSrc = "";
  Sets? selectedItem;
  final mascotImage = R.ASSETS_MINIGAME_CHICKEN_GIF.obs;
  final resultCtrl = EggResultController();

  @override
  void onInit() {
    super.onInit();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    if (question.mDisplayContent?.content?.startsWith("http") ?? false) {
      audioSrc = question.mDisplayContent?.content ?? "";
    } else {
      var document = parse(question.mDisplayContent?.content ?? "");
      question.mDisplayContent?.sets?.shuffle();

      final elAudios = document.getElementsByTagName('audio');
      if (elAudios.length > 0 && elAudios[0].children.length > 0 && elAudios[0].children[0].attributes["src"] != null) {
        audioSrc = elAudios[0].children[0].attributes["src"]!;
      }
    }
    Logger().d(question.toJson(), 'audioSrc question');
    Logger().d(audioSrc, 'audioSrc');
  }

  @override
  void onReady() {
    super.onReady();
    playBackgroundMusic();
  }

  void playBackgroundMusic() async {
    await audioPlayer.open(
      Audio(R.ASSETS_MP3_BACKGROUND_MUSIC_MP3),
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
    questionPlayer.stop();
  }

  void closeGame() {
    Get.back();
  }

  void reloadGame() {
    if (selectedItem != null) {
      eventGame.fire(EventMinigameChooseOptionState(MinigameChooseOptionState.close, selectedItem!));
      selectedItem = null;
    }
  }

  void mute() {
    audioPlayer.playOrPause();
  }

  void playQuestionAudio() async {
    Logger().d(audioSrc);
    audioPlayer.pause();
    if (questionPlayer.isPlaying.value) {
      questionPlayer.pause();
    } else {
      try {
        await questionPlayer.open(
          Audio.network(audioSrc),
        );
        questionPlayer.play();
      } catch (t) {
        Logger().d(t);
      }
    }
  }

  void chooseAnswer(Sets item, bool isOpen) {
    if (!isOpen) {
      selectedItem = null;
      return;
    }
    if (selectedItem != null && selectedItem!.id != item.id) {
      eventGame.fire(EventMinigameChooseOptionState(MinigameChooseOptionState.close, selectedItem!));
    }
    selectedItem = item;
    var correct = false;
    if ((question.mDisplayContent?.answers?.length ?? 0) > 0) {
      correct = question.mDisplayContent?.answers?[0].id == item.id;
    }
    // showResult(correct);
  }

  showResult(bool isCorrect) async {
    mascotImage.value = isCorrect ? R.ASSETS_MINIGAME_CHICKEN_SUCCESS_GIF : R.ASSETS_MINIGAME_CHICKEN_WRONG_GIF;
    update();
    await questionPlayer.open(
      Audio(isCorrect ? R.ASSETS_MP3_GAME_WIN_MP3 : R.ASSETS_MP3_GAME_OVER_MP3),
      showNotification: false,
      loopMode: LoopMode.none,
    );
    questionPlayer.play();
    resultCtrl.showResult(isCorrect);
    await Future.delayed(Duration(milliseconds: 1600));
    mascotImage.value = R.ASSETS_MINIGAME_CHICKEN_GIF;
    update();
  }

  void confirmGame() {
    var correct = false;
    if ((question.mDisplayContent?.answers?.length ?? 0) > 0) {
      correct = question.mDisplayContent?.answers?[0].id == selectedItem?.id;
    }
    showResult(correct);
    if (correct) {
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
