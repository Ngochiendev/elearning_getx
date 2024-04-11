import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/cart_model.dart';
import 'package:elearning/app/data/models/new_top_trend_model.dart';
import 'package:elearning/app/data/providers/cart_provider.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/data/providers/profile_provider.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/main_screen/main/controllers/main_controller.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/cart_service.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning/generated/resource.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final newsModel = DataNews().obs;
  final listNew = List<News>.empty(growable: true).obs;
  final nameNews = "".obs;
  final services = [
    {"icon": R.ASSETS_SVG_SERVICE_COURSE_SVG, "label": LocaleKeys.label_course.tr},
    {"icon": R.ASSETS_SVG_SERVICE_EBOOK_SVG, "label": LocaleKeys.label_ebook.tr},
    {"icon": R.ASSETS_SVG_SERVICE_TEST_SVG, "label": LocaleKeys.label_testOnline.tr},
    {"icon": R.ASSETS_SVG_SERVICE_PHONLINE_SVG, "label": LocaleKeys.label_phOnline.tr},
    {"icon": R.ASSETS_SVG_SERVICE_QUESTION_SVG, "label": LocaleKeys.label_question.tr},
    {"icon": R.ASSETS_SVG_SERVICE_DEPOSIT_SVG, "label": LocaleKeys.label_deposit.tr},
  ];
  final RxInt pointCtrl = 0.obs;
  final RxInt walletUser = 0.obs;
  final isExp = false.obs;
  @override
  void onInit() {
    super.onInit();
    // Get.find<LiveClassService>().disconnectSocket();
  }

  @override
  void onReady() async {
    super.onReady();
    getWallet();

    getCartInfo();
    getEPoint();

    getNewTopTrend();
  }

  @override
  void onClose() {
    super.onClose();
  }

  tapSearch() {
    Get.find<MainController>().changeTabIndex(1);
    Get.toNamed(Routes.MAIN);
  }

  getCartInfo() async {
    final response = await CartProvider.instance.getCarts();
    if (response.error.isEmpty) {
      Get.find<CartService>().setCarts(CartClass.fromJson(response.data["data"]["cart"]));
    }
  }

  void getEPoint() async {
    final response = await UserProvider.instance.getEPoint();
    if (response.error.isEmpty) {
      pointCtrl.value = response.data['data']['balance'];
      print("point home $pointCtrl");
    } else {
      pointCtrl.value = 0;
    }
  }

  void getNewTopTrend() async {
    final response = await UserProvider.instance.getNewTopTrend();
    if (response.error.isEmpty) {
      newsModel.value = DataNews.fromJson(response.data['data']);
      if (newsModel.value.newsCategory != null) {
        listNew.value = newsModel.value.newsCategory!.news!;
        nameNews.value = newsModel.value.newsCategory!.name!;
      }
    } else {}
  }

  void getWallet() async {
    final response = await UserProvider.instance.getWalletUser();
    if (response.error.isEmpty) {
      print("point ${response.data['data']['balance'].toInt()}");
      walletUser.value = response.data['data']['balance'] == null ? 0 : response.data['data']['balance'].toInt();
      isExp.value = false;
    }
    //  else {
    //   // if (response.statusCode == 401) {
    //   if (response.error == "Unauthorized") {
    //     isExp.value = true;
    //     appSnackbar("Phiên đăng nhập đã hêt hạn, vui lòng đăng nhập lại",
    //         type: SnackbarType.error);
    //     Get.find<UserService>().signOut();

    //     Get.find<MainController>().changeTabIndex(1);
    //     Get.until((route) => route.isFirst);
    //     // Get.offNamed(Routes.LOGIN);
    //     Get.offNamed(Routes.SIGNIN);
    //   }
    //   // }
    // }
  }

  onSelectService(e) async {
    if (e["label"] == LocaleKeys.label_course.tr) {
      Get.toNamed(Routes.MAIN_COURSE);
      // final response = await ExerciseProvider.instance.getUserExerciseInfo("bookPages", "716", "173"); // 468, 123, 485 // 162
      // final response = await ExerciseProvider.instance.getUserExerciseInfo("courseSessions", "534", "163"); // 468, 123, 485 // 162
      // if (response.error.isEmpty) {
      //   Get.toNamed(Routes.EXERCISE_INFO, arguments: {'userExerciseResponse': response.data});
      // }
    } else if (e["label"] == LocaleKeys.label_ebook.tr) {
      Get.toNamed(Routes.MAIN_EBOOK);
    } else if (e["label"] == LocaleKeys.label_phOnline.tr) {
      StorageBox.isExpired = "true";
      // Get.until((route) => route.isFirst);
      Get.toNamed(Routes.LIVE_CLASS_LOGIN);
    } else if (e["label"] == LocaleKeys.label_testOnline.tr) {
      Get.toNamed(Routes.MAIN_EEXAM);
    } else if (e['label'] == LocaleKeys.label_deposit.tr) {
      Get.toNamed(Routes.WALLET_USER);
    } else {
      // Get.find<LiveClassService>().connectSocket();
    }

    print(e["label"]);
  }
}
