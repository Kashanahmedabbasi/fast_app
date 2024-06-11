class ApiResponse {
  dynamic data;
  String message;
  int statusCode;

  ///
  ApiResponse({
    required this.data,
    required this.message,
    required this.statusCode,
  }) {
    checkResponse();
  }

  ApiResponse.empty({
    this.data = '',
    this.message = '',
    this.statusCode = 0,
  });

  @override
  String toString() =>
      'ApiResponse(data: $data, message: $message, statusCode: $statusCode)';
}

extension NumberParsing on ApiResponse {
  //
  String checkResponse() {
    switch (statusCode) {
      case 200:
        return message = 'Success';
      case 400:
        return message = 'Bad Request';
      case 404:
        return message = 'Not Found';
      case 500:
        return message = 'Internal Server Error';
    }
    return message;
  }
}
