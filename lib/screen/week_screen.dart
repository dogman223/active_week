import 'package:active_week/model/activity.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '/day_screen/monday.dart';
import '../day_screen/friday.dart';
import '../day_screen/saturday.dart';
import '../day_screen/sunday.dart';
import '../day_screen/thursday.dart';
import '../day_screen/tuesday.dart';
import '../day_screen/wednesday.dart';
import '/list/days_list.dart';
import '/model/day.dart';
import '/widgets/day_item.dart';

//Visible main menu with view of days in week
class WeekScreen extends StatefulWidget {
  const WeekScreen({super.key});

  @override
  State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  late final Activity activity;
  final List<Activity> activities = [];

  //Method deletes activity from activities list
  void _deleteActivity(Activity activity) {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list/${activity.id}.json');
    http.delete(url);
    setState(() {
      activities.remove(activity);
    });
  }

  //Selecting day Function
  void _selectDay(BuildContext context, Day day) {
    switch (day.title) {
      case 'Monday':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MondayScreen(
                  activities: [],
                  deleteActivity: _deleteActivity,
                )));
        break;
      case 'Tuesday':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TuesdayScreen(
                  activities: [],
                  deleteActivity: _deleteActivity,
                )));
        break;
      case 'Wednesday':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WednesdayScreen(
                  activities: [],
                  deleteActivity: _deleteActivity,
                )));
        break;
      case 'Thursday':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ThursdayScreen(
                  activities: [],
                  deleteActivity: _deleteActivity,
                )));
        break;
      case 'Friday':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FridayScreen(
                  activities: [],
                  deleteActivity: _deleteActivity,
                )));
        break;
      case 'Saturday':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SaturdayScreen(
                  activities: [],
                  deleteActivity: _deleteActivity,
                )));
        break;
      case 'Sunday':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SundayScreen(
                  activities: [],
                  deleteActivity: _deleteActivity,
                )));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Active Week'),
        ),
        body: Center(
          child: Column(children: [
            for (final day in days)
              Container(
                padding: const EdgeInsets.all(20),
                child: DayItem(
                    day: day,
                    onSelectDay: () {
                      _selectDay(context, day);
                      _deleteActivity(activity);
                    }),
              )
          ]),
        ));
  }
}
