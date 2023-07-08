import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:active_week/list/days_list.dart';
import '../model/activity.dart';
import '../widgets/day_scaffold.dart';

//Screen of activities in a day
class FridayScreen extends StatefulWidget {
  FridayScreen({super.key, required this.activities});

  List<Activity> activities;

  @override
  State<FridayScreen> createState() => _FridayScreenState();
}

class _FridayScreenState extends State<FridayScreen> {
  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  //Method loads list of data from data base. Loads activities for Friday.
  void _loadActivities() async {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    for (final item in listData.entries) {
      final day = days.firstWhere((dayIt) => dayIt.title == item.value['day']);
      final category = Category.values
          .firstWhere((catIt) => catIt.name == item.value['category']);
      if (day == days[4]) {
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
