import 'package:elearning/app/data/models/teacher_detail.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class DetalTeacherController extends GetxController {
  //TODO: Implement DetalTeacherController
  Future<void>? initializeVideoPlayerFuture;
  final id = "".obs;
  final count = 0.obs;
  final isPlay = false.obs;
  final modelDetail = DataDetailTeacher().obs;
  final listCourseTeacher = List<CourseDetailTeacher>.empty(growable: true).obs;
  final videoPlayerController =
      Rx<VideoPlayerController>(VideoPlayerController.network(
    '',
  ));
  @override
  void onInit() {
    super.onInit();
    id.value = Get.arguments ?? "";
    getDetalTeacher(id.value);
    videoPlayerController.value = VideoPlayerController.network(
        "https://flextech-dev.s3-ap-southeast-1.amazonaws.com/videos/origin/c7jp2un6oeac110k26m0.mp4");
    initializeVideoPlayerFuture = videoPlayerController.value.initialize();

    // Use the controller to loop the video.
    videoPlayerController.value.setLooping(true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.value.dispose();
  }

  void increment() => count.value++;

  Future getDetalTeacher(String id) async {
    final response = await HomeProvider.instance.getDetailTeacher(id);
    if (response.error.isEmpty) {
      modelDetail.value = DataDetailTeacher.fromJson(response.data['data']);
      listCourseTeacher.value = modelDetail.value.courses ?? [];
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

  tapSemore(List<CourseDetailTeacher> list) async {
    // Get.until((route) => route.isFirst);
    await Get.toNamed(Routes.DETAIL_COUOURSE_TEACHER, arguments: list);
    update();
  }

  toNatiDetail(int id) {
    Get.toNamed(Routes.COURCE_DETAILS, arguments: id);
  }

  toNatiCouseLernTrail(int id) {
    Get.toNamed(Routes.COURE_TRAIL_PAGE, arguments: id);
  }

  toNatiCouseLern(int id) {
    Get.toNamed(Routes.COURE_LEARN, arguments: id);
  }
}
