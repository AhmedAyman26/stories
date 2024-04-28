class ApiRequestException implements Exception {
  final int statusCode;
  final String errorMessage;

  ApiRequestException(this.statusCode, this.errorMessage);

  @override
  String toString() {
    return """
    ApiRequestException: 
      statusCode = $statusCode
      errorMessage = $errorMessage
    """.trim();
  }
}

class ServerError implements Exception {
  String? error;
  ServerError(this.error);

}

class OfflineException implements Exception {}

class ImageCompressionException implements Exception {}

class GenerateThumbnailException implements Exception {}

class ImageWatermarkException implements Exception {}

class DataBaseExists implements Exception {
  final String errorMessage;

  DataBaseExists(this.errorMessage);
}

class BiometricException implements Exception {}

class FileSizeException implements Exception {
  String errorMessage;

  FileSizeException(this.errorMessage);
}

class UnExpectedException implements Exception {
  final String errorMessage;
  UnExpectedException(this.errorMessage);
}

