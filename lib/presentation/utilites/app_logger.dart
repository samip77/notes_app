import 'package:logger/logger.dart';

class AppLogger {
  AppLogger() {
    _logger = Logger();
  }

  late Logger _logger;

  void logInfo(final String message) {
    _logger.i(message);
  }

  void logWarning(final String message) {
    _logger.w(message);
  }

  void logError(final String message) {
    _logger.e(message);
  }
}
