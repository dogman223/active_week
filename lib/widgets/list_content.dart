import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '/model/activity.dart';
import 'activity_item.dart';

//Widget builds list of activities if not empty
class ListContent extends StatefulWidget {
  ListContent({super.key, required this.activities});

  final List<Activity> activities;

  @override
  State<ListContent> createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  //Method deletes activity from activities list
  void _deleteActivity(Activity activity) {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list/${activity.id}.json');
    http.delete(url);

    setState(() {
      widget.activities.remove(activity);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget listContent = ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.activities.length,
        itemBuilder: (context, index) {
          return ActivityItem(
            activity: widget.activities[index],
            deleteActivity: _deleteActivity,
          );
        });

    if (widget.activities.isEmpty) {
      listContent = const Center(
          child: Text(
        'No Activities yet!',
        style: TextStyle(fontSize: 30),
      ));
    }

    return listContent;
  }
}
