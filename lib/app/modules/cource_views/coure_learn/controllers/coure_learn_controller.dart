import 'dart:convert';
import 'dart:io';

// import 'package:chewie/chewie.dart';
import 'package:chewie/chewie.dart';
import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/chapters_model.dart';
import 'package:elearning/app/data/models/comment_session_model.dart';
import 'package:elearning/app/data/models/course_model.dart';

import 'package:elearning/app/data/models/document_model.dart';
import 'package:elearning/app/data/models/myrating_couser.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';
import 'package:elearning/app/data/models/rating_course_model.dart';
import 'package:elearning/app/data/models/sessions_model.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/models/video_model.dart';
import 'package:elearning/app/data/models/video_session_model.dart';
import 'package:elearning/app/data/providers/cart_provider.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/data/providers/upload_image_with_http.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

class CoureLearnController extends GetxController
    with SingleGetTickerProviderMixin {
  final cartController = Get.find<CartProductController>();
  final count = 0.obs;
  final course = Course().obs;
  final commentModel = CommentSessionModel().obs;
  final listComment = List<Comment>.empty(growable: true).obs;
  final listAvatar = List<PurpleAttributes>.empty(growable: true).obs;
  final video = VideoSession().obs;
  final document = DocumentsModel().obs;
  Future<void>? initializeVideoPlayerFuture;
  final isDocument = false.obs;

  final isPlay = false.obs;
  final listChapter = List<ChaptersModel>.empty(growable: true).obs;
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
  final ratingCtrl = TextEditingController();
  final repplyCtrl = TextEditingController();
  final onTapRepply = false.obs;
  final videoPlayerController =
      Rx<VideoPlayerController>(VideoPlayerController.network(
    '',
  ));
  final id = 0.obs;
  final duration = Duration().obs;
  final commentId = 0.obs;
  final repplyID = 0.obs;
  final picker = ImagePicker();
  final listImage = List<XFile>.empty(growable: true).obs;
  final listImageRepply = List<XFile>.empty(growable: true).obs;
  final checkSend = false.obs;
  final checkSendReppy = false.obs;
  final listrateCourse = [].obs;
  final cmts = [].obs;
  final vote = 0.obs;
  final idCousers = 0.obs;
  final myvote = 0.obs;
  final myrating = Myrating().obs;
  final ratingCoureModel = RatingCourseModel().obs;
  final myRating = List<Rating>.empty(growable: true).obs;
  final listRating = List<Rating>.empty(growable: true).obs;
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  final buttonState = AppElevatedButtonState.active.obs;
  final buttonReppyState = AppElevatedButtonState.active.obs;
  final box = GetStorage();
  final userCurrent = UserModel().obs;
  final avatarUser = "".obs;
  ChewieController? chewieController;
  @override
  void onClose() {
    super.onClose();
    videoPlayerController.value.dispose();
    chewieController?.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    tabCtrl = TabController(vsync: this, length: 4);
    final value = box.read<String>(StorageBox.User);
    if (value != null) {
      final user = jsonDecode(value);
      userCurrent.value = UserModel.fromJson(user);
      avatarUser.value = userCurrent.value.attributes?.avatar ?? "";
    }
    //await getListCourseDetails(Get.arguments ?? 0);
    id.value = Get.arguments ?? 0;
    await getDetailCourse();
    await getComment();
    listrateCourse.value = [
      "Bài tập rất bổ ích",
      "Khóa học rất bổ ích",
      "Giáo viên dạy rất hay",
    ];
  }
// 0:05:19.916000

  @override
  void onReady() {
    super.onReady();
  }

  void onchangeTab(int index) {
    tabIndex.value = index;
  }

  void onCheckShow(bool isShow) {
    ishowArrow.value = isShow;
  }

  void onchangeVote(int votes) {
    vote.value = votes;
    update();
  }

  void onChangeComment(String cmt) {
    ratingCtrl.value = TextEditingValue(text: cmt);

    // final comment3 = comment2.replaceAll(",", " ");

    cmts.forEach((e) {});
  }

  Future<void> toggleVideo() async {
    await videoPlayerController.value.pause();
    // currPlayIndex = currPlayIndex == 0 ? 1 : 0;
    // await initializePlayer();
  }

  void createChewieController() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController.value,
      autoPlay: true,
      looping: false,
      aspectRatio: videoPlayerController.value.value.aspectRatio,
      // customControls: MaterialDesktopControls()
    );
  }

  Future getDetailCourse() async {
    final response = await HomeProvider.instance.getListCourseDetails(id.value);
    if (response.error.isEmpty) {
      course.value = Course.fromJson(response.data['data']['course']);
      listChapter.value = course.value.chapters!;
      listSession.value = listChapter.first.sessions!;
      idCousers.value = course.value.id!;
      // print(listSession.first.title);
      // titleCouser.value = ;
      getMyRatingCourse("${course.value.id}");
      if (course.value.chapters != null && course.value.chapters!.length > 0) {
        await loadVideo(
            id.value,
            course.value.chapters!.first.id!,
            course.value.chapters!.first.sessions!.first.id!,
            course.value.chapters!.first.sessions!.first.videos!.first.id!,
            1080,
            course.value.chapters!.first.sessions!.first.videos!.first
                    .briefDescription ??
                "");
      }

      update();
    }
  }

  void onTapReply(bool tab) {
//   onTapRepply.value=tab;
  }
//   void timeAlllearn {
//     sumTime += course.value.chapters![id]
// }

  Future loadVideo(int id, int chapter, int sessionsID, int videosID,
      int resolutionID, String title) async {
    if (videoPlayerController.value != null) {
      videoPlayerController.value.dispose();
    }
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
      print(Duration(seconds: video.value.length!));
      // Use the controller to loop the video.
      durations.value = Duration(seconds: video.value.length!);
      videoPlayerController.value.setLooping(false);
      titleCouser.value = title;
      idCouser.value = videosID;
      await getComment();
      update();
    }
  }

  void demoToExercise() async {
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

  Future getComment() async {
    if (video.value.sessionId != null) {
      final response =
          await HomeProvider.instance.getComment(video.value.sessionId!);
      if (response.error.isEmpty) {
        commentModel.value = CommentSessionModel.fromJson(response.data);
        listComment.value = commentModel.value.data!.comments!;
        listAvatar.value =
            commentModel.value.data!.comments!.cast<PurpleAttributes>();

        print(listComment.length);
        // titleCouser.value = ;
        // await loadVideo(id.value, listChapter.first.id!, listSession.first.id!,
        //     listSession.first.videos!.first.id!, 1080,listSession.first.videos!.first.briefDescription!);
        update();
      }
    }
  }

  Future getRatingCourse(int idCouser, int rating, String content) async {
    final response =
        await HomeProvider.instance.getRatingCourse(idCouser, rating, content);
    if (response.error.isEmpty) {
      ratingCtrl.clear();
      if (response.data['data']['rating']['status'] == "pending") {
        appSnackbar("Đánh giá khóa học thành công", type: SnackbarType.success);
      }

      update();
    } else {
      final mess = response.data['error']['messages']['alreadyRating']
          .toString()
          .replaceAll("[", "")
          .replaceFirst("]", "");
      appSnackbar(mess, type: SnackbarType.error);
    }
  }

  Future getMyRatingCourse(String idCouser) async {
    final response = await HomeProvider.instance.getMyraing(idCouser);
    if (response.error.isEmpty) {
      myrating.value = Myrating.fromJson(response.data);

      if (myrating.value.data?.rating == null) {
        myvote.value = 0;
      } else {
        myvote.value = myrating.value.data!.rating!.rating!;
        ratingCtrl.value =
            TextEditingValue(text: myrating.value.data!.rating!.content!);
      }
      update();
    } else {}
  }

  void pickImage() async {
    try {
      final pickedFile = await picker.pickMultiImage();
      if (pickedFile != null) {
        listImage.addAll(pickedFile);
        update();
      }
    } catch (error) {
      error.printError();
    }
  }

  void pickImageRepply() async {
    try {
      final pickedFile = await picker.pickMultiImage();
      if (pickedFile != null) {
        listImageRepply.addAll(pickedFile);
        update();
      }
    } catch (error) {
      error.printError();
    }
  }

  // onTabSendComment(String content) async{
  //   await crateComment(content);

  // }
  void clear() {
    repplyCtrl.clear();
    listImageRepply.clear();
  }

  Future onTabSendRepply(String content, String commentIds) async {
    buttonReppyState.value = AppElevatedButtonState.loading;
    final response = await HomeProvider.instance
        .createRepply(video.value.sessionId!, commentIds, content);
    if (response.error.isEmpty) {
      repplyID.value = response.data['data']['comment']['id'];
      if (listImageRepply.length > 0) {
        for (int i = 0; i < listImageRepply.length; i++) {
          print(listImageRepply[i].path);
          await HomeProvider.instance.postImage(video.value.sessionId!,
              "${repplyID.value}", listImageRepply[i].path);
        }
      }
      repplyCtrl.clear();
      listImageRepply.clear();
      buttonReppyState.value = AppElevatedButtonState.active;
      appSnackbar("Bình luận thành công, vui lòng chờ được phê duyệt",
          type: SnackbarType.success);
      // titleCouser.value = ;
      // await loadVideo(id.value, listChapter.first.id!, listSession.first.id!,
      //     listSession.first.videos!.first.id!, 1080,listSession.first.videos!.first.briefDescription!);
      update();
    } else {
      checkSendReppy.value = true;
      appSnackbar("Bình luận không thành công", type: SnackbarType.error);
    }
  }

  Future onTabSendComment(String content) async {
    buttonState.value = AppElevatedButtonState.loading;
    if (video.value.sessionId != null) {
      final response = await HomeProvider.instance
          .createComment(video.value.sessionId!, content);
      if (response.error.isEmpty) {
        commentId.value = response.data['data']['comment']['id'];
        await UploadImageWithHttp.instance.uploadmultipleimage(
            listImage, video.value.sessionId!, "${commentId.value}");
        // if (listImage.length > 0) {
        //   for (int i = 0; i < listImage.length; i++) {
        //     print(listImage[i].path);

        //     Future.delayed(Duration.zero, () async {});
        //   }
        // }
        commentCtrl.clear();
        listImage.clear();
        buttonState.value = AppElevatedButtonState.active;
        appSnackbar("Bình luận thành công, vui lòng chờ được phê duyệt",
            type: SnackbarType.success);
        // titleCouser.value = ;
        // await loadVideo(id.value, listChapter.first.id!, listSession.first.id!,
        //     listSession.first.videos!.first.id!, 1080,listSession.first.videos!.first.briefDescription!);
        update();
      } else {
        buttonState.value = AppElevatedButtonState.active;
        checkSend.value = true;
        appSnackbar("Bình luận không thành công", type: SnackbarType.error);
      }
    } else {
      buttonState.value = AppElevatedButtonState.active;
      checkSend.value = true;
      appSnackbar("Bình luận không thành công", type: SnackbarType.error);
    }
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
}
