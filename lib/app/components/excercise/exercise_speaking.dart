import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ExerciseSpeaking extends StatefulWidget {
  ExerciseSpeaking({
    required this.index,
    required this.question,
    this.state,
    required this.onComplete,
    Key? key,
  }) : super(key: key);
  final int index;
  final Questions question;
  final ExerciseState? state;
  final void Function(Questions result) onComplete;

  @override
  State<ExerciseSpeaking> createState() => _ExerciseSpeakingState();
}

class _ExerciseSpeakingState extends State<ExerciseSpeaking> {
  bool isRecording = false;
  final audioPlayer = AssetsAudioPlayer();
  bool isAnswered = false;
  final flutterTts = FlutterTts();
  String answeredText = "";

  @override
  void initState() {
    super.initState();
    checkContainFile();
  }

  String get explanation {
    String str = widget.question.qGoalContent?.answerExplanation ?? "";
    if (str.length == 0 && (widget.question.qGoalContent?.choices?.length ?? 0) > 0) {
      str = widget.question.qGoalContent?.choices?[0].content ?? "";
    }
    return str;
  }

  void onStartRecord() async {
    RecordMp3.instance.stop();
    Permission.microphone.request().then((value) async {
      if (value == PermissionStatus.granted) {
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = "${tempDir.path}/exercise_recode_${widget.question.id}.mp3";
        final file = File(tempPath);
        if (await file.exists()) {
          await file.delete();
        }
        setState(() {
          isAnswered = false;
          isRecording = true;
        });
        RecordMp3.instance.start(tempPath, (type) {
          print(type);
        });
      }
    }).catchError((error) {
      Logger().d(error, "onStartRecord");
    });
  }

  void onStopRecord() async {
    RecordMp3.instance.stop();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = "${tempDir.path}/exercise_recode_${widget.question.id}.mp3";
    final file = File(tempPath);
    if (await file.exists()) {
      Uint8List fileContent = await file.readAsBytes();
      String base64String = base64Encode(fileContent);
      String header = "data:audio/mp3;base64,";
      widget.question.qDisplayContent?.filledAnswer = header + base64String;
    }
    widget.onComplete(widget.question);
    setState(() {
      isRecording = false;
      isAnswered = true;
    });
  }

  void playRecord() async {
    if (audioPlayer.isPlaying.value) {
      audioPlayer.pause();
      return;
    }
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = "${tempDir.path}/exercise_recode_${widget.question.id}_temp.mp3";
    String header = "data:audio/mp3;base64,";
    var fileContent = widget.question.qDisplayContent?.filledAnswer ?? "";
    fileContent = fileContent.replaceFirst(header, "");
    final content = base64Decode(fileContent);
    final file = await File(tempPath).create();
    file.writeAsBytesSync(content);

    if (await file.exists()) {
      await audioPlayer.open(
        Audio.file(tempPath),
      );
      audioPlayer.play();
    }
  }

  void playAnswer() async {
    if ((widget.question.qGoalContent?.choices?.length ?? 0) > 0) {
      final answer = widget.question.qGoalContent!.choices![0].content;
      print(answer);
      await flutterTts.setLanguage("vi-VN");
      flutterTts.speak(answer ?? '');
    }
  }

  // void playRecord() async {
  //   Directory tempDir = await getTemporaryDirectory();
  //   String tempPath = "${tempDir.path}/exercise_recode_${widget.question.id}.mp3";
  //   var file = File(tempPath);
  //   if (!file.existsSync()) {
  //     String header = "data:audio/mp3;base64,";
  //     var fileContent = widget.question.qDisplayContent?.filledAnswer ?? "";
  //     Logger().d(fileContent);
  //     fileContent = fileContent.replaceFirst(header, "");
  //     Logger().d(fileContent);
  //     final content = base64Decode(fileContent);
  //     tempPath = "${tempDir.path}/exercise_recode_${widget.question.id}_temp.mp3";
  //     file = await File(tempPath).create();
  //     file.writeAsBytesSync(content);
  //   }

  //   if (await file.exists()) {
  //     final audioPlayer = AssetsAudioPlayer();
  //     await audioPlayer.open(
  //       Audio.file(tempPath),
  //     );
  //     audioPlayer.play();
  //   }
  // }

  void checkContainFile() async {
    final answered = widget.question.qDisplayContent?.filledAnswer ?? "";
    if (answered.length > 0) {
      final SpeechToText speech = SpeechToText();
      var hasSpeech = await speech.initialize(
        onError: (SpeechRecognitionError error) {},
        onStatus: (String status) {},
        debugLogging: true,
      );
    }
    setState(() {
      isAnswered = answered.length > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                R.ASSETS_SVG_IC_QUESTION_YELLOW_SVG,
                color: widget.state == null || widget.state == ExerciseState.pending
                    ? Colors.yellow
                    : widget.state == ExerciseState.correct
                        ? colorSemanticGreen100
                        : colorSemanticRed100,
              ),
              SizedBox(width: 16),
              Text(
                "Câu hỏi ${widget.index}",
                style: typoBold18,
              ),
              SizedBox(width: 8),
              widget.state == null || widget.state == ExerciseState.pending
                  ? Text(
                      "(${widget.question.allocatedPoint} điểm)",
                      style: typoRegular14,
                    )
                  : widget.state == ExerciseState.correct
                      ? Text(
                          "+${widget.question.pointEarned} điểm",
                          style: typoRegular14.copyWith(color: colorSemanticGreen100),
                        )
                      : Container(),
            ],
          ),
          (widget.question.qDisplayContent?.title?.length ?? 0) > 0
              ? Container(
                  padding: EdgeInsets.only(top: 12, left: 8),
                  child: Text(
                    widget.question.qDisplayContent?.title ?? "",
                    style: typoBold18,
                  ),
                )
              : Container(),
          Html(
            data: widget.question.qDisplayContent?.content ?? "",
          ),
          widget.state == null || widget.state == ExerciseState.pending
              ? Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              RecordMp3.instance.status == RecordStatus.RECORDING ? onStopRecord() : onStartRecord();
                            },
                            child: Image.asset(
                              isRecording ? R.ASSETS_PNG_IC_RECORDING_PNG : R.ASSETS_PNG_IC_RECORD_PNG,
                              width: 64,
                              height: 64,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            isRecording ? "Đang ghi âm" : "Nhấn vào mic để đọc",
                            style: typoRegular16.copyWith(color: colorSemanticBlue100),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isRecording
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: styleButtonPrimary,
                                  child: Text("Lưu"),
                                  onPressed: onStopRecord,
                                ),
                              )
                            : Container(),
                        isAnswered
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: styleButtonWhiteBorder,
                                  child: Text("Nghe lại"),
                                  onPressed: playRecord,
                                ),
                              )
                            : Container(),
                        isAnswered
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: styleButtonPrimary,
                                  child: Text("Thu lại"),
                                  onPressed: onStartRecord,
                                ),
                              )
                            : Container(),
                      ],
                    )
                  ],
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: playRecord,
                        child: Image.asset(
                          R.ASSETS_PNG_IC_RECORDING_PNG,
                          width: 64,
                          height: 64,
                          color: widget.state == ExerciseState.correct ? colorSemanticGreen100 : colorSemanticRed100,
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        style: widget.state == ExerciseState.correct ? styleButtonGreen : styleButtonRed,
                        child: Text("Nghe lại"),
                        onPressed: playRecord,
                      ),
                    ],
                  ),
                ),
          widget.state == ExerciseState.correct || widget.state == ExerciseState.wrong
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(R.ASSETS_PNG_IC_TIP_PNG),
                        SizedBox(width: 8),
                        Text(
                          "Giải thích",
                          style: typoBold14,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(explanation),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: playAnswer,
                      child: Row(
                        children: [
                          Image.asset(R.ASSETS_PNG_IC_SOUND_ANSWER_PNG),
                          SizedBox(width: 4),
                          Text(
                            "Nghe đáp án",
                            style: typoRegular14.copyWith(color: colorPrimaryBlue100),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
