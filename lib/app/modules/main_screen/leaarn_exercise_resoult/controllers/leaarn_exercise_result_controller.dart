import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/data/models/user_model.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:device_info_plus/device_info_plus.dart';

class LeaarnExerciseResoultController extends GetxController {
  //TODO: Implement LeaarnExerciseResoultController
  final userExerciseResponse = UserExerciseResponse().obs;
  final id = 0.obs;
  final isActiveScene = true.obs;
  final itemScrollController = ItemScrollController();
  final userCurrent = UserModel().obs;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //Create an instance of ScreenshotController
  final screenshotController = ScreenshotController();
  final box = GetStorage();
  // final Map<String, Questions> answers = Get.arguments['answers'];
  // final Map<String, int> results = Get.arguments['results'];
  final results = Map<String, int>().obs;
  int exerciseStatus(Questions question) {
    // 0: none
    // 1: done

    // 2: wrong
    // 3: correct
    // int index = userExerciseResponse.userExercise?.questions?.indexOf(question) ?? 0;
    // return results['$index'] ?? 2;
    return (question.pointEarned ?? 0) > 0 ? 3 : 2;
  }

  Future scroll(int index) async {
    isActiveScene.value = false;
    itemScrollController.scrollTo(
        index: index, duration: Duration(milliseconds: 10));
  }

  Future printPdf() async {
    screenshotController
        .capture(delay: Duration(milliseconds: 10))
        .then((image) async {
      //Capture Done
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      pw.Document pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Expanded(
              // change this line to this:
              child: pw.Image(pw.MemoryImage(image!), fit: pw.BoxFit.contain),
            );
          },
        ),
      );
      Directory? directory;
      try {
        if (Platform.isAndroid) {
          print(androidInfo.version.sdkInt);
          if (androidInfo.version.sdkInt! > 29) {
            await _requestPermission(Permission.manageExternalStorage);
          }
          if (await _requestPermission(Permission.storage)) {
            directory = await getExternalStorageDirectory();
            String newPath = "";
            print(directory);
            List<String> paths = directory!.path.split("/");
            for (int x = 1; x < paths.length; x++) {
              String folder = paths[x];
              if (folder != "Android") {
                newPath += "/" + folder;
              } else {
                break;
              }
            }
            newPath = newPath + "/SmartSchool";
            directory = Directory(newPath);
          } else {
            appSnackbar("Bạn đã từ chối quyền truy cập bộ nhớ",
                type: SnackbarType.error);
          }
        } else {
          if (await _requestPermission(Permission.storage)) {
            directory = await getApplicationDocumentsDirectory();
            print(directory);
          } else {
            appSnackbar("Bạn đã từ chối quyền truy cập bộ nhớ",
                type: SnackbarType.error);
          }
        }

        final filePath =
            "${directory!.path}/${userExerciseResponse.value.userExercise!.title!.replaceAll(" ", "_")}" +
                ".pdf";
        File saveFile = File(filePath);
        print(saveFile.path);
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        if (await directory.exists()) {
          saveFile.writeAsBytesSync(await pdf.save());

          appSnackbar("Tải về thành công", type: SnackbarType.success);
        }
      } catch (e) {
        print(e);
      }

      // if (Platform.isIOS) {
      //   final dir = await getApplicationDocumentsDirectory();

      //   final filePath = "${dir.path}/SmartSchool_${rng.nextInt(100)}" + ".pdf";
      //   final file = File(filePath);

      //   file.writeAsBytesSync(await pdf.save());
      //   print(file.path);
      // } else {
      //   String _localPath = (await ExtStorage.getExternalStoragePublicDirectory(
      //       ExtStorage.DIRECTORY_DOWNLOADS))!;
      //   final filePath =
      //       _localPath + "/" + "SmartSchool_${rng.nextInt(100)}" + ".pdf";
      //   final file = File(filePath);

      //   file.writeAsBytesSync(await pdf.save());

      //   print(file.path);
      // }
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  String getTime() {
    final diff = DateTime.now().difference(DateTime.tryParse(
            userExerciseResponse.value.userExercise!.createdAt!.toString()) ??
        DateTime.now());
    return '${diff.inHours.toString().padLeft(2, '0')}:${(diff.inMinutes % 60).toString().padLeft(2, '0')}:${(diff.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  int getCorrect() {
    int correct = 0;
    for (int i = 0;
        i < (userExerciseResponse.value.userExercise?.questions?.length ?? 0);
        i++) {
      print(userExerciseResponse.value.userExercise?.questions![i].pointEarned);
      if ((userExerciseResponse.value.userExercise?.questions![i].pointEarned ??
              0) >
          0) {
        correct += 1;
      }
    }

    return correct;
  }

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    id.value = Get.arguments['id'];
    final value = box.read<String>(StorageBox.User);
    if (value != null) {
      final user = jsonDecode(value);
      userCurrent.value = UserModel.fromJson(user);
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await gethis(id.value);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  Future gethis(int id) async {
    final response = await ExerciseProvider.instance.getHistoryQuestion(id);

    if (response.error.isEmpty) {
      userExerciseResponse.value =
          UserExerciseResponse.fromJson(response.data['data']);
      //      int qIndex = userExerciseResponse.value.userExercise?.questions
      //         ?.indexWhere((element) => element.id == q.id) ??
      //     0;
      // answers['$qIndex'] = q;
      // results['$qIndex'] = exerciseStatus(q);
    }
  }
}
