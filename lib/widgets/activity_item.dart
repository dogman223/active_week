import 'package:flutter/material.dart';

import 'package:active_week/model/activity.dart';

//Appearance of activity element in list
class ActivityItem extends StatelessWidget {
  const ActivityItem(
      {super.key, required this.activity, required this.deleteActivity});

  final Activity activity;
  final Function deleteActivity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(
          Icons.tag,
          color: Colors.green,
        ),
        title: Card(
          elevation: 5,
          child: Text(
            activity.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text(activity.category.name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => deleteActivity(activity),
        ));
  }
}
