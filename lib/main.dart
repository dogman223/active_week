import 'package:flutter/material.dart';
import 'screen/week_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Active Week',
      home: const WeekScreen(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
