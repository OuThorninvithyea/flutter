class LoginResponse {
  const LoginResponse({
    // repsonse body
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  final bool success;
  final String message;
  final int statusCode;
  final LoginData data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] as bool,
      message: json['message'] as String, // constrcuter reponse body
      statusCode: json['status_code'] as int,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class LoginData {
  const LoginData({required this.auth}); // Map Struct Auth

  final AuthToken auth;

  factory LoginData.fromJson(Map<String, dynamic> json) {
    // constructer respone Map body
    return LoginData(
      auth: AuthToken.fromJson(json['auth'] as Map<String, dynamic>),
    );
  }
}

class AuthToken {
  const AuthToken({
    required this.token,
    required this.tokenType,
  }); // maop struct token

  final String token;
  final String tokenType;

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      token: json['token'] as String, // constructer respone Map body
      tokenType: json['token_type'] as String,
    );
  }
}
