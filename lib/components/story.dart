import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  final String titlePage;
  final double spacing;
  final double width;
  final String image;

  const Story({
    super.key,
    this.image = "assets/images/image.png",
    this.titlePage = 'Your Story',
    this.spacing = 6,
    this.width = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: spacing),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gradient ring around the profile image
          Container(
            width: width,
            height: width,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF58529),
                  Color(0xFFDD2A7B),
                  Color(0xFF8134AF),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            padding: const EdgeInsets.all(3),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(2),
              child: ClipOval(child: Image.asset(image, fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: width,
            child: Text(
              titlePage,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
