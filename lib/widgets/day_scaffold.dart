import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'list_content.dart';
import 'new_activity.dart';
import '/model/activity.dart';

//Scaffold, and function of adding new data, for each day screen.
class DayScaffold extends StatefulWidget {
  DayScaffold({super.key, required this.activities, required this.dayTitle});

  List<Activity> activities;
  var dayTitle;

  @override
  State<DayScaffold> createState() => _DayScaffoldState();
}

class _DayScaffoldState extends State<DayScaffold> {
  //Method opens modal bottom sheet with add new activity function.
  void _openAddActivityOverlay(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (contex) => NewActivity(onAddActivity: _addActivity));
  }

  //Method adds New Actvity to activities list
  void _addActivity(Activity activity) async {
    setState(() {
      widget.activities.add(activity);
    });
  }

  //Method deletes activity from activities list
  void _deleteActivity(Activity activity) {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list/${activity.id}.json');
    http.delete(url);

    setState(() {
      widget.activities.remove(activity);
    });
  }

  //General Scaffold configuration for each day_screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dayTitle),
        elevation: 20,
        shadowColor: Theme.of(context).primaryColor,
      ),
      body: ListContent(
        activities: widget.activities,
        deleteActivity: _deleteActivity,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openAddActivityOverlay(context),
      ),
    );
  }
}
