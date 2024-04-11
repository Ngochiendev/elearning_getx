import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';
import 'package:elearning/app/data/providers/book_provider.dart';

class ExamProvider extends BaseProvider {
  static final ExamProvider instance = ExamProvider._internal();
  factory ExamProvider() => instance;
  ExamProvider._internal() {
    initProvider("BASE_API_EXAM");
  }
  Future<ApiResult> getListExamsHomepage() async => await GET('u/homepage');
  Future<ApiResult> getListGrade() async => await GET('u/m_grades');
  Future<ApiResult> getListCategoryCourse() async => await GET('u/categories');
  Future<ApiResult> getListFilterExam(
      String? byFreeword, String? sortOrder, List? categories, List? byGrade, String happenStatus, int page) async {
    final gradess = byGrade != null ? byGrade.join(",") : null;
    final grades = byGrade != null ? "gradeIds=$gradess" : null;
    final cates = categories != null ? "categoryIds=${categories.join(",")}" : null;
    final freeWord = byFreeword != null ? "byFreeword=$byFreeword" : null;
    final sortByKey = sortOrder != null ? "sortOrder=$sortOrder" : "sortOrder=createdAt";
    final happenSta = happenStatus != null ? "happenStatus=$happenStatus" : null;
    return await GET('u/exam?$freeWord&$sortByKey&$cates&$grades&$happenSta&$page=$page');
  }
}
