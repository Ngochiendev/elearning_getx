import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';

class BookProvider extends BaseProvider {
  static final BookProvider instance = BookProvider._internal();
  factory BookProvider() => instance;
  BookProvider._internal() {
    initProvider("BASE_API_EBOOK");
  }

  Future<ApiResult> getListBooksHomepage() async => await GET('u/homepage');
  Future<ApiResult> getListBooks() async => await GET('u/books');
  Future<ApiResult> getListBooksFilter(
    String? freeword,
    String? sortBy,
    String? sortOrder,
    List? specifyCategoryIds,
    List? categoryIds,
    List? gradeIds,
    int page,
  ) async {
    final cateID = categoryIds != null
        ? categoryIds.length > 1
            ? categoryIds.toString().replaceFirst("[", "").replaceFirst("]", "")
            : categoryIds.join(",")
        : null;
    final grades = gradeIds != null
        ? "gradeIds=${gradeIds.length > 1 ? gradeIds.toString().replaceFirst("[", "").replaceFirst("]", "") : gradeIds.join(",")}"
        : null;
    final sortBys = sortBy != null ? "sortBy=$sortBy" : "sortBy=createdAt";
    final categorys = cateID != null ? "categoryIds=$cateID" : null;
    final specifyCategorys = specifyCategoryIds != null
        ? "specifyCategoryIds=${specifyCategoryIds.length > 1 ? specifyCategoryIds.toString().replaceFirst("[", "").replaceFirst("]", "") : specifyCategoryIds.join(",")}"
        : null;
    final freeWords = freeword != null ? "freeword=$freeword" : null;
    return await GET(
        'u/books?page=$page&$categorys&$specifyCategorys&$grades&$freeWords&$sortBys&sortOrder=$sortOrder');
    // return await GET('u/books?$freeWords&$categorys&$sortBys&sortOrder=$sortOrder');
  }

  Future<ApiResult> getListPublisher() async => await GET('u/specify_categories/publisher/');
  Future<ApiResult> getListCategory() async => await GET('u/categories/');
  Future<ApiResult> getListSubjectBooks() async => await GET('u/specify_categories/subject/');
  Future<ApiResult> getDetailBook(String idBook) async {
    return await GET('u/books/$idBook');
  }

  // Future<ApiResult> getListOrderBookHistory() async => await GET('u/orders');

  Future<ApiResult> ratingBook(int idBook, int vote, String content) async {
    return await POST('u/books/$idBook/ratings', {"rating": vote, "content": content});
  }

  Future<ApiResult> getRatingBook(int idBook) async {
    return await GET('u/books/$idBook/ratings');
  }

  Future<ApiResult> getRatingBookForUser(int idBook) async {
    return await GET('u/books/user_books/$idBook/ratings');
  }

  Future<ApiResult> getPdfBooks(int idBook, {int page = 1}) async {
    return await GET('u/books/$idBook/pages?page=$page');
  }

  Future<ApiResult> getListOrderBook() async => await GET('u/orders');
  Future<ApiResult> readBookApi(String idBook, String pageID) async =>
      await PATCH('u/books/$idBook/pages/$pageID/read', {});

  Future<ApiResult> getListBookProgress() async => await GET('u/user_books');
  Future<ApiResult> getCarts() async => await GET('u/carts');
  Future<ApiResult> getTableContent(String idBook) async => await GET('u/books/$idBook/table_of_content');
  Future<ApiResult> getTrialPage(String idBook) async => await GET('u/books/$idBook/trial_pages');

  Future<ApiResult> getExercises(String idBook) async => await GET('u/books/$idBook/exercises');

  Future<ApiResult> addCart(String productId, int quantity) async => await POST('u/carts', {
        "product_id": productId,
        "quantity": quantity,
      });

  Future<ApiResult> deleteCart(List<String> productIds) async => await DELETE('u/carts', {
        "product_ids": productIds,
      });

  Future<ApiResult> createOrder(String couponCode, String paymentMethod, List<String> bookPackages) async =>
      await POST('u/orders', {
        "couponCode": couponCode,
        "paymentMethod": paymentMethod,
        "bookPackages": bookPackages,
      });
  Future<ApiResult> paymentWallet(String balanceType, List<String> orderIds) async => await POST('u/wallets', {
        "balanceType": balanceType,
        "orderIds": orderIds,
      });
  Future<ApiResult> getOrderBookDetail(String orderBookId) async => await GET('u/orders/$orderBookId');
}
