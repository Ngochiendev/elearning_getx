import 'package:elearning/app/components/app_snack_bar.dart';
import 'package:elearning/app/config/constant.dart';
import 'package:elearning/app/data/models/book_models/book_progress_model.dart';
import 'package:elearning/app/data/models/book_models/rating_book_model.dart';
import 'package:elearning/app/data/models/user_rating.dart';
import 'package:elearning/app/data/providers/book_provider.dart';
import 'package:elearning/app/data/providers/exercise_provider.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart' as tx;
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class BookProgressController extends GetxController {
  //TODO: Implement BookProgressController
  final bookProgress = List<Datum>.empty(growable: true).obs;
  final bookNewProgress = List<Datum>.empty(growable: true).obs;
  final bookContinueProgress = List<Datum>.empty(growable: true).obs;
  final bookNotCompleteProgress = List<Datum>.empty(growable: true).obs;
  final bookExpireProgress = List<Datum>.empty(growable: true).obs;
  final bookCompleteProgress = List<Datum>.empty(growable: true).obs;
  final commentCtrl = tx.TextEditingController();
  final bookModel = BookProgress().obs;
  final cmts = [].obs;
  final vote = 0.obs;
  final count = 0.obs;
  final idUser = "".obs;
  final ratingModel = RatingBookModel().obs;
  final myRating = List<Rating>.empty(growable: true).obs;
  final listRating = List<Rating>.empty(growable: true).obs;
  final box = GetStorage();
  final progress = 0.0.obs;
  var user_exser = 0.obs;
  final useRating = RatingUser().obs;
  final RatingUer = 0.obs;
  final listRatingUer = List<int>.empty(growable: true).obs;
  @override
  void onInit() {
    super.onInit();
    final value = box.read<String>(StorageBox.IdUser);

    if (value != null) {
      idUser.value = value;
      print("useModel$value");
    }
  }

  @override
  void onReady() {
    super.onReady();
    getListBookProgress();
    // getRatingBook(idBook, page, rating)
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void getListBookProgress() async {
    final response = await BookProvider.instance.getListBookProgress();
    if (response.error.isEmpty) {
      var bookUser = <Datum>[];
      bookModel.value = BookProgress.fromJson(response.data);

      bookUser = bookModel.value.data!;
      for (int i = 0; i < bookUser.length; i++) {
        var listId = <int>[];
        progress.value = 0;
        if (bookUser[i].bookExercises!.length < 0 ||
            bookUser[i].bookExercises == null) {
          progress.value = 0.0;
        } else {
          for (int j = 0; j < bookUser[i].bookExercises!.length; j++) {
            listId.add(bookUser[i].bookExercises![j].id!);
          }
          final idex =
              listId.toString().replaceFirst("[", "").replaceFirst("]", "");

          final response2 =
              await ExerciseProvider.instance.historyCourse(idex, "bookPages");

          var numm = 0;
          // response2.data!.userExercises!.removeWhere((e) => e.id == null);
          if (response2.error.isEmpty) {
            for (int x = 0; x < response2.data!.userExercises!.length; x++) {
              if (response2.data!.userExercises![x].id != null) {
                numm += 1;
              } else {
                numm += 0;
              }
            }

            progress.value = ((bookUser[i].totalProgress! + numm) /
                    (bookUser[i].totalPages! +
                        bookUser[i].bookExercises!.length)) *
                100;
          }
        }

        bookProgress.add(new Datum(
          id: bookUser[i].id,
          userId: bookUser[i].userId,
          bookId: bookUser[i].bookId,
          activeAt: bookUser[i].activeAt,
          expireAt: bookUser[i].expireAt,
          createdAt: bookUser[i].createdAt,
          updatedAt: bookUser[i].updatedAt,
          deletedAt: bookUser[i].deletedAt,
          pageCurrentProgress: bookUser[i].pageCurrentProgress,
          totalPages: bookUser[i].totalPages,
          totalProgress: progress.value == 0 || progress.value.isNaN
              ? 0
              : progress.value.round(),
          datumBookExercises: bookUser[i].datumBookExercises,
          ratingAvg: bookUser[i].ratingAvg,
          totalCountRating: bookUser[i].totalCountRating,
          book: bookUser[i].book,
          owner: bookUser[i].owner,
          bookSpecifyCates: bookUser[i].bookSpecifyCates,
          bookExercises: bookUser[i].bookExercises,
        ));
      }
      bookExpireProgress.value = bookProgress
          .where((e) => e.expireAt!.isBefore(DateTime.now()))
          .toList();

      bookContinueProgress.value = bookProgress
          .where((e) => e.expireAt!.isAfter(DateTime.now()))
          .toList()
          .where((e) => e.totalProgress! > 0 && e.totalProgress! < 100)
          .toList();
      bookNewProgress.value = bookProgress
          .where((e) => e.expireAt!.isAfter(DateTime.now()))
          .toList()
          .where((e) => e.totalProgress! == 0)
          .toList();
      final bookComplete = bookProgress
          .where((e) => e.expireAt!.isAfter(DateTime.now()))
          .toList()
          .where((e) => e.totalProgress == 100)
          .toList();
      print(bookNewProgress.length);
      print(bookContinueProgress.length);

      bookComplete.forEach((e) {
        getUserRating(e.bookId!)
            .then((value) => bookCompleteProgress.add(new Datum(
                  id: e.id,
                  userId: e.userId,
                  bookId: e.bookId,
                  activeAt: e.activeAt,
                  expireAt: e.expireAt,
                  createdAt: e.createdAt,
                  updatedAt: e.updatedAt,
                  deletedAt: e.deletedAt,
                  pageCurrentProgress: e.pageCurrentProgress,
                  totalPages: e.totalPages,
                  totalProgress: e.totalProgress,
                  datumBookExercises: e.datumBookExercises,
                  ratingAvg: value==0?0:value,
                  totalCountRating: e.totalCountRating,
                  book: e.book,
                  owner: e.owner,
                  bookSpecifyCates: e.bookSpecifyCates,
                  bookExercises: e.bookExercises,
                )));
      });
    } else {}
  }

  Future ratingBook(int idBook) async {
    final response = await BookProvider.instance
        .ratingBook(idBook, vote.value, commentCtrl.text.trim());
    if (response.error.isEmpty) {
      appSnackbar("Đánh giá sách thành công", type: SnackbarType.success);
    } else {
      if (response.data['error']['messages']['alreadyRating'] != null) {
        appSnackbar(
            "${response.data['error']['messages']['alreadyRating'].toString().replaceAll("]", "").replaceAll("[", "")}",
            type: SnackbarType.error);
      } else if (response.data['error']['messages']['ratingableUser'] ==
          response.data['error']['messages']['ratingableUser']) {
        appSnackbar(
            "${response.data['error']['messages']['ratingableUser'].toString().replaceAll("]", "").replaceAll("[", "")}",
            type: SnackbarType.error);
      }
    }
  }

  Future<int> getUserRating(int idBook) async {
    final response = await BookProvider.instance.getRatingBookForUser(idBook);
    if (response.error.isEmpty) {
      useRating.value = RatingUser.fromJson(response.data['data']['rating']);

      return useRating.value.rating??0;
    } else {
      return 0;
    }
  }

  void onchangeVote(int votes) {
    vote.value = votes;
    update();
  }

  void onChangeComment(String cmt) {
    cmts.addAll([cmt]);
    final comment = cmts.toString().replaceFirst("[", "");
    final comment2 = comment.replaceFirst("]", "");
    final comment3 = comment2.replaceAll(",", " ");
    commentCtrl.value = tx.TextEditingValue(text: comment3);

    cmts.forEach((e) {});
  }

  Future getRatingBook(
    int idBook,
  ) async {
    final response = await BookProvider.instance.getRatingBook(idBook);
    if (response.error.isEmpty) {
      ratingModel.value = RatingBookModel.fromJson(response.data);
      listRating.value = ratingModel.value.data!.ratings!;
      final ratingUser =
          listRating.where((e) => e.userId!.contains(idUser.value));
      myRating.value = ratingUser.toList();
      Logger().d(myRating.length);
      update();
    } else {
      return;
    }
  }
}
