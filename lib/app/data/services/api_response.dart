class ApiResponse<T> {
  final int statusCode;
  final String? data;
  final String? errorMessage;

  ApiResponse({
    required this.statusCode,
    this.data,
    this.errorMessage,
  });

  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  factory ApiResponse.success(String data, int statusCode) {
    return ApiResponse<T>(statusCode: statusCode, data: data);
  }

  factory ApiResponse.failure(String errorMessage, int statusCode) {
    return ApiResponse<T>(statusCode: statusCode, errorMessage: errorMessage);
  }

}
