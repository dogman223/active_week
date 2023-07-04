import 'dart:convert';

import 'package:active_week/widgets/activity_item.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model/activity.dart';
import '../widgets/new_activity.dart';
import '../list/days_list.dart';

//Screen of activities in a day
class TuesdayScreen extends StatefulWidget {
  TuesdayScreen({super.key, required this.activities});

  List<Activity> activities;
  String? error;

  @override
  State<TuesdayScreen> createState() => _TuesdayScreenState();
}

class _TuesdayScreenState extends State<TuesdayScreen> {
  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  //Method loads list of data from data base. Loads activities for Tuesday.
  void _loadActivities() async {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list.json');
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      setState(() {
        widget.error = 'Failed to fetch data. Please try again later...';
      });
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    for (final item in listData.entries) {
      final day = days.firstWhere((dayIt) => dayIt.title == item.value['day']);
      final category = Category.values
          .firstWhere((catIt) => catIt.name == item.value['category']);
      if (day == days[1]) {
        widget.activities.add(Activity(
          item.value['title'],
          day,
          category,
          item.key,
        ));
      }
    }
    setState(() {
      widget.activities;
    });
  }

  //Method opens modal bottom sheet with add new activity function.
  void _openAddActivityOverlay(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (contex) => NewActivity(onAddActivity: _addActivity));
  }

  void _addActivity(Activity activity) {
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

  //Widget builds list of activities if not empty
  Widget buildListContent(BuildContext context) {
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
        'No Activities today yet!',
        style: TextStyle(fontSize: 30),
      ));
    }

    if (widget.error != null) {
      listContent = Center(
          child: Text(
        widget.error!,
        style: const TextStyle(fontSize: 30),
      ));
    }

    return listContent;
  }

  //Build Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuesday'),
        elevation: 20,
        shadowColor: Theme.of(context).primaryColor,
      ),
      body: buildListContent(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openAddActivityOverlay(context),
      ),
    );
  }
}
