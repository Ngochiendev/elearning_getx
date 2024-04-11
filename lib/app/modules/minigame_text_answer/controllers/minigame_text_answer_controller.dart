import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:elearning/app/components/excercise/minigame_finish_popup.dart';
import 'package:elearning/app/components/excercise/shake_widget.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/modules/exercise_list/controllers/exercise_list_controller.dart';
import 'package:elearning/app/modules/exercise_step/controllers/exercise_step_controller.dart';
import 'package:elearning/generated/resource.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:logger/logger.dart';

class MinigameTextAnswerController extends GetxController {
  final Questions question = Get.arguments['question'];
  final audioPlayer = AssetsAudioPlayer();
  final questionPlayer = AssetsAudioPlayer();
  final eventGame = EventBus();
  final scrollCtrl = ScrollController();
  final inputCtrl = TextEditingController();
  final inputNode = FocusNode();
  final shakeWidgetCtrl = ShakeWidgetController();
  final resultPlayer = AssetsAudioPlayer();
  final resultImage = "".obs;
  final mascotImage = R.ASSETS_MINIGAME_BUFFALO_GIF.obs;
  var audioSrc = "";
  final hasFocus = false.obs;

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    var document = parse(question.mDisplayContent?.content);
    final elAudios = document.getElementsByTagName('audio');
    if (elAudios.length > 0 && elAudios[0].children.length > 0 && elAudios[0].children[0].attributes["src"] != null) {
      audioSrc = elAudios[0].children[0].attributes["src"]!;
    }
    Logger().d(audioSrc);
  }

  @override
  void onReady() {
    super.onReady();
    playBackgroundMusic();
  }

  void playBackgroundMusic() async {
    await audioPlayer.open(
      Audio(R.ASSETS_MP3_BG_TEXT_ANSWER_MP3),
      showNotification: false,
      loopMode: LoopMode.single,
    );
    audioPlayer.play();
  }

  questionClick() async {
    if (audioSrc.isNotEmpty) {
      audioPlayer.pause();
      try {
        await questionPlayer.open(
          Audio.network(audioSrc),
        );
        questionPlayer.play();
      } catch (t) {}
    }
  }

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.restoreSystemUIOverlays();
    audioPlayer.stop();
    questionPlayer.stop();
    resultPlayer.stop();
  }

  void closeGame() {
    Get.back();
  }

  void reloadGame() {
    inputCtrl.text = "";
    update();
    shakeWidgetCtrl.shake();
  }

  void mute() {
    audioPlayer.playOrPause();
  }

  void setInput(String text) {
    update();
  }

  void onComplete() async {
    inputNode.unfocus();
    hasFocus.value = false;
    update();
    // final correct = question.mGoalContent?.answers?[0].content;
    // if (inputCtrl.text.trim() == correct) {
    //   showResult(true);
    // } else {
    //   showResult(false);
    // }
  }

  void confirmGame() {
    inputNode.unfocus();
    final correct = question.mGoalContent?.answers?[0].content;
    showResult(inputCtrl.text.trim() == correct);
    if (inputCtrl.text.trim() == correct) {
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

  showResult(bool isCorrect) async {
    await Future.delayed(Duration(milliseconds: 400));
    resultImage.value = isCorrect ? R.ASSETS_MINIGAME_IC_WIN_3_PNG : R.ASSETS_MINIGAME_IC_LOST_3_PNG;
    mascotImage.value = isCorrect ? R.ASSETS_MINIGAME_BUFFALO_WIN_GIF : R.ASSETS_MINIGAME_BUFFALO_LOSE_GIF;
    update();
    await resultPlayer.open(
      Audio(isCorrect ? R.ASSETS_MP3_GAME_WIN_MP3 : R.ASSETS_MP3_GAME_OVER_MP3),
      showNotification: false,
      loopMode: LoopMode.none,
    );
    resultPlayer.play();
    shakeWidgetCtrl.shake();
    await Future.delayed(Duration(milliseconds: 1600));
    resultImage.value = "";
    mascotImage.value = R.ASSETS_MINIGAME_BUFFALO_GIF;
    update();
  }
}
