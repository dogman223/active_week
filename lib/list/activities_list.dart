import 'package:active_week/model/activity.dart';
import 'package:active_week/widgets/activity_item.dart';
import 'package:flutter/material.dart';

import 'days_list.dart';

class ActivitiesList extends StatelessWidget {
  ActivitiesList({super.key, required this.activities});

  List<Activity> activities = [
    Activity('Programming', days.first, Category.learning)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) =>
                ActivityItem(activity: activities[index])));
  }
}
