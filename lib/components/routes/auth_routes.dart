import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class AuthRequest {
  final String username;
  final String password;

  AuthRequest(this.username, this.password);

  AuthRequest.fromJson(Map<String, dynamic> json)
    : username = json['username'],
      password = json['password'];
}

Router authRoute() {
  final router = Router();

  router.post('/api/v1/admin/auth/login', (Request req) async {
    
  });

  return router;
}
