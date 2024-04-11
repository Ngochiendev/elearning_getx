import 'package:get/get.dart';

import '../book_progress_model.dart';

class BookProgressProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return BookProgress.fromJson(map);
      if (map is List)
        return map.map((item) => BookProgress.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<BookProgress?> getBookProgress(int id) async {
    final response = await get('bookprogress/$id');
    return response.body;
  }

  Future<Response<BookProgress>> postBookProgress(
          BookProgress bookprogress) async =>
      await post('bookprogress', bookprogress);
  Future<Response> deleteBookProgress(int id) async =>
      await delete('bookprogress/$id');
}
