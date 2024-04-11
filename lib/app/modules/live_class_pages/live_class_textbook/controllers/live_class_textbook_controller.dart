import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/data/models/liveclass_models/docs_liveclass_models.dart';
import 'package:elearning/app/data/models/liveclass_models/room_model.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveClassTextbookController extends GetxController {
  //TODO: Implement LiveClassTextbookController

  final room = RoomModel().obs;
  final listData = DocumentLiveclassModel().obs;
  @override
  void onInit() {
    super.onInit();
    room.value = Get.arguments;
    if (room.value.docs != null && room.value.docs!.length > 0) {
      listData.value = room.value.docs!.first;
    } else {
      appSnackbar("Không có tài liệu", type: SnackbarType.error);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void demoToExercise(int exerciseId) async {
    final response = await ExerciseProvider.instance
        .startUserExercise("liveClass", "${room.value.id ?? 0}", "$exerciseId"); // 468, 123, 485 // 162
    if (response.error.isEmpty) {
      Get.toNamed(Routes.EXERCISE_INFO, arguments: {
        'userExerciseResponse': response.data,
        'exercisableType': 'liveClass',
        'exercisableId': "${room.value.id ?? 0}",
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
}
