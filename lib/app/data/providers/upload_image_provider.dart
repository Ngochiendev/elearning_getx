import 'dart:convert';
import 'dart:io';

import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';
import 'package:get/get.dart';

class UploadImageProvider extends BaseProvider {
  static final UploadImageProvider instance = UploadImageProvider._internal();
  factory UploadImageProvider() => instance;
  UploadImageProvider._internal() {
    initProvider("BASE_API_UPLOADIMAGE");
  }

  Future<ApiResult> uploadImage(String? path) async {
    final fileName = path?.split("/").last;
    final form = FormData({
      "file": MultipartFile(path, filename: fileName ?? ""),
    });
    return await POST('images?category=content', form);
  }
}
