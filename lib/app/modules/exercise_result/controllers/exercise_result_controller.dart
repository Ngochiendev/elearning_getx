import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:get/get.dart';

class ExerciseResultController extends GetxController {
  final UserExerciseResponse userExerciseResponse = Get.arguments['userExerciseResponse'];
  // final Map<String, Questions> answers = Get.arguments['answers'];
  // final Map<String, int> results = Get.arguments['results'];

  int exerciseStatus(Questions question) {
    // 0: none
    // 1: done
    // 2: wrong
    // 3: correct
    // int index = userExerciseResponse.userExercise?.questions?.indexOf(question) ?? 0;
    // return results['$index'] ?? 2;
    return (question.pointEarned ?? 0) > 0 ? 3 : 2;
  }

  String getTime() {
    final diff = DateTime.now().difference(DateTime.tryParse(userExerciseResponse.userExercise?.createdAt ?? "") ?? DateTime.now());
    return '${diff.inHours.toString().padLeft(2, '0')}:${(diff.inMinutes % 60).toString().padLeft(2, '0')}:${(diff.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  int getCorrect() {
    int correct = 0;
    for (int i = 0; i < (userExerciseResponse.userExercise?.questions?.length ?? 0); i++) {
      print(userExerciseResponse.userExercise!.questions![i].pointEarned);
      if ((userExerciseResponse.userExercise!.questions![i].pointEarned ?? 0) > 0) {
        correct += 1;
      }
    }

    return correct;
  }
}
