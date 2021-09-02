import 'package:flutter/material.dart';

import 'Stats.dart';

class PersonalStats extends StatelessWidget {
  final Stats stats;
  PersonalStats({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2E2E2E),
      margin: EdgeInsets.all(30.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                stats.profission,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                  letterSpacing: 1.2,
                ),
              ),
            ),
            SizedBox(height: 6.0),
            Center(
              child: Text(
                stats.hobby,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
