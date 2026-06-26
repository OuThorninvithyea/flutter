class Auth {
  final String token;

  Auth(this.token);

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
