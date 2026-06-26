import 'package:flutter/material.dart';

class TodayNews extends StatelessWidget {
  const TodayNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section header
        Row(
          children: [
            Text(
              "Today News",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            ActionChip(
              label: Text("dot"),
              avatar: Icon(Icons.access_alarm, size: 18),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(children: [Text("data")]),
        // Content goes below here later
      ],
    );
  }
}
