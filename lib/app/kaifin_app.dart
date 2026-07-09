import 'package:flutter/material.dart';

import '../features/auth/presentation/login_page.dart';

class KaifinApp extends StatelessWidget {
  const KaifinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaifin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
    );
  }
}
