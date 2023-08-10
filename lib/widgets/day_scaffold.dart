import 'package:flutter/material.dart';

import 'list_content.dart';
import 'new_activity.dart';
import 'package:active_week/model/activity.dart';

//Scaffold, and function of adding new data, for each day screen.
class DayScaffold extends StatefulWidget {
  DayScaffold({super.key, required this.activities, required this.dayTitle});

  List<Activity> activities;
  String dayTitle;

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

  //General Scaffold configuration for each day.
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openAddActivityOverlay(context),
      ),
    );
  }
}
