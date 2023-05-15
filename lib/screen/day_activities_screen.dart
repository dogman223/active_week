import 'package:active_week/list/days_list.dart';
import 'package:flutter/material.dart';

import '../model/activity.dart';

//Screen of activities in a day
class DayActivitiesScreen extends StatelessWidget {
  DayActivitiesScreen({super.key, required this.activities});

  List<Activity> activities = [
    Activity('a1', 'Programming', days.first, Category.learning)
  ];

  //Widget builds list of activities if not empty
  Widget buildListContent(BuildContext context) {
    Widget listContent = ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) => Text(activities[index].title));

    if (activities.isEmpty) {
      listContent = const Center(
          child: Text(
        'No Activities today yet!',
        style: TextStyle(fontSize: 30),
      ));
    }
    return listContent;
  }

  //Build Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hej')), body: buildListContent(context));
  }
}
