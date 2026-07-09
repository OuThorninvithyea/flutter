class ApiConfig {
  const ApiConfig._();

  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://127.0.0.1:9000',
  );

  static const String loginPath = '/api/v1/admin/auth/login';

  static Uri loginUrl() {
    return Uri.parse('$baseUrl$loginPath');
  }
}
