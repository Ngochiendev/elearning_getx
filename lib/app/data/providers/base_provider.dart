import 'dart:io';

import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/modules/main_screen/main/controllers/main_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/services/user_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import '../../services/globals.dart' as globals;
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String COMMON_ERROR_MESSAGE = 'Có lỗi xảy ra, vui lòng thử lại sau.';

class BaseProvider extends GetConnect {
  void initProvider(String? base) {
    httpClient.baseUrl = dotenv.env[base == null ? "BASE_API_COURSE" : base];
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> GET(String url) async {
    print('============================================================');
    print('[GET] ' + httpClient.baseUrl! + url);
    Logger().d('[TOKEN] ' + 'Bearer ${globals.accessToken}');
    try {
      final response = await get(url, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      // final response = await get(url, headers: {'Authorization': 'Bearer ${"globals.accessToken"}'});
      if (response.statusCode == 401 && StorageBox.isExpired == "false") {
        appSnackbar("Phiên đăng nhập đã hêt hạn, vui lòng đăng nhập lại", type: SnackbarType.error);
        Get.find<UserService>().signOut();

        Get.find<MainController>().changeTabIndex(1);
        StorageBox.isExpired = "true";
        Get.until((route) => route.isFirst);
        // Get.offNamed(Routes.LOGIN);
        Get.offNamed(Routes.SIGNIN);
      }
      if (response.body != null) {
        var result = response.body;
        Logger().d(result);
        if (response.bodyString == "Unauthorized") {
          return ApiResult<dynamic>(
            error: "Unauthorized",
            data: null,
          );
        }
        return ApiResult<dynamic>(
          error: response.isOk ? '' : (result['message'] ?? COMMON_ERROR_MESSAGE),
          data: result,
        );
      } else {
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      print(error);
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> POST(String url, dynamic body) async {
    print('============================================================');
    print('[POST] ' + httpClient.baseUrl! + url);
    print('[Bearer Token] ' + '${globals.accessToken}');
    print('[PARAMS] ' + body.toString());
    try {
      final response = await post(url, body, headers: {
        'Authorization': 'Bearer ${globals.accessToken}',
      });

      if (response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: response.isOk ? '' : (result['message'] ?? COMMON_ERROR_MESSAGE),
          data: result,
        );
      } else {
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  Future<ApiResult> POSTWITHHEADER(
      String url, dynamic body, dynamic header) async {
    print('============================================================');
    print('[POST] ' + httpClient.baseUrl! + url);
    print('[Bearer Token] ' + '${globals.accessToken}');
    print('[PARAMS] ' + body.toString());
    try {
      final response = await post(url, body, headers: header);

      if (response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error:
              response.isOk ? '' : (result['message'] ?? COMMON_ERROR_MESSAGE),
          data: result,
        );
      } else {
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  Future<ApiResult> POSTAUDIO(String url, dynamic body) async {
    print('============================================================');
    print('[POST] ' + httpClient.baseUrl! + url);
    // print('[Bearer Token] ' + '${globals.accessToken}');
    print('[PARAMS] ' + body.toString());
    try {
      final response = await post(url, body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: response.isOk ? '' : (result['message'] ?? COMMON_ERROR_MESSAGE),
          data: result,
        );
      } else {
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> PUT(String url, dynamic body) async {
    print('============================================================');
    print('[PUT] ' + httpClient.baseUrl! + url);
    print('[Bearer Token] ' + '${globals.accessToken}');
    print('[PARAMS] ' + body.toString());
    try {
      final response = await patch(url, body, headers: {'Authorization': 'Bearer ${globals.accessToken}'});

      if (response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: response.isOk ? '' : (result['message'] ?? COMMON_ERROR_MESSAGE),
          data: result,
        );
      } else {
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> PATCH(String url, dynamic body, {dynamic headers}) async {
    print('============================================================');
    print('[PATCH] ' + httpClient.baseUrl! + url);
    print('[Bearer Token] ' + '${globals.accessToken}');
    print('[PARAMS] ' + body.toString());
    try {
      final response = await patch(url, body,
          headers: headers == null ? {'Authorization': 'Bearer ${globals.accessToken}'} : headers);
      // if (response.statusCode == 401) {
      //   print("hết hạn");
      //   Get.find<UserService>().signOut();

      //   Get.find<MainController>().changeTabIndex(1);
      //   Get.until((route) => route.isFirst);
      //   // Get.offNamed(Routes.LOGIN);
      //   Get.offNamed(Routes.SIGNIN);
      //   return ApiResult<dynamic>(
      //     error: response.statusText ?? '',
      //   );
      // }
      if (response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: response.isOk ? '' : (result['message'] ?? COMMON_ERROR_MESSAGE),
          data: result,
        );
      } else {
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> DEL(String url) async {
    print('============================================================');
    print('[Bearer Token] ' + '${globals.accessToken}');
    print('[DELETE] ' + httpClient.baseUrl! + url);

    try {
      final response = await delete(url, headers: {'Authorization': 'Bearer ${globals.accessToken}'});

      if (response.body != null) {
        var result = response.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: response.isOk ? '' : (result['message'] ?? COMMON_ERROR_MESSAGE),
          data: result,
        );
      } else {
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  Future<ApiResult> DELETHTTP(String urlDel, dynamic body) async {
    print('============================================================');
    print('[Bearer Token] ' + '${globals.accessToken}');
    print('[DELETE] ' + httpClient.baseUrl! + urlDel);
    try {
      final url = Uri.parse(httpClient.baseUrl! + urlDel);
      final request = http.Request("DELETE", url);

      request.headers
          .addAll(<String, String>{"Accept": "application/json", 'Authorization': 'Bearer ${globals.accessToken}'});
      request.body = jsonEncode(body);
      final response = await request.send();
      final resultRes = await http.Response.fromStream(response);
      if (resultRes.body != null) {
        var result = resultRes.body;
        // Logger().d(result);
        return ApiResult<dynamic>(
          error: "Error",
          data: result,
        );
      } else {
        return ApiResult<dynamic>(
          error: "Delete error",
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> DELETE(String url, dynamic body) async {
    print('============================================================');
    print('[Bearer Token] ' + '${globals.accessToken}');
    print('[DELETE] ' + httpClient.baseUrl! + url);
    try {
      final response = await httpClient.request(url, 'delete',
          headers: {'Authorization': 'Bearer ${globals.accessToken}'}, body: body);

      if (response.body != null) {
        var result = response.body;
        // Logger().d(result);
        return ApiResult<dynamic>(
          error: response.isOk ? '' : (result['message'] ?? COMMON_ERROR_MESSAGE),
          data: result,
        );
      } else {
        return ApiResult<dynamic>(
          error: response.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      print('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      print('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }
}
