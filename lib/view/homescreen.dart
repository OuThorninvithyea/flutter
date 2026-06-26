import 'package:first_learn/components/post.dart';
import 'package:first_learn/components/story.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search clicked');
            },
          ),

          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('Settings clicked');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Story(image: "assets/images/hustle.png"),
                  Story(titlePage: "Visal bang"),
                  Story(titlePage: "Kong Dymond"),
                  Story(titlePage: "Lyheng Lay"),
                  Story(titlePage: "Heng heng"),
                  Story(titlePage: "Ou thorninvithyea"),
                ],
              ),
            ),
            Posts(),
            Posts(),
          ],
        ),
      ),
    );
  }
}
