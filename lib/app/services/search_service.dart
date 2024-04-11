import 'package:elearning/app/data/models/book_models/cate_model.dart';
import 'package:elearning/app/data/models/book_models/specify_categories_model.dart';
import 'package:elearning/app/data/models/cart_model.dart';
import 'package:elearning/app/data/models/category_course_model.dart';
import 'package:elearning/app/data/models/grade_model.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';

class SearchService extends GetxService {
  var listGrades = List<GradeModel>.empty(growable: true).obs;
  var listGradesExam = List<GradeModel>.empty(growable: true).obs;
  var listcategorys = List<CategoryCourse>.empty(growable: true).obs;
  var listVideolengths = List<Course>.empty(growable: true).obs;
  var listSubjects = List<SpecifyCategoriesModel>.empty(growable: true).obs;
  var listCategoryBooks = List<CateModel>.empty(growable: true).obs;
  var publishers = List<CateModel>.empty(growable: true).obs;
  final eventBus = EventBus();

  void setCurrentGrade(List<GradeModel> grades) {
    listGrades.value = grades;
  }

  void setAuthors(List<CateModel> list) {
    publishers.value = list;
  }

  void setListCategorys(List<CategoryCourse> cates) {
    listcategorys.value = cates;
  }

  void setListCategorysBook(List<CateModel> cates) {
    listCategoryBooks.value = cates;
  }

  void setListSubjectBook(List<SpecifyCategoriesModel> list) {
    listSubjects.value = list;
  }
}
