import 'dart:convert';

import 'package:active_week/widgets/day_scaffold.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:active_week/list/days_list.dart';
import '../model/activity.dart';
import '../widgets/new_activity.dart';
import 'package:active_week/widgets/list_content.dart';

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

  //Method loads list of data from data base. Loads activities for Monday.
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

  //Build Scaffold
  @override
  Widget build(BuildContext context) {
    return DayScaffold(activities: widget.activities);
  }
}
