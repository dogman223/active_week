import 'package:active_week/model/activity.dart';
import 'package:active_week/widgets/activity_item.dart';
import 'package:flutter/material.dart';

class ActivitiesList extends StatefulWidget {
  ActivitiesList({super.key, required this.activities});

  List<Activity> activities = [];

  @override
  State<ActivitiesList> createState() => _ActivitiesListState();
}

class _ActivitiesListState extends State<ActivitiesList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.builder(
            itemCount: widget.activities.length,
            itemBuilder: (context, index) =>
                ActivityItem(activity: widget.activities[index])));
  }
}
