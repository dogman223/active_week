import 'package:flutter/material.dart';
import '../model/activity.dart';

//View of activities in a day
class DayActivitiesScreen extends StatelessWidget {
  const DayActivitiesScreen(
      {super.key, required this.title, required this.activities});

  final String title;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    Widget listContent = ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) => Text(activities[index].title));

    if (activities.isNotEmpty) {
      listContent;
    } else {
      Text('No Activities');
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: listContent,
    );
  }
}
