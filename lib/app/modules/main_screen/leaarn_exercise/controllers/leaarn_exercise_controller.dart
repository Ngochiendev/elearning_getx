import 'package:elearning/app/data/learn_exercies_model.dart';
import 'package:elearning/app/data/models/history_course.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/data/providers/home_provider.dart';
import 'package:get/get.dart';

class LeaarnExerciseController extends GetxController {
  //TODO: Implement LeaarnExerciseController

  final id = 0.obs;
  final dataCouser = DataLearnExercise().obs;
  final progress = 0.0.obs;
  final listquestion = List<UserExercise>.empty(growable: true).obs;
  final pointEx = 0.0.obs;
  final point = 0.0.obs;
  final totalPoint = 0.0.obs;
  @override
  void onInit() async {
    super.onInit();
    id.value = Get.arguments ?? 0;
    await getDetail(id.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future getDetail(int id) async {
    var listId = <int>[];
    var numm = 0;
    final response = await HomeProvider.instance.getDetailCouser(id);
    if (response.error.isEmpty) {
      dataCouser.value = DataLearnExercise.fromJson(response.data['data']);
      if (dataCouser.value.sessionExerciseIds == null ||
          dataCouser.value.sessionExerciseIds?.length == 0) {
        progress.value = 0;
      } else {
        for (int i = 0; i < dataCouser.value.sessionExerciseIds!.length; i++) {
          progress.value = 0;

          if (dataCouser.value.sessionExerciseIds![i].exerciseId != null) {
            listId.add(dataCouser.value.sessionExerciseIds![i].sessionId!);
          }
        }
        final idex = listId.join(",");
        print("idex $idex");
        final response2 = await ExerciseProvider.instance
            .historyCourse(idex, "courseSessions");

        // response2.data!.userExercises!.removeWhere((e) => e.id == null);
        if (response2.error.isEmpty) {
          listquestion.value = response2.data?.userExercises
                  ?.where((e) => e.id != null)
                  .toList() ??
              [];
          for (int x = 0; x < response2.data!.userExercises!.length; x++) {
            if (response2.data!.userExercises![x].id != null &&
                response2.data!.userExercises![x].totalPointEarned != 0) {
              numm += 1;
            } else {
              numm += 0;
            }
            if (response2.data!.userExercises![x].id != null) {
              point.value +=
                  response2.data!.userExercises![x].totalPointEarned!;
              totalPoint.value +=
                  response2.data!.userExercises![x].totalPoints!;
            }
          }
          pointEx.value = (point.value / totalPoint.value) * 10;
          print(pointEx.value);
          progress.value = ((dataCouser.value.course!.totalProgress! + numm) /
                  (dataCouser.value.course!.totalExercises! +
                      dataCouser.value.course!.totalSessionVideos!)) *
              100;
        }
      }
    }
  }
}
