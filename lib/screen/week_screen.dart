// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:active_week/screen/day_screen.dart';
import 'package:flutter/material.dart';

import '/list/days_list.dart';
import '/model/day.dart';
import '../widgets/day_item.dart';

//Visible main menu with view of days in week
class WeekScreen extends StatefulWidget {
  WeekScreen({super.key});

  @override
  State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  //Future navigates to screen of day
  Future navigateDayScreen(BuildContext context, Widget buildDayScreen) {
    var navigator = Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => buildDayScreen,
    ));
    return navigator;
  }

  void _selectDateTime(BuildContext context) {
    final today = DateTime.now();
    int count = today.day;
    for (count - 1; count < 32; count++) {
      navigateDayScreen(
          context,
          DayScreen(
            activities: [],
          ));
    }
  }

  //Selecting day Function.
  //Switching navigation to screen of chosen day
  void _selectDay(BuildContext context, Day day) {
    switch (day.title) {
      case 'Yesterday':
        navigateDayScreen(
            context,
            DayScreen(
              activities: [],
            ));
        break;
      case 'Today':
        navigateDayScreen(
            context,
            DayScreen(
              activities: [],
            ));
        break;
      case 'Tomorrow':
        navigateDayScreen(
            context,
            DayScreen(
              activities: [],
            ));
        break;
      case 'Day After tomorrow':
        navigateDayScreen(
            context,
            DayScreen(
              activities: [],
            ));
        break;
      case 'Second Day After tomorrow':
        navigateDayScreen(
            context,
            DayScreen(
              activities: [],
            ));
        break;
      case 'Third Day After tomorrow':
        navigateDayScreen(
            context,
            DayScreen(
              activities: [],
            ));
        break;
      case 'Fourth Day After tomorrow':
        navigateDayScreen(
            context,
            DayScreen(
              activities: [],
            ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: const Text('Active Week'),
          elevation: 20,
          shadowColor: Theme.of(context).primaryColor,
        ),
        body: Center(
            child: ListView.builder(
          itemBuilder: (context, day) {
            return DayItem(
                day: days[day],
                onSelectDay: () => _selectDay(context, days[day]));
          },
          itemCount: days.length,
          scrollDirection: Axis.horizontal,
        )));
  }
}
