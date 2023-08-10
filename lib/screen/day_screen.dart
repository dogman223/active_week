import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:active_week/model/activity.dart';
import 'package:active_week/widgets/day_scaffold.dart';

import '../list/days_list.dart';

class DayScreen extends StatefulWidget {
  DayScreen({super.key, required this.activities});

  List<Activity> activities;

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

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
        widget.activities
            .add(Activity(item.value['title'], category, day.value));
      }
    }
    setState(() {
      widget.activities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DayScaffold(activities: widget.activities, dayTitle: 'Day');
  }
}
