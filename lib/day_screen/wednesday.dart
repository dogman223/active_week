import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:active_week/list/days_list.dart';
import '../model/activity.dart';
import '../widgets/day_scaffold.dart';

//Screen of activities in a day
class WednesdayScreen extends StatefulWidget {
  WednesdayScreen({super.key, required this.activities});

  List<Activity> activities;

  @override
  State<WednesdayScreen> createState() => _WenesdayScreenState();
}

class _WenesdayScreenState extends State<WednesdayScreen> {
  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  //Method loads list of data from data base. Loads activities for Wednesday.
  void _loadActivities() async {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    for (final item in listData.entries) {
      final day = days.firstWhere((dayIt) => dayIt.title == item.value['day']);
      final category = Category.values
          .firstWhere((catIt) => catIt.name == item.value['category']);
      if (day == days[2]) {
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
      title: 'Wednesday',
    );
  }
}
