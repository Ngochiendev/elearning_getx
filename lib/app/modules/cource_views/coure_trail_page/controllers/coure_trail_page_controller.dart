import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/chapters_model.dart';
import 'package:elearning/app/data/models/comment_session_model.dart';
import 'package:elearning/app/data/models/course_model.dart';

import 'package:elearning/app/data/models/document_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';
import 'package:elearning/app/data/models/sessions_model.dart';
import 'package:elearning/app/data/models/trial_chapters_model.dart';
import 'package:elearning/app/data/models/video_model.dart';
import 'package:elearning/app/data/models/video_session_model.dart';
import 'package:elearning/app/data/providers/cart_provider.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CoureTrailPageController extends GetxController
    with SingleGetTickerProviderMixin {
  //TODO: Implement CoureTrailPageController
  final cartController = Get.find<CartProductController>();
  final count = 0.obs;
  final course = Course().obs;
  final commentModel = CommentSessionModel().obs;
  final listComment = List<Comment>.empty(growable: true).obs;
  final video = VideoSession().obs;
  final document = DocumentsModel().obs;
  Future<void>? initializeVideoPlayerFuture;
  final isDocument = false.obs;
  final isPlay = false.obs;
  final listChapter = List<TrialChapters>.empty(growable: true).obs;
  //  final listChapter = List<Course>.empty(growable: true).obs;
  final listSession = List<SessionsModel>.empty(growable: true).obs;
  var listdata = [];
  var listdatatrail = [];
  var tabCtrl;
  var tabTrailCtrl;
  final tabIndex = 0.obs;
  final ishowArrow = false.obs;
  final titleCouser = "".obs;
  final idCouser = 0.obs;
  final durations = Duration().obs;
  final commentCtrl = TextEditingController();
  final repplyCtrl = TextEditingController();
  final onTapRepply = false.obs;
  final videoPlayerController =
      Rx<VideoPlayerController>(VideoPlayerController.network(
    '',
  ));
  final moreSs = false.obs;
  final moreSsTrail = false.obs;
  final id = 0.obs;
  final videoID = 0.obs;
  final duration = Duration().obs;
  final commentId = 0.obs;
  final repplyID = 0.obs;
  final picker = ImagePicker();
  final listImage = List<XFile>.empty(growable: true).obs;
  final listImageRepply = List<XFile>.empty(growable: true).obs;
  final checkSend = false.obs;
  final checkSendReppy = false.obs;
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  ChewieController? chewieController;
  @override
  void onInit() async {
    super.onInit();
    tabTrailCtrl = TabController(vsync: this, length: 2);

    //await getListCourseDetails(Get.arguments ?? 0);
    id.value = Get.arguments ?? 0;
    await getDetailCourse();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    chewieController?.dispose();
    videoPlayerController.value.dispose();
  }

  void increment() => count.value++;

  void onchangeTab(int index) {
    tabIndex.value = index;
  }

  void createChewieController() async {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController.value,
      autoPlay: true,
      looping: false,
      aspectRatio: videoPlayerController.value.value.aspectRatio,
      // customControls: MaterialDesktopControls()
    );
  }

  playVideo() {
    if (videoPlayerController.value.value.isPlaying) {
      videoPlayerController.value.pause();
      isPlay.value = false;
    } else {
      // If the video is paused, play it.
      videoPlayerController.value.play();

      isPlay.value = true;
    }
  }

  Future getDetailCourse() async {
    final response = await HomeProvider.instance.getListCourseDetails(id.value);
    if (response.error.isEmpty) {
      course.value = Course.fromJson(response.data['data']['course']);
      listChapter.value = course.value.trialChapters!;
      if (listChapter.length > 0) {
        listSession.value = listChapter.first.sessions!;
        if (listSession.first.videos != null &&
            listSession.first.videos!.length > 0) {
          await loadVideo(
              id.value,
              listChapter.first.id!,
              listSession.first.id!,
              listSession.first.videos!.first.id!,
              1080,
              listSession.first.videos!.first.briefDescription ?? "");
        }
        // titleCouser.value = ;

      }

      update();
    }
  }

  void moreSession(bool more) {
    moreSs.value = more;
  }

  void moreSessionTrail(bool more) {
    moreSsTrail.value = more;
  }

  void demoToExercise() async {
    // videoPlayerController.value.pause();
    final response = await ExerciseProvider.instance.startUserExercise(
        "courseSessions",
        "${video.value.session!.id}",
        "${video.value.session!.exerciseId}"); // 468, 123, 485 // 162
    if (response.error.isEmpty) {
      Get.toNamed(Routes.EXERCISE_INFO, arguments: {
        'userExerciseResponse': response.data,
        'exercisableType': 'courseSessions',
        'exercisableId': "${listSession.first.id}",
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

  Future loadVideo(int id, int chapter, int sessionsID, int videosID,
      int resolutionID, String title) async {
    videoPlayerController.value.pause();
    videoID.value = videosID;
    final response = await HomeProvider.instance
        .getvideo(id, chapter, sessionsID, videosID, resolutionID);
    if (response.error.isEmpty) {
      video.value = VideoSession.fromJson(response.data['data']['video']);
      videoPlayerController.value = VideoPlayerController.network(
        video.value.downloadableUrl ?? "",
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
      await Future.wait([
        initializeVideoPlayerFuture =
            videoPlayerController.value.initialize().then((value) => {
                  duration.value = videoPlayerController.value.value.duration,
                  print(duration.value),
                })
      ]);
      createChewieController();

      // Use the controller to loop the video.
      durations.value = Duration(seconds: video.value.length!);
      videoPlayerController.value.setLooping(false);
      titleCouser.value = title;
      idCouser.value = videosID;

      update();
    }
  }
}
