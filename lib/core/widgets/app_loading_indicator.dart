import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.size = 32, this.repeat = true});

  static const assetPath = 'assets/animations/loading.json';

  final double size;
  final bool repeat;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Loading',
      child: SizedBox.square(
        dimension: size,
        child: Lottie.asset(assetPath, fit: BoxFit.contain, repeat: repeat),
      ),
    );
  }
}
