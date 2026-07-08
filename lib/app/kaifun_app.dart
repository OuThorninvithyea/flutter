import 'package:flutter/material.dart';

import '../features/home/presentation/home_page.dart';

class KaifunApp extends StatelessWidget {
  const KaifunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaifun',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(title: 'Kaifun'),
    );
  }
}
