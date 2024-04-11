import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import '../../services/globals.dart' as globals;

class UploadImageWithHttp extends BaseProvider {
  static final UploadImageWithHttp instance = UploadImageWithHttp._internal();
  factory UploadImageWithHttp() => instance;
  UploadImageWithHttp._internal() {
    initProvider("BASE_API_COURSE");
  }

  Future uploadmultipleimage(
    List<XFile> images,
    int sessionId,
    String commentId,
  ) async {
    var uri = Uri.parse("${httpClient.baseUrl}u/course_sessions/$sessionId/comments/$commentId/upload_images");

    http.MultipartRequest request = new http.MultipartRequest('PATCH', uri);
    request.headers['Authorization'] = 'Bearer ${globals.accessToken}';
    request.headers['Content-Type'] = 'multipart/form-data';
    print('============================================================');
    print('[PATCH] ' + "$uri");

    //multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));

    List<MultipartFile> newList = [];

    for (int i = 0; i < images.length; i++) {
      File imageFile = File(images[i].path.toString());
      var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile("files", stream, length, filename: basename(imageFile.path));
      newList.add(multipartFile);
    }

    request.files.addAll(newList);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  Future<String?> uploadmultipleimageChatLive(
    List<XFile> images,
  ) async {
    var uri = Uri.parse("http://liveclass-elearning.flextech.asia/file-storage/file");

    http.MultipartRequest request = new http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer ${globals.accessToken}';
    request.headers['Content-Type'] = 'multipart/form-data';
    print('============================================================');
    print('[PATCH] ' + "$uri");

    //multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));

    List<MultipartFile> newList = [];

    for (int i = 0; i < images.length; i++) {
      File imageFile = File(images[i].path.toString());
      var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile("files", stream, length, filename: basename(imageFile.path));
      newList.add(multipartFile);
    }

    request.files.addAll(newList);
    var response = await request.send();

    // response.stream.transform(utf8.decoder).listen((value) {
    //   print(value);
    // });
    if (response.statusCode == 201) {
      final data = await http.Response.fromStream(response);
      final result = data.body;
      return result;
    } else {
      return null;
    }
  }
}
