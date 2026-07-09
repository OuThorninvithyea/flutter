import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/config/api_config.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';



class AuthApi {
  class AuthApi._(); // privcate Using

  static Future<LoginResponse> login(LoginRequest request) async  {
    final response = await http.post(ApiConfig.loginUrl(), headers: {
      'Content-Type:' 'application/json',
    },

    body: jsonEncode(request.toJson()), // custom bind to json body
    );

  }
} 