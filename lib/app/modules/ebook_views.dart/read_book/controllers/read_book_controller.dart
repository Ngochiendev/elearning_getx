import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:chewie/chewie.dart';
import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/book_models/book_model.dart';
import 'package:elearning/app/data/models/book_models/exercises_book.dart';
import 'package:elearning/app/data/models/book_models/reading_book_model.dart';
import 'package:elearning/app/data/models/book_models/table_content_read_book_model.dart';
import 'package:elearning/app/data/models/speak_model.dart';
import 'package:elearning/app/data/models/trail_page_model.dart' as tr;
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/data/providers/textToSpeek.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/controllers/ebook_details_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

enum LoadDataState { Loding, done, error, none }

class ReadBookController extends GetxController {
  //TODO: Implement ReadBookController
  final books = [].obs;

  final id = 0.obs;
  final isFree = false.obs;
  final list = List<Rows>.empty(growable: true).obs;
  final listAttachment = List<Attachment>.empty(growable: true).obs;
  final listBook = List<Rows>.empty(growable: true).obs;
  final listContent = List<TableOfContent>.empty(growable: true).obs;
  final listContentChildren = List<TableOfContent>.empty(growable: true).obs;
  final listContentChildren2 = List<TableOfContent>.empty(growable: true).obs;
  final listTrail = List<tr.PageTrail>.empty(growable: true).obs;
  final modelReadBook = ReadingBookModel().obs;
  final exercisesModel = ExercisesBook().obs;
  final listExercises = List<BookExercise>.empty(growable: true).obs;
  final name = "".obs;
  var pageController = PageController();
  final pages = 0.obs;
  final sliderIndex = 0.obs;
  final tableContent = [].obs;
  final tableModel = TableContent().obs;
  final trailModelReadBook = tr.TrailPage().obs;
  final pagess = 1.obs;
  final isAllowtrail = false.obs;
  // FlutterTts flutterTts = FlutterTts();
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  AudioPlayer audioPlayerUrl = AudioPlayer();
  final duraation = Duration().obs;
  final position = Duration().obs;
  final isPlaying = true.obs;
  final isPause = false.obs;
  final iconData = [].obs;
  final audioModel = Welcome().obs;
  final fileString = "".obs;
  final duraationUrl = Duration().obs;
  final positionUrl = Duration().obs;
  final loadDataState = LoadDataState.none.obs;
  final isPlayingUrl = true.obs;
  FlutterTts flutterTts = FlutterTts();

  ChewieController? chewieController;
  VideoPlayerController? videoPlayerController;
  Future<void>? initializeVideoPlayerFuture;
  void onClose() {
    audioPlayer.dispose();
    chewieController?.dispose();
    videoPlayerController?.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    // flutterTts = FlutterTts();
    iconData.value = [Icons.play_circle_fill, Icons.pause_circle_filled];

    audioPlayer.onDurationChanged.listen((event) {
      duraation.value = event;
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      position.value = event;
    });
    audioPlayerUrl.onDurationChanged.listen((event) {
      duraationUrl.value = event;
    });
    audioPlayerUrl.onAudioPositionChanged.listen((event) {
      positionUrl.value = event;
    });
    audioPlayerUrl.onPlayerCompletion.listen((event) {
      positionUrl.value = Duration(seconds: 0);
      isPlayingUrl.value = true;
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      position.value = Duration(seconds: 0);
      isPlaying.value = true;
    });
    // audioPlayer.setUrl("https://luan.xyz/files/audio/ambient_c_motion.mp3");
  }

  void createChewieController() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: false,
      aspectRatio: videoPlayerController!.value.aspectRatio,
      // customControls: MaterialDesktopControls()
    );
  }

  @override
  void onReady() async {
    super.onReady();
    id.value = Get.arguments['id'] ?? 0;
    isAllowtrail.value = Get.arguments['isAllowTrial'] ?? false;
    final isAlreadyPurchased = Get.arguments['isAlreadyPurchased'] ?? 0;
    final isFree = Get.arguments['isFree'] ?? false;
    if (isAlreadyPurchased == 1) {
      await getPdfBooks(id.value);
    } else if (isAllowtrail.value == true) {
      await getTrailPage();
    } else if (isFree == true) {
      await getPdfBooks(id.value);
    }

    await getTableContent();
    // getExercises();
    Get.find<EbookDetailsController>().getDetailBook(id.value.toString());
  }

  Future PlayAudio(bool play, String text) async {
    isPlaying.value = play;

    print(play);
    if (play == false) {
      // final uri = await audioCache.load(fileString);
      // audioPlayer.release();
      audioPlayer.play(fileString.value);
    } else {
      audioPlayer.pause();
    }
    audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
  }

  void changePositonUrl(int sec) {
    Duration newDuration = Duration(seconds: sec);
    audioPlayerUrl.seek(newDuration);
  }

  Future playVideoPopup(String url) async {
    videoPlayerController = VideoPlayerController.network(
      url,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    await Future.wait(
        [initializeVideoPlayerFuture = videoPlayerController!.initialize()]);

    createChewieController();
  }

  Future PlayAudioToUrl(bool play, String url) async {
    isPlayingUrl.value = play;
    print(play);
    if (play == false) {
      audioPlayerUrl.play(url);
    } else {
      audioPlayerUrl.pause();
    }

    audioPlayerUrl.setReleaseMode(ReleaseMode.RELEASE);
  }

  void setSliderIndex(int inx) {
    sliderIndex.value = inx;
  }

  Future speak(String text) async {
    if (isPlaying.value == true) {
      await flutterTts.setLanguage("vi-VN");
      await flutterTts.setPitch(1.0);

      print(flutterTts.getVoices);
      await flutterTts.speak(text);
    } else {
      if (Platform.isIOS) {
        flutterTts.pause();
      } else {
        var res = await flutterTts.stop();
        if (res == 1) isPlaying.value = true;
      }
    }

    flutterTts.setStartHandler(() {
      isPlaying.value = false;
    });
    flutterTts.setPauseHandler(() {
      isPlaying.value = true;
    });

    flutterTts.setCompletionHandler(() {
      isPlaying.value = true;
    });
    flutterTts.setErrorHandler((message) {
      appSnackbar(message, type: SnackbarType.error);
    });
    // loadDataState.value = LoadDataState.Loding;
    // final response = await TextToSpeed.instance.getAutio(text);
    // // print(response.data);
    // if (response.error.isEmpty) {
    //   loadDataState.value = LoadDataState.done;
    //   audioModel.value = Welcome.fromJson(response.data);
    //   fileString.value =
    //       'data:audio/wav;base64,${audioModel.value.audioContent.toString()}';
    // } else {
    //   loadDataState.value = LoadDataState.error;
    // }

    // new File('file.txt').writeAsStringSync(audioModel.value.audioContent!);

    // String decodedFile =
    //     utf8.decode(base64.decode("${audioModel.value.audioContent}"));
    // print('decoded file: $decodedFile');
    // print(fileString.value);
  }

  Future readBook(String pageID) async {
    final response =
        await BookProvider.instance.readBookApi("${id.value}", pageID);
    if (response.error.isEmpty) {
      print("read");
    }
    update();
  }

  void onChangePage(int page) async {
    listAttachment.value = [];
    print("vi tri $page");
    print("vi tris ${books.length}");
    pages.value = page;
    listAttachment.addAll(list[pages.value].attachments!);
    if (page != modelReadBook.value.data?.pagination!.total) {
      if (page == books.length - 1) {
        pagess.value++;
        if (isAllowtrail.value == false) {
          await getPdfBooks(id.value, page: pagess.value);
        } else {
          return;
        }
        //  listExercises.clear();
      }
    }
    if (isAllowtrail.value == false) {
      if (listBook[page].bookExercises != null &&
          listBook[page].bookExercises!.isNotEmpty) {
        listExercises.value = listBook[page].bookExercises!;
      } else {
        listExercises.value = [];
      }
    }

    update();
  }

  Future getTableContent() async {
    final response = await BookProvider.instance.getTableContent("${id.value}");
    if (response.error.isEmpty) {
      tableModel.value = TableContent.fromJson(response.data);
      final table = tableModel.value.data!.tableOfContents!;

      if (table.isNotEmpty) {
        tableContent.value = table;
        listContent.value = table;
      }
    }
    update();
  }

  // void getExercises() async {
  //   final response = await BookProvider.instance.getExercises("${id.value}");
  //   if (response.error.isEmpty) {
  //     exercisesModel.value = ExercisesBook.fromJson(response.data);
  //     final exercises = exercisesModel.value.data!.exercises!;

  //     if (exercises.isNotEmpty) {
  //       listExercises.value = exercises;
  //     }
  //   } else {
  //     listExercises.value = [];
  //   }
  //   update();
  // }

  void demoToExercise(String exercisableId, String exerciseId) async {
    final response = await ExerciseProvider.instance.getUserExerciseInfo(
        "bookPages", exercisableId, exerciseId); // 468, 123, 485 // 162
    print(response.data);
    if (response.error.isEmpty) {
      Get.toNamed(Routes.EXERCISE_INFO, arguments: {
        'userExerciseResponse': response.data,
        'exercisableType': 'bookPages',
        'exercisableId': exercisableId,
      });
    } else {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => dialogAlert(
          context,
          message: response.error,
        ),
      );
    }
  }

  Future getTrailPage() async {
    final response = await BookProvider.instance.getTrialPage(
      "${id.value}",
    );
    list.clear();
    if (response.error.isEmpty) {
      // final listAt = <Attachment>[];
      // trailModelReadBook.value=TrailPage.fromJson(response.data);
      for (var item in response.data['data']['pages']) {
        list.add(Rows.fromJson(item));
      }

      listBook.value = list;
      if (list.length > 0) {
        list.sort((a, b) => a.id!.compareTo(b.id!));
        name.value = list.first.bookTitle ?? "Tên Sách";
        books.value =
            list.where((e) => e.image != null).map((e) => e.image).toList();
        if (list.first.attachments!.length != 0) {
          listAttachment.value = list.first.attachments!;
        }
      }

      update();
    }
  }

  Future getPdfBooks(int id, {int page = 1}) async {
    final response = await BookProvider.instance.getPdfBooks(id, page: page);
    // list.clear();
    if (response.error.isEmpty) {
      modelReadBook.value = ReadingBookModel.fromJson(response.data);

      for (var item in modelReadBook.value.data!.rows!) {
        list.add(item);
      }

      listBook.value = list;
      if (list.length > 0) {
        list.sort((a, b) => a.id!.compareTo(b.id!));
        name.value = list.first.bookTitle ?? "Tên Sách";
        books.value =
            list.where((e) => e.image != null).map((e) => e.image).toList();
        if (pagess.value == 1) {
          if (list.first.attachments!.isNotEmpty) {
            listAttachment.value = list.first.attachments!;
          }
        }
        print(listBook.length);
        if (modelReadBook.value.data!.pagination!.total == page) {
          return;
        } else {
          if (listBook[page].bookExercises != null &&
              listBook[page].bookExercises!.isNotEmpty) {
            listExercises.value = listBook[page].bookExercises!;
          } else {
            listExercises.value = [];
          }
        }
        readBook("${listBook.first.id!}");
      }

      update();
    } else {}
  }


}
