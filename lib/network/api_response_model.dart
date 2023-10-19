class ApiResponse {
  ApiResponse({required this.success, this.data, this.message});

  factory ApiResponse.parseBody(Map<dynamic, dynamic> data) {
    return ApiResponse(
      success: data['success'],
      data: data['data'],
      message: data['message']
    );
  }

  bool success;
  Map<String, dynamic>? data;
  String? message;
}


class SuccessApiResponse {
  SuccessApiResponse({required this.success});

  factory SuccessApiResponse.parseBody(Map<dynamic, dynamic> data) {
    return SuccessApiResponse(
      success: data['success']
    );
  }

  bool success;
}
