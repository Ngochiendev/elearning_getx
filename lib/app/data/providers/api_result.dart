class ApiResult<T> {
  String error;
  T? data;

  ApiResult({
    required this.error,
    this.data,
  });
}
