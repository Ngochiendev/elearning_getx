import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/cart_model.dart' as c;
import 'package:elearning/app/data/models/course_model.dart';
import 'package:elearning/app/data/models/document_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';
import 'package:elearning/app/data/providers/cart_provider.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/parse.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

class CourceDetailsController extends GetxController
    with SingleGetTickerProviderMixin {
  final cartController = Get.find<CartProductController>();
  final count = 0.obs;
  final course = Course().obs;
  final couresdetail = Course().obs;
  final document = List<DocumentsModel>.empty(growable: true).obs;
  Future<void>? initializeVideoPlayerFuture;
  final isDocument = false.obs;
  final isPlay = false.obs;
  final listCourse = List<Course>.empty(growable: true).obs;
  var listdata = [];
  final sumTime = 0.obs;
  var listdatatrail = [];
  final purchase = PurchasePackagesModel().obs;
  final purchasePackages =
      List<PurchasePackagesModel>.empty(growable: true).obs;
  final titleCouser = "".obs;

  ScrollController scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  final moreSs = false.obs;
  final moreSsTrail = false.obs;
  TabController? tabCtrl;
  final tabIndex = 0.obs;
  final videoPlayerController =
      Rx<VideoPlayerController>(VideoPlayerController.network(
    '',
  ));

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.value.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    tabCtrl = TabController(vsync: this, length: 2);

    await getListCourseDetails(Get.arguments ?? 0);
    await getlistCourse();

    // initializeVideoPlayerFuture = videoPlayerController.value.initialize();
    if (course.value.introVideo != null && course.value.introVideo != "") {
      videoPlayerController.value = VideoPlayerController.network(
        course.value.introVideo!,
      );
      initializeVideoPlayerFuture = videoPlayerController.value.initialize();

      // Use the controller to loop the video.
      videoPlayerController.value.setLooping(true);
    }

    // Initialize the controller and store the Future for later use.
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onchangeTab(int index) {
    tabIndex.value = index;
  }

  Future getlistCourse() async {
    final response = await HomeProvider.instance.getListCourse();
    if (response.error.isEmpty) {
      final list = <Course>[];

      for (var item in response.data['data']['orders']) {
        list.add(Course.fromJson(item));
      }
      // print(jsonEncode(response.data['data']));
      listCourse.value = list;
      update();
    }
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  toNatiDetail(Course course) {
    print(course);
    Get.toNamed(Routes.COURCE_DETAILS, arguments: course.id ?? 0);
  }

  toCourseDiscount(Course item) async {
    print(course);
    // course.value = item;
    await getListCourseDetails(item.id ?? 0);
  }

  Future getListCourseDetails(int id) async {
    listdata = [];
    listdatatrail = [];
    final response = await HomeProvider.instance.getListCourseDetails(id);
    if (response.error.isEmpty) {
      final data = response.data["data"]["course"];
      course.value = Course.fromJson(data);
      final sessions = course.value.chapters?[0].sessions;
      if (course.value.trialChapters?.length == 0 ||
          course.value.isAlreadyPurchased == 1) {
        tabCtrl = TabController(length: 1, vsync: this);
      }
      if (course.value.chapters != null && course.value.chapters!.length > 0) {
        for (int i = 0; i < course.value.chapters!.length; i++) {
          if (course.value.chapters?[i].sessions != null &&
              course.value.chapters![i].sessions!.length > 0) {
            for (int i2 = 0;
                i2 < course.value.chapters![i].sessions!.length;
                i2++) {
              if (course.value.chapters?[i].sessions?[i2].documents != null &&
                  course.value.chapters![i].sessions![i2].documents!.length >
                      0) {
                document.addAll(
                    course.value.chapters![i].sessions![i2].documents ?? []);

                isDocument.value = true;
              } else {
                isDocument.value = false;
              }
            }
          }
        }
      }

      final listPackages = course.value.purchasePackages;
      if (listPackages != null && listPackages.length > 0) {
        purchasePackages.value = listPackages;
        setPurchasePackage(purchasePackages.first);
      }
      final list =
          course.value.chapters?.map((e) => e.sessions?.forEach((element) {
                listdata.add(element);
              }));
      final listTrail =
          course.value.trialChapters?.map((e) => e.sessions?.forEach((element) {
                listdatatrail.add(element);
              }));

      course.value.chapters!.forEach((e1) {
        e1.sessions!.forEach((e2) {
          e2.videos!.forEach((e3) {
            sumTime.value += e3.length!;
          });
        });
      });

      print("sumTime.value ${Duration(seconds: sumTime.value).inMinutes}");
      print(listTrail);
      print(list);
      print(listdata);
      // final list = )
      //     .length;
      update();
    }
  }

  void moreSession(bool more) {
    moreSs.value = more;
  }

  void moreSessionTrail(bool more) {
    moreSsTrail.value = more;
  }

  setPurchasePackage(PurchasePackagesModel index) {
    purchase.value = index;
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

  addToCart() async {
    if (cartController.listCart
        .where((e) =>
            e.inforProduct!.courseId.toString().contains("${course.value.id}"))
        .isNotEmpty) {
      appSnackbar("Sản phẩm đã có trong giỏ hàng", type: SnackbarType.error);
    } else {
      final response =
          await CartProvider.instance.addCart("c_${purchase.value.id}", 1);
      if (response.error.isEmpty) {
        Get.toNamed(Routes.CART_PRODUCT);
        await cartController.getCartCourseInfo();
        await cartController.getCartBookInfo();
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
  }
}
