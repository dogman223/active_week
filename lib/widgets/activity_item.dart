import 'package:flutter/material.dart';

import 'package:active_week/model/activity.dart';

//Appearance of activity element
class ActivityItem extends StatelessWidget {
  const ActivityItem({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(activity.title),
      ),
    );
  }
}
