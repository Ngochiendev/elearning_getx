import 'dart:math';

import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';

class UserProvider extends BaseProvider {
  static final UserProvider instance = UserProvider._internal();

  UserProvider._internal() {
    initProvider("BASE_API_COURSE");
  }

  Future<ApiResult> registerNewUser(
    String? username,
    String? firstName,
    String? lastName,
    String? phone,
    String? password,
    String? email,
    String? parentEmail,
    int? province,
    String? school,
    String? userClass,
  ) async {
    // final parent = parentEmail != null ? "parent_email=$parentEmail" : null;
    return await POST(
      'u/users/register',
      {
        "parent_email": parentEmail,
        "province_id": province,
        "school": school,
        "class": userClass,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "phone": phone,
        "username": username,
      },
    );
  }

  Future<ApiResult> userLogin(String identifier, String password) async =>
      await POST(
          'u/session/login', {"identifier": identifier, "password": password});

  Future<ApiResult> getNewTopTrend() async => await GET('u/news_categories');

  Future<ApiResult> teacherLogin(String identifier, String password) async =>
      await POST(
          't/session/login', {"identifier": identifier, "password": password});

  Future<ApiResult> changPasswordUser(String email) async =>
      await POST('u/password/forgot_password', {"email": email});
  Future<ApiResult> newPasswordUser(
          String email, String otp, String newPass) async =>
      await POST(
          'u/password?email=$email&token=$otp', {"newPassword": newPass});

  Future<ApiResult> verifyOtp(String email, String otp) async =>
      await PUT('u/users/verify?userEmail=$email&token=$otp', {});

  // Future<ApiResult> getLearningProgress() async => await GET('u/userCourses');
  Future<ApiResult> getLearningsProgress() async => await GET('u/user_courses');
  Future<ApiResult> getUserRating(int id) async => await GET('u/courses/$id/ratings');

  Future<ApiResult> getWalletUser() async =>
      await GET('u/wallets/user_wallet?balanceType=VND');

  Future<ApiResult> getHistoryWallet(int page, String sortOrder) async =>
      await GET('u/wallets?page=$page&sortOrder=$sortOrder&balanceType=VND');

  Future<ApiResult> getEPoint() async =>
      await GET('u/wallets/user_wallet?balanceType=EPOINT');

  Future<ApiResult> changePassWord(String userID, String oldPass,
          String newPass, String conFirmPass) async =>
      await PATCH('u/users/$userID/change_password', {
        "oldPassword": oldPass,
        "newPassword": newPass,
        "confirmPassword": conFirmPass,
      });

  Future<ApiResult> getUserProfile() async =>
      await GET('u/session/current_user');
  Future<ApiResult> getListOrderCourse() async => await GET('u/orders');

  Future<ApiResult> getOrderDetail(String orderID) async =>
      await GET('u/orders/$orderID');
  Future<ApiResult> createOrder(String couponCode, String paymentMethod,
          List<String> coursePackages) async =>
      await POST('u/orders', {
        "couponCode": couponCode,
        "paymentMethod": paymentMethod,
        "coursePackages": coursePackages,
      });

  Future<ApiResult> paymentWallet(
          String balanceType, List<String> orderIds) async =>
      await POST('u/wallets', {
        "balanceType": balanceType,
        "orderIds": orderIds,
      });

  Future<ApiResult> confirmPayment(String token, String orderId) async =>
      await POST('u/orders', {
        "token": token,
        "orderId": orderId,
      });

  Future<ApiResult> updateProfile(String userId,
          {String? firstName,
          String? lastName,
          String? phone,
          String? email,
          String? classs,
          String? school,
          int? province,
          String? parent_email}) async =>
      await PUT('u/users/$userId', {
        "parent_email": parent_email,
        "province_id": province,
        "school": school,
        "class": classs,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone
      });

  Future<ApiResult> uploadImage(String? path) async {
    final fileName = path?.split("/").last;
    final form = FormData({
      "avatar": MultipartFile(path, filename: fileName ?? ""),
    });
    return await PUT('u/users/upload_avatar', form);
  }

  Future<ApiResult> getProvince() async => await GET('u/selections/province');

  Future<ApiResult> rechargeCodes(String code) async =>
      await POST('u/recharge_codes', {
        "code": code,
      });
}
