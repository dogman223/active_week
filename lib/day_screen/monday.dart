import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:active_week/list/days_list.dart';
import '../model/activity.dart';
import '../widgets/new_activity.dart';

//Screen of activities in a day
class MondayScreen extends StatefulWidget {
  MondayScreen({super.key, required this.activities});

  List<Activity> activities;

  @override
  State<MondayScreen> createState() => _MondayScreenState();
}

class _MondayScreenState extends State<MondayScreen> {
  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  //Method loads data from data base.
  void _loadActivities() async {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    for (final item in listData.entries) {
      widget.activities
          .add(Activity(item.value['title'], days.first, Category.family));
    }
    setState(() {
      widget.activities;
    });
  }

  //Method opens modal bottom sheet
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
  //void _deleteActivity(Activity activity) {
  //setState(() {
  //  widget.activities.remove(activity);
  //});
  //}

  //Widget builds list of activities if not empty
  Widget buildListContent(BuildContext context) {
    Widget listContent = ListView.builder(
        itemCount: widget.activities.length,
        itemBuilder: (context, index) => Text(widget.activities[index].title));

    if (widget.activities.isEmpty) {
      listContent = const Center(
          child: Text(
        'No Activities today yet!',
        style: TextStyle(fontSize: 30),
      ));
    }
    return listContent;
  }

  //Build Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monday')),
      body: buildListContent(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openAddActivityOverlay(context),
      ),
    );
  }
}
