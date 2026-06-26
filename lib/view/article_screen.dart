import 'package:first_learn/components/today_news.dart';
import 'package:first_learn/components/trending_now.dart';
import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [TrendingNow(), SizedBox(height: 24), TodayNews()],
          ),
        ),
      ),
    );
  }
}
