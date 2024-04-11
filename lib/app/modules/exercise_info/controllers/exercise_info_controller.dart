import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseInfoController extends GetxController {
  final UserExerciseResponse userExerciseResponse = Get.arguments['userExerciseResponse'];
  final String exercisableType = "${Get.arguments['exercisableType']}";
  final String exercisableId = "${Get.arguments['exercisableId']}";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  gotoExercise() async {
    final response = await ExerciseProvider.instance.startUserExercise("$exercisableType", "$exercisableId", "${userExerciseResponse.exercise?.id}");
    if (response.error.isEmpty) {
      if (userExerciseResponse.exercise?.displayType == 'all') {
        Get.toNamed(Routes.EXERCISE_LIST, arguments: {
          'userExerciseResponse': response.data,
          'exercisableType': exercisableType,
          'exercisableId': exercisableId,
        });
      } else {
        Get.toNamed(Routes.EXERCISE_STEP, arguments: {
          'userExerciseResponse': response.data,
          'exercisableType': exercisableType,
          'exercisableId': exercisableId,
        });
      }
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
