import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/data/models/coure_model_progess.dart';
import 'package:elearning/app/data/models/user_couress_model.dart';
import 'package:elearning/app/data/models/user_rating.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/data/providers/user_provider.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseHomeworkMinigameController extends GetxController {
  final learnProgress = List<Datum>.empty(growable: true).obs;
  final learnNewProgress = List<Datum>.empty(growable: true).obs;
  final learnContinueProgress = List<Datum>.empty(growable: true).obs;
  final learnCompleteProgress = List<Datum>.empty(growable: true).obs;
  final learnModel = CouresProgress().obs;
  //final learnModelNew = DataProgessNew().obs;
  final border = 0.obs;
  final progress = 0.0.obs;
  final count = 0.obs;
  final ratingUSer = RatingUser().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getListLearnProgress();
  }

  @override
  void onClose() {}

  void demoToExercise() async {
    final response = await ExerciseProvider.instance.getUserExerciseInfo(
        "courseSessions", "398", "86"); // 468, 123, 485 // 162
    if (response.error.isEmpty) {
      Get.toNamed(Routes.EXERCISE_INFO, arguments: {
        'userExerciseResponse': response.data,
        'exercisableType': 'courseSessions',
        'exercisableId': "398",
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

  Future<RatingUser> getUserRating(int idBook) async {
    final response = await UserProvider.instance.getUserRating(idBook);
    if (response.error.isEmpty) {
      ratingUSer.value = RatingUser.fromJson(response.data['data']['rating']);

      return ratingUSer.value;
    } else {
      return RatingUser();
    }
  }

  void getListLearnProgress() async {
    final response = await UserProvider.instance.getLearningsProgress();
    if (response.error.isEmpty) {
      var courseUser = <Datum>[];

      learnModel.value = CouresProgress.fromJson(response.data);
      courseUser = learnModel.value.data!;
      for (int i = 0; i < courseUser.length; i++) {
        var listId = <int>[];
        progress.value = 0;
        for (int j = 0; j < courseUser[i].sessionExercise!.length; j++) {
          listId.add(courseUser[i].sessionExercise![j].id!);
        }
        final idex =
            listId.toString().replaceFirst("[", "").replaceFirst("]", "");
        print("idex $idex");
        final response2 = await ExerciseProvider.instance
            .historyCourse(idex, "courseSessions");
        print(response2.data!.userExercises!.first);
        var numm = 0;
        // response2.data!.userExercises!.removeWhere((e) => e.id == null);
        if (response2.error.isEmpty) {
          for (int x = 0; x < response2.data!.userExercises!.length; x++) {
            if (response2.data!.userExercises![x].id != null &&
                response2.data!.userExercises![x].totalPointEarned != 0) {
              numm += 1;
            } else {
              numm += 0;
            }
          }

          if (courseUser[i].id == 414) {
            print("lol $numm");
          }

          progress.value = ((courseUser[i].totalProgress! + numm) /
                  (courseUser[i].totalExercises! +
                      courseUser[i].totalSessionVideos!)) *
              100;
        }
        learnProgress.add(Datum(
          introVideo: courseUser[i].introVideo,
          avatar: courseUser[i].avatar,
          id: courseUser[i].id,
          gradeId: courseUser[i].gradeId,
          teacherId: courseUser[i].teacherId,
          title: courseUser[i].title,
          slug: courseUser[i].slug,
          partnerUnit: courseUser[i].partnerUnit,
          briefDescription: courseUser[i].briefDescription,
          description: courseUser[i].description,
          benefit: courseUser[i].benefit,
          requirement: courseUser[i].requirement,
          status: courseUser[i].status,
          defaultExerciseId: courseUser[i].defaultExerciseId,
          isFree: courseUser[i].isFree,
          isHighlight: courseUser[i].isHighlight,
          purchaseCount: courseUser[i].purchaseCount,
          isHidden: courseUser[i].isHidden,
          createdAt: courseUser[i].createdAt,
          updatedAt: courseUser[i].updatedAt,
          deletedAt: courseUser[i].deletedAt,
          totalSessionVideos: courseUser[i].totalSessionVideos,
          totalExercises: courseUser[i].totalExercises,
          totalProgress: progress.value == 0 || progress.value.isNaN
              ? 0
              : progress.value.round(),
          currentSessionId: courseUser[i].currentSessionId,
          userCourses: courseUser[i].userCourses,
          teacher: courseUser[i].teacher,
          sessionExercise: courseUser[i].sessionExercise,
        ));
      }

      final bookContinue = learnProgress
          .where((e) => e.totalProgress! > 0 && e.totalProgress! < 100);
      final bookNew = learnProgress.where((e) => e.totalProgress == 0);
      final bookComplete = learnProgress.where((e) => e.totalProgress! >= 100);
      learnContinueProgress.value = bookContinue.toList();
      learnNewProgress.value = bookNew.toList();
      bookComplete.forEach((e) {
        getUserRating(e.id!).then((value) => learnCompleteProgress.add(Datum(
              introVideo: e.introVideo,
              avatar: e.avatar,
              id: e.id,
              gradeId: e.gradeId,
              teacherId: e.teacherId,
              title: e.title,
              slug: e.slug,
              partnerUnit: e.partnerUnit,
              briefDescription: e.briefDescription,
              description: e.description,
              benefit: e.benefit,
              requirement: e.requirement,
              status: e.status,
              defaultExerciseId: e.defaultExerciseId,
              isFree: e.isFree,
              isHighlight: e.isHighlight,
              purchaseCount: e.purchaseCount,
              isHidden: e.isHidden,
              createdAt: e.createdAt,
              updatedAt: e.updatedAt,
              deletedAt: e.deletedAt,
              totalSessionVideos: e.totalSessionVideos,
              totalExercises: e.totalExercises,
              totalProgress: e.totalProgress,
              currentSessionId: e.currentSessionId,
              ratingAvg: value.rating ?? 0,
              userCourses: e.userCourses,
              teacher: e.teacher,
              sessionExercise: e.sessionExercise,
            )));
      });
    } else {}
  }

  void getListLearnsProgress() async {
    final response = await UserProvider.instance.getLearningsProgress();
    if (response.error.isEmpty) {}
  }

  void onChangeBorder(bool move) {
    if (move) {
      border.value = 10;
    } else {
      border.value = 0;
    }
  }
}
