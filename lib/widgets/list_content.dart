import 'package:flutter/material.dart';

import '../model/activity.dart';
import 'activity_item.dart';

//Widget builds list of activities if not empty
class ListContent extends StatelessWidget {
  ListContent(
      {super.key, required this.activities, required this.deleteActivity});

  List<Activity> activities;
  final void Function(Activity activity) deleteActivity;

  @override
  Widget build(BuildContext context) {
    Widget listContent = ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: activities.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(activities[index]),
            onDismissed: (direction) {
              deleteActivity(activities[index]);
            },
            child: ActivityItem(
              activity: activities[index],
            )));

    if (activities.isEmpty) {
      listContent = const Center(
          child: Text(
        'No Activities yet!',
        style: TextStyle(fontSize: 30),
      ));
    }

    return listContent;
  }
}
