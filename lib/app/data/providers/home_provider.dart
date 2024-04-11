import 'dart:io';

import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/globals.dart' as globals;

class HomeProvider extends BaseProvider {
  static final HomeProvider instance = HomeProvider._internal();
  factory HomeProvider() => instance;
  HomeProvider._internal() {
    initProvider("BASE_API_COURSE");
  }

  Future<ApiResult> getListCategoryCourse() async => await GET('u/categories');
  Future<ApiResult> getListTimeCourse() async => await GET('u/courses');
  Future<ApiResult> getListAppSlide(String type, bool isActive) async =>
      await GET('a/banners/$type?isActive=$isActive');
  Future<ApiResult> getListFilterCourse(
      String? byFreeword,
      String? sortBy,
      String? sortOrder,
      bool? isHighlight,
      bool? isFree,
      bool? isDiscount,
      List? categories,
      List? byGrade,
      dynamic fromVideoLengths,
      dynamic toVideoLengths,
      {int page = 1}) async {
    final frvideoLe =
        fromVideoLengths != null ? "fromVideoLengths=$fromVideoLengths" : null;
    final tovideoLe =
        toVideoLengths != null ? "toVideoLengths=$toVideoLengths" : null;
    final gradess = byGrade != null
        ? byGrade.toString().replaceFirst("[", "").replaceFirst("]", "")
        : null;
    final grades = byGrade != null ? "byGrade=$gradess" : null;
    final cates = categories != null
        ? "categoryIds=${categories.toString().replaceFirst("[", "").replaceFirst("]", "")}"
        : null;
    final freeWord = byFreeword != null ? "byFreeword=$byFreeword" : null;
    final sortByKey = sortBy != null ? "sortBy=$sortBy" : "sortBy=createdAt";
    return await GET(
        'u/courses?$freeWord&$sortByKey&sortOrder=$sortOrder&isHighlight=$isHighlight&isFree=$isFree&isDiscount=$isDiscount&$cates&$grades&$frvideoLe&$tovideoLe&page=$page');
  }

  Future<ApiResult> getListTeacherFilterCourse(
      String? byFreeword, String? sortBy, List? categories, List? byGrade,
      {int page = 1}) async {
    final gradess = byGrade != null
        ? byGrade.toString().replaceFirst("[", "").replaceFirst("]", "")
        : null;
    final grades = byGrade != null ? "byGrade=$gradess" : null;
    final cates = categories != null
        ? "categoryIds=${categories.toString().replaceFirst("[", "").replaceFirst("]", "")}"
        : null;
    final freeWord = byFreeword != null ? "freeword=$byFreeword" : null;
    final sortByKey = sortBy != null ? "sortBy=$sortBy" : "sortBy=createdAt";
    return await GET(
        'u/teachers?$freeWord&$sortByKey&$cates&$grades&page=$page');
  }

  Future<ApiResult> getListCourseType(String? sortBy, String? sortOrder,
      bool? isHighlight, bool? isFree) async {
    final sortByKey = sortBy != null ? "sortBy=$sortBy" : null;
    final free = isFree != null ? "isFree=$isFree" : null;
    final highlight = isHighlight != null ? "isHighlight=$isHighlight" : null;

    return await GET(
        'u/courses?$sortByKey&sortOrder=$sortOrder&$highlight&$free');
  }

  Future<ApiResult> getDetailTeacher(String id) async =>
      await GET('u/teachers/$id');

  Future<ApiResult> getDetailCouser(int id) async =>
      await GET("u/user_courses/$id");
  Future<ApiResult> getListCourse() async => await GET('u/courses');
  Future<ApiResult> getHomeCouse() async => await GET('u/homepage');
  Future<ApiResult> getListCourseDetails(int id) async =>
      await GET('u/courses/$id');
  Future<ApiResult> getListGrade() async => await GET('u/m_grades');
  Future<ApiResult> getMyraing(String id) async =>
      await GET('u/courses/$id/ratings');
  Future<ApiResult> getListNew() async => await GET('u/news');
  Future<ApiResult> getDetailNews(int id) async => await GET('u/news/$id');
  Future<ApiResult> getListCoureProgess() async => await GET('u/userCourses');
  Future<ApiResult> postRecharge(String code) async =>
      await POST('u/recharge_codes', {'code': code});
  Future<ApiResult> getComment(int sessionId) async =>
      await GET('u/course_sessions/$sessionId/comments');
  Future<ApiResult> createComment(int sessionId, String content) async =>
      await POST('u/course_sessions/$sessionId/comments', {"content": content});

  Future<ApiResult> createRepply(
          int sessionId, String commentId, String content) async =>
      await POST('u/course_sessions/$sessionId/comments/$commentId/reply',
          {"content": content});

  Future<ApiResult> postImage(
      int sessionId, String commentId, String? path) async {
    final fileName = path?.split("/").last;
    final form = FormData({
      "files": MultipartFile(path, filename: fileName ?? ""),
    });
    return await PATCH(
        'u/course_sessions/$sessionId/comments/$commentId/upload_images', form);
  }

  Future<ApiResult> getRatingCourse(
      int idCourse, int rating, String content) async {
    return await POST(
        'u/courses/$idCourse/ratings', {"rating": rating, "content": content});
  }

  Future<ApiResult> getvideo(int id, int chapter, int sessionsID, int videosID,
          int resolutionID) async =>
      await GET(
          'u/courses/$id/chapters/$chapter/sessions/$sessionsID/videos/$videosID/load/$resolutionID');
}
