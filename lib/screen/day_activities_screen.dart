import 'package:flutter/material.dart';
import '../model/activity.dart';

//View of activities in a day
class DayActivitiesScreen extends StatelessWidget {
  const DayActivitiesScreen({super.key, required this.activities});

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    //List view
    Widget listContent = ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) => Text(activities[index].title));

    if (activities.isEmpty) {
      listContent = const Text('No Activities!');
    }

    return Scaffold(appBar: AppBar(title: Text('Hej')), body: listContent);
  }
}
