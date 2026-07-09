import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../../../../core/config/api_config.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../../../../core/network/api_exception.dart';

class AuthApi {
  const AuthApi._(); // privcate Using

  static Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await http
          .post(
            ApiConfig.loginUrl(),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(request.toJson()),
          )
          .timeout(const Duration(seconds: 15));

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final message = body['message'] as String? ?? 'Login failed';

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw ApiException(
          message,
          statusCode: response.statusCode,
        ); // custom error response
      }

      if (body['success'] != true) {
        throw ApiException(message, statusCode: response.statusCode);
      }

      return LoginResponse.fromJson(body);
    } on TimeoutException {
      throw const ApiException('Request timed out. Please try again.');
    } on FormatException {
      throw const ApiException('Invalid server repsonse.');
    } on http.ClientException {
      throw const ApiException('Could not connect to server');
    }
  }
}
