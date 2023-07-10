import 'dart:convert';

import 'package:active_week/widgets/day_scaffold.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model/activity.dart';
import '../list/days_list.dart';
import '../model/day.dart';

//Screen of activities in a day
class TuesdayScreen extends StatefulWidget {
  TuesdayScreen({super.key, required this.activities});

  List<Activity> activities;

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

  //Build Scaffold
  @override
  Widget build(BuildContext context) {
    return DayScaffold(
      activities: widget.activities,
      title: 'Tuesday',
    );
  }
}
