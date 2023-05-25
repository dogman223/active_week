import 'package:active_week/day_screen/monday.dart';
import 'package:flutter/material.dart';
import 'day_screen/friday.dart';
import 'day_screen/saturday.dart';
import 'day_screen/sunday.dart';
import 'day_screen/thursday.dart';
import 'day_screen/tuesday.dart';
import 'day_screen/wenesday.dart';
import 'screen/week_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Active Week',
      home: WeekScreen(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
