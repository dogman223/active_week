import 'package:flutter/material.dart';
import '../models/activity.dart';

//View of activities in a day
class DayActivitiesScreen extends StatelessWidget {
  const DayActivitiesScreen(
      {super.key, required this.title, required this.activities});

  final String title;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => Text(activities[index].title)),
    );
  }
}
