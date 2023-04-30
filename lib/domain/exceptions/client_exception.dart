import 'app_exception.dart';

class ClientException extends AppException {
  ClientException({required super.message, super.error, super.stackTrace});
}

class FetchDataException extends ClientException {
  FetchDataException({super.error, super.stackTrace})
      : super(message: 'Error getting data.');
}

class BadRequestException extends ClientException {
  BadRequestException({super.error, super.stackTrace})
      : super(message: 'Invalid request.');
}

class UnauthorisedException extends ClientException {
  UnauthorisedException({super.error, super.stackTrace})
      : super(message: 'Unauthorised request.');
}

class NotFoundException extends ClientException {
  NotFoundException({super.error, super.stackTrace})
      : super(message: 'Resource not found.');
}

class TimeoutException extends ClientException {
  TimeoutException({super.error, super.stackTrace})
      : super(message: 'Request timeout.');
}

class ServerException extends ClientException {
  ServerException({super.error, super.stackTrace})
      : super(message: 'Server error.');
}
