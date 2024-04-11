import 'dart:io';

import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/cart_model.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/data/providers/vnpay_provider.dart';
import 'package:elearning/app/modules/cart_views/cart_payment_banking/components/native_payment.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/cource_views/course_homework_minigame/controllers/course_homework_minigame_controller.dart';
import 'package:elearning/app/modules/main_screen/home/controllers/home_controller.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class CartPaymentBankingController extends GetxController {
  late final CartClass cartCourse;
  late final CartClass cartBook;
  final user = UserModel().obs;
  final balance = 0.obs;
  final couponCode = Get.arguments['couponCode'] ?? '';
  final profileController = Get.find<ProfileController>();
  final homeController = Get.find<HomeController>();
  final listPayment = [
    {"label": "Ví Smartschool"},
    {"label": "Chuyển khoản"},
    {"icon": R.ASSETS_PNG_IC_VNPAY_PNG, "label": "VN pay"},
  ];
  final valueRadio = 0.obs;
  final isPaymentDone = false.obs;
  final isPaymentError = false.obs;

  final ListOrderId = <String>[].obs;
  final idUser = "".obs;
  final box = GetStorage();
  final stateButton = AppElevatedButtonState.active.obs;
  List<String> coursePackages = [];
  List<String> bookPackages = [];
  @override
  void onInit() {
    super.onInit();
    cartCourse = Get.find<CartService>().cart;
    cartBook = Get.find<CartService>().cartBook;
    final value = box.read<String>(StorageBox.IdUser);

    if (value != null) {
      idUser.value = value;
      print("useModel$value");
    }
  }

  @override
  void onReady() {
    super.onReady();

    getUserInfo();
    getWalletInfo();
  }

  @override
  void onClose() {}

  void getUserInfo() async {
    final response = await UserProvider.instance.getUserProfile();
    if (response.error.isEmpty) {
      user.value = UserModel.fromJson(response.data['data']);
      update();
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

  void getWalletInfo() async {
    final response = await UserProvider.instance.getWalletUser();
    if (response.error.isEmpty) {
      balance.value = response.data['data']['balance'];
      update();
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

  tapItemRadio(Object? index) {
    valueRadio.value = index as int;
    update();
  }

  void createOrder() async {
    final paymentMethod = valueRadio.value == 0
        ? PaymentMethod.wallet
        : valueRadio.value == 1
            ? PaymentMethod.banking
            : PaymentMethod.vnpay;
    if (paymentMethod == PaymentMethod.wallet) {
      bool isDoneCourse = true;
      bool isDoneBook = true;
      if ((cartCourse.cartItems?.length ?? 0) > 0) {
        List<String> coursePackages = [];
        cartCourse.cartItems?.forEach((element) {
          coursePackages.add("${element.productId}");
        });
        print(couponCode);
        final response = await UserProvider.instance
            .createOrder(couponCode, paymentMethod, coursePackages);
        if (response.error.isEmpty) {
          final orderId = response.data['data']['order']['id'];
          ListOrderId.add(orderId);
          isDoneCourse = await payOrderCourse(orderId);
        } else {
          isDoneCourse = false;

          appSnackbar(response.error, type: SnackbarType.error);
        }
      }
      if ((cartBook.cartItems?.length ?? 0) > 0) {
        List<String> bookPackages = [];
        cartBook.cartItems?.forEach((element) {
          bookPackages.add("${element.productId}");
        });
        final response = await BookProvider.instance
            .createOrder(couponCode, paymentMethod, bookPackages);
        if (response.error.isEmpty) {
          final orderId = response.data['data']['order']['id'];
          ListOrderId.add(orderId);
          isDoneBook = await payOrderBook(orderId);
        } else {
          isDoneBook = false;
          showDialog(
            context: Get.context!,
            builder: (BuildContext context) => dialogAlert(
              context,
              message: response.error,
            ),
          );
        }
      }

      if (isDoneBook && isDoneCourse) {
        isPaymentDone.value = true;
        Get.find<CartProductController>().listCart.clear();

        Get.find<CartProductController>().cartCource.value = CartClass();
        Get.find<CartProductController>().cartBook.value = CartClass();
        profileController.getEPoint();
        profileController.getWallet();
        homeController.getEPoint();
        homeController.getWallet();
      } else {
        isPaymentError.value = true;
      }
    } else {
      vnPayMethod(paymentMethod);
    }
  }

  void vnPayMethod(String paymentMethod) async {
    stateButton.value = AppElevatedButtonState.loading;
    if ((cartCourse.cartItems?.length ?? 0) > 0) {
      cartCourse.cartItems?.forEach((element) {
        coursePackages.add("${element.productId}");
      });
      print(couponCode);
      final response = await UserProvider.instance
          .createOrder(couponCode, paymentMethod, coursePackages);
      if (response.error.isEmpty) {
        final orderId = response.data['data']['order']['id'];
        ListOrderId.add(orderId);
      } else {
        appSnackbar(response.error, type: SnackbarType.error);
      }
    }
    if ((cartBook.cartItems?.length ?? 0) > 0) {
      cartBook.cartItems?.forEach((element) {
        bookPackages.add("${element.productId}");
      });
      final response = await BookProvider.instance
          .createOrder(couponCode, paymentMethod, bookPackages);
      if (response.error.isEmpty) {
        final orderId = response.data['data']['order']['id'];
        ListOrderId.add(orderId);
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

    final response = await http.get(Uri.parse("https://api.ipify.org"));
    print("responsesssss${response.body}");

    final response2 = await VnPayProvider.instance.createVnpay(
        ListOrderId,
        idUser.value,
        "NCB",
        response.body,
        Platform.isIOS
            ? "https://elearning.flextech.asia/thanh-toan"
            : "https://elearning.flextech.asia/thanh-toan/mobile");

    if (response2.error.isEmpty) {
      if (Platform.isIOS) {
        Get.toNamed(Routes.PAYMENT_INAPP_WEBVIEW,
            arguments: response2.data['data']["payment_url"]);
      } else {
        String paymentResultCodeCode = (await PaymentVnPay.instance.show(
                paymentUrl: response2.data['data']["payment_url"],
                tmnCode: "SMART001",
                scheme: "unilinks"))
            .toString();
        // launch(response2.data['data']["payment_url"]);
        if (paymentResultCodeCode == "0") {
          stateButton.value = AppElevatedButtonState.active;
          coursePackages.clear();
          bookPackages.clear();
          isPaymentDone.value = true;
          Get.find<CartProductController>().listCart.clear();

          Get.find<CartProductController>().cartCource.value = CartClass();
          Get.find<CartProductController>().cartBook.value = CartClass();
          profileController.getEPoint();
          profileController.getWallet();
          homeController.getEPoint();
          homeController.getWallet();
        } else {
          stateButton.value = AppElevatedButtonState.active;
          isPaymentError.value = true;
        }
      }
    }
    print("responsesssss $response");
  }

  void onTabDone() {
    //Get.offNamed(Routes.COURE_LEARN);
    Get.offNamed(Routes.TRANSACTION_HISTORY);
    //Get.until((route) => route.isFirst);
    Get.find<CartProductController>().listCart.clear();

    Get.find<CartProductController>().cartCource.value = CartClass();
    Get.find<CartProductController>().cartBook.value = CartClass();
    Get.find<CourseHomeworkMinigameController>().getListLearnProgress();
    profileController.getEPoint();
    profileController.getWallet();
    homeController.getEPoint();
    homeController.getWallet();
  }

  void onTabReOder() {
    isPaymentError.value = false;
  }

  Future<bool> payOrderCourse(String orderId) async {
    final balanceType = BalanceType.VND;
    if (valueRadio.value == 0) {
      final response =
          await UserProvider.instance.paymentWallet(balanceType, [orderId]);
      if (response.error.isEmpty) {
        return true;
      } else {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: response.error,
          ),
        );
        return false;
      }
    }
    return true;
  }

  Future<bool> payOrderBook(String orderId) async {
    final balanceType = BalanceType.VND;
    if (valueRadio.value == 0) {
      final response =
          await BookProvider.instance.paymentWallet(balanceType, [orderId]);
      if (response.error.isEmpty) {
        return true;
      } else {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) => dialogAlert(
            context,
            message: response.error,
          ),
        );
        return false;
      }
    }
    return true;
  }
}
