import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:active_week/list/days_list.dart';
import '../model/activity.dart';
import '../widgets/new_activity.dart';
import '../widgets/activity_item.dart';

//Screen of activities on Monday
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

  //List<Activity> mondayActivities = [];

  //Method loads list of data from data base.
  void _loadActivities() async {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);

    for (final item in listData.entries) {
      final day = days.firstWhere((dayIt) => dayIt.title == item.value['day']);
      final category = Category.values
          .firstWhere((catIt) => catIt.name == item.value['category']);
      if (day == days[0]) {
        widget.activities.add(Activity(item.value['title'], day, category));
      }
    }

    setState(() {
      widget.activities;
      //mondayActivities;
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

  //Widget builds list of data(activities) if not empty.
  Widget buildListContent(BuildContext context) {
    Widget listContent = ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.activities.length,
        itemBuilder: (context, index) {
          return ActivityItem(activity: widget.activities[index]);
        });

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
      appBar: AppBar(
          title: const Text(
        'Monday',
      )),
      body: buildListContent(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openAddActivityOverlay(context),
      ),
    );
  }
}
