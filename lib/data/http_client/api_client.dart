import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/exceptions/client_exception.dart';

class ApiClient {
  ApiClient({required this.baseUrl});

  final String baseUrl;

  Future<T> get<T extends Object>({
    required String path,
    required final T Function(Map<String, dynamic> json) jsonParser,
  }) async {
    final response = await http.get(Uri.parse('$baseUrl/$path'));
    return _handleResponse(response, jsonParser);
  }

  Future<T> post<T extends Object>({
    required String path,
    required Map<String, dynamic> body,
    required final T Function(Map<String, dynamic> json) jsonParser,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$path'),
      body: jsonEncode(body),
      headers: {'content-type': 'application/json; charset=utf-8'},
    );

    return _handleResponse(response, jsonParser);
  }

  T _handleResponse<T>(
    http.Response response,
    final T Function(Map<String, dynamic> json) jsonParser,
  ) {
    switch (response.statusCode) {
      case 200:
        final responseData = response.body;

        if (T == String) {
          return responseData as T;
        } else {
          final decodedJson = jsonDecode(utf8.decode(response.bodyBytes));

          return jsonParser(decodedJson);
        }
      case 400:
        throw BadRequestException(error: response.body);

      case 401:
      case 403:
        throw UnauthorisedException(error: response.body);

      case 404:
        throw NotFoundException(error: response.body);

      case 408:
        throw TimeoutException(error: response.body);

      case 500:
        throw ServerException(error: response.body);

      default:
        throw FetchDataException();
    }
  }
}
