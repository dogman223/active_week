import 'package:flutter/material.dart';

import 'package:active_week/model/activity.dart';
import 'package:active_week/list/icons_list.dart';

//Appearance of activity element in list
class ActivityItem extends StatefulWidget {
  const ActivityItem({
    super.key,
    required this.activity,
    required this.deleteActivity,
  });

  final Activity activity;
  final Function deleteActivity;

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  //Method adds icon as leading element to each element of the list.
  addIcon() {
    Icon icon;
    switch (widget.activity.category.name) {
      case 'sport':
        return icon = iconsList[0];
      case 'meal':
        return icon = iconsList[1];
      case 'entertainment':
        return icon = iconsList[2];
      case 'learning':
        return icon = iconsList[3];
      case 'travel':
        return icon = iconsList[4];
      case 'rest':
        return icon = iconsList[5];
      case 'social':
        return icon = iconsList[6];
      case 'spirituality':
        return icon = iconsList[7];
      case 'hobby':
        return icon = iconsList[8];
      case 'family':
        return icon = iconsList[9];
      case 'friends':
        return icon = iconsList[10];
      case 'work':
        return icon = iconsList[11];
      case 'health':
        return icon = iconsList[12];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: addIcon(),
        title: Card(
          elevation: 5,
          child: Text(
            widget.activity.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text(widget.activity.category.name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => widget.deleteActivity(widget.activity),
        ));
  }
}
