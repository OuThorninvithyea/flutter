import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaifin_v1/features/auth/data/models/login_request.dart';
import 'package:kaifin_v1/features/auth/data/services/auth_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLogginIn = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text;
    final url = ApiConfig.loginUrl();

    if (username.isEmpty || password.isEmpty) {
      return;
    }

    setState(() {
      isLogginIn = true;
    });

    try {
      final request = LoginRequest(username: username, password: password);
      final response = await AuthApi.login(request);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight > 32
                      ? constraints.maxHeight - 32
                      : 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xFF1849D6),
                          size: 22,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F1F1F),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 22),
                      ],
                    ),

                    const SizedBox(height: 32),

                    Center(
                      child: SvgPicture.asset(
                        'assets/logos/kaifin_logo.svg',
                        width: 64,
                        height: 64,
                      ),
                    ),

                    const SizedBox(height: 32),

                    const Text(
                      'Username',
                      style: TextStyle(fontSize: 12, color: Color(0xFF050F2B)),
                    ),

                    const SizedBox(height: 2),

                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        hintText: 'Input username',
                        hintStyle: TextStyle(color: Color(0xFFBCBCBC)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 12, color: Color(0xFF050F2B)),
                    ),
                    const SizedBox(height: 2),
                    TextField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Input your password',
                        hintStyle: const TextStyle(color: Color(0xFFBCBCBC)),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1849D6),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFF1849D6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    const _SocialLoginButton(
                      label: 'Continue with Google',
                      icon: _GoogleMark(),
                      backgroundColor: Colors.white,
                      textColor: Color(0xFF1F1F1F),
                      hasShadow: true,
                    ),
                    const SizedBox(height: 12),
                    const _SocialLoginButton(
                      label: 'Continue with Facebook',
                      icon: _FacebookMark(),
                      backgroundColor: Color(0xFF1877F2),
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    const _SocialLoginButton(
                      label: 'Continue with Apple',
                      icon: Icon(Icons.apple, color: Colors.white, size: 26),
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    ),

                    const SizedBox(height: 32),

                    Center(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(text: "You don't have an account? "),
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(color: Color(0xFF1849D6)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.hasShadow = false,
  });

  final String label;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: hasShadow
            ? const [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.08), blurRadius: 3),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.17),
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: SizedBox(
        height: 58,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoogleMark extends StatelessWidget {
  const _GoogleMark();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'G',
      style: TextStyle(
        color: Color(0xFF4285F4),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _FacebookMark extends StatelessWidget {
  const _FacebookMark();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 12,
      backgroundColor: Colors.white,
      child: Text(
        'f',
        style: TextStyle(
          color: Color(0xFF1877F2),
          fontSize: 22,
          height: 1,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
