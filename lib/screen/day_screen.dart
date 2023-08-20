import 'dart:convert';

import 'package:active_week/model/day.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:active_week/model/activity.dart';
import 'package:active_week/widgets/day_scaffold.dart';

import '../list/days_list.dart';

//Screen with view of chosen day
class DayScreen extends StatefulWidget {
  DayScreen({super.key, required this.activities, required this.day});

  List<Activity> activities;
  final Day day;

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
      final date =
          dates.firstWhere((dateIt) => dateIt.isUtc == item.value['date']);
      final category = Category.values
          .firstWhere((catIt) => catIt.name == item.value['category']);
      if (date == widget.day.value) {
        widget.activities.add(Activity(item.value['title'], category, date));
      }
    }
    setState(() {
      widget.activities;
    });
  }

  //Method sets title with name of day
  setWeekday() {
    String weekDayTitle;
    switch (widget.day.weekday) {
      case 0:
        return weekDayTitle = 'Sunday';
      case 1:
        return weekDayTitle = 'Monday';
      case 2:
        return weekDayTitle = 'Tuesday';
      case 3:
        return weekDayTitle = 'Wednesday';
      case 4:
        return weekDayTitle = 'Thursday';
      case 5:
        return weekDayTitle = 'Friday';
      case 6:
        return weekDayTitle = 'Saturday';
      case 7:
        return weekDayTitle = 'Sunday';
      default:
        return weekDayTitle = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DayScaffold(activities: widget.activities, dayTitle: setWeekday());
  }
}
