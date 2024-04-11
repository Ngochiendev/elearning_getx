import 'package:elearning/app/data/models/history_course.dart' as d;
import 'package:elearning/app/data/models/history_exercise.dart' as u;
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';

class ExerciseProvider extends BaseProvider {
  static final ExerciseProvider instance = ExerciseProvider._internal();
  factory ExerciseProvider() => instance;
  ExerciseProvider._internal() {
    initProvider('BASE_API_QUESTION');
  }

  Future<ApiResult<UserExerciseResponse>> getUserExerciseInfo(
      String exercisableType, String exercisableId, String exerciseId) async {
    final response = await GET(
        'u/user_exercises/new?exercisableType=$exercisableType&exercisableId=$exercisableId&exerciseId=$exerciseId');
    if (response.error.isEmpty) {
      return ApiResult(
          error: '',
          data: UserExerciseResponse.fromJson(response.data['data']));
    } else {
      return ApiResult(error: response.error, data: null);
    }
  }

  Future<ApiResult<UserExerciseResponse>> startUserExercise(
      String exercisableType, String exercisableId, String exerciseId) async {
    final response = await POST('u/user_exercises', {
      "exercisableType": exercisableType,
      "exercisableId": exercisableId,
      "exerciseId": exerciseId
    });
    if (response.error.isEmpty) {
      return ApiResult(
          error: '',
          data: UserExerciseResponse.fromJson(response.data['data']));
    } else {
      return ApiResult(error: response.error, data: null);
    }
  }

  Future<ApiResult<UserExerciseResponse>> continueUserExercise(
      String userExerciseId) async {
    final response = await GET('u/user_exercises/$userExerciseId');
    if (response.error.isEmpty) {
      return ApiResult(
          error: '',
          data: UserExerciseResponse.fromJson(response.data['data']));
    } else {
      return ApiResult(error: response.error, data: null);
    }
  }

  Future<ApiResult<d.DataHistoryCourse>> historyCourse(
      String userExerciseId, String type) async {
    final response = await GET(
        'u/user_exercises?exercisableType=$type&exercisableId=$userExerciseId');
    if (response.error.isEmpty) {
      return ApiResult(
          error: '', data: d.DataHistoryCourse.fromJson(response.data['data']));
    } else {
      return ApiResult(error: response.error, data: null);
    }
  }

  Future<ApiResult> historyCourseDone(
      String userExerciseId, String type) async {
    return await GET(
        'u/user_exercises?exercisableType=$type&exercisableId=$userExerciseId');
  }

  Future<ApiResult<u.DataHistoryEx>> historyUserExercise(
      int exercisableId, int exerciseId) async {
    final response = await GET(
        'u/user_exercises/history?exercisableType=bookPages&exercisableId=$exercisableId&exerciseId=$exerciseId');
    if (response.error.isEmpty) {
      return ApiResult(
          error: '', data: u.DataHistoryEx.fromJson(response.data['data']));
    } else {
      return ApiResult(error: response.error, data: null);
    }
  }

  Future<ApiResult> getHistoryQuestion(int id) async =>
      await GET("u/user_exercises/$id");

  Future<ApiResult<UserExerciseResponse>> updateUserExercise(
      String userExerciseId, List<Questions> questions, String status) async {
    // inprogress, finish
    List<Map<String, dynamic>> list = [];
    questions.forEach((element) {
      list.add({
        "id": element.id,
        "displayContent": element.qDisplayContent == null
            ? element.mDisplayContent?.toJson()
            : element.qDisplayContent?.toJson(),
      });
    });
    final response = await PATCH('u/user_exercises/$userExerciseId', {
      "status": status,
      "questions": list,
    });
    if (response.error.isEmpty) {
      return ApiResult(
          error: '',
          data: UserExerciseResponse.fromJson(response.data['data']));
    } else {
      return ApiResult(error: response.error, data: null);
    }
  }
}
