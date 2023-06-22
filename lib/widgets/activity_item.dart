import 'package:flutter/material.dart';

import 'package:active_week/model/activity.dart';

//Appearance of activity element in list
class ActivityItem extends StatelessWidget {
  const ActivityItem({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.tag),
      title: Text(activity.title),
      subtitle: Text(activity.category.name),
    );
  }
}
