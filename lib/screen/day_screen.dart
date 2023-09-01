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
      final date = dates.firstWhere(
          (dateIt) => formatter.format(dateIt) == item.value['date']);
      final category = Category.values
          .firstWhere((catIt) => catIt.name == item.value['category']);
      if (date.day == widget.day.value.day) {
        widget.activities.add(Activity(item.value['title'], category, date));
      }
    }
    setState(() {
      widget.activities;
    });
  }

  //Method sets title on day screen
  setTitle() {
    String dayTitle;
    switch (widget.day.title) {
      case 'Yesterday':
        return dayTitle = widget.day.title;
      case 'Today':
        return dayTitle = widget.day.title;
      case 'Tomorrow':
        return dayTitle = widget.day.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DayScaffold(activities: widget.activities, dayTitle: setTitle());
  }
}
