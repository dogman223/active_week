import 'package:flutter/material.dart';

import 'package:active_week/model/activity.dart';

//Appearance of activity element in list
class ActivityItem extends StatelessWidget {
  const ActivityItem({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.tag,
        color: Colors.green,
      ),
      title: Text(
        activity.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(activity.category.name),
    );
  }
}
