class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final Object? error;

  AppException({required this.message, this.error, this.stackTrace});

  @override
  String toString() => message;
}
