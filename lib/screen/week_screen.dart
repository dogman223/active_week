// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '/day_screen/monday.dart';
import '../day_screen/friday.dart';
import '../day_screen/saturday.dart';
import '../day_screen/sunday.dart';
import '../day_screen/thursday.dart';
import '../day_screen/tuesday.dart';
import '../day_screen/wednesday.dart';
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

  //Selecting day Function.
  //Switching navigation to screen of chosen day
  void _selectDay(BuildContext context, Day day) {
    switch (day.title) {
      case 'Monday':
        navigateDayScreen(
            context,
            MondayScreen(
              activities: [],
            ));
        break;
      case 'Tuesday':
        navigateDayScreen(
            context,
            TuesdayScreen(
              activities: [],
            ));
        break;
      case 'Wednesday':
        navigateDayScreen(
            context,
            WednesdayScreen(
              activities: [],
            ));
        break;
      case 'Thursday':
        navigateDayScreen(
            context,
            ThursdayScreen(
              activities: [],
            ));
        break;
      case 'Friday':
        navigateDayScreen(
            context,
            FridayScreen(
              activities: [],
            ));
        break;
      case 'Saturday':
        navigateDayScreen(
            context,
            SaturdayScreen(
              activities: [],
            ));
        break;
      case 'Sunday':
        navigateDayScreen(
            context,
            SundayScreen(
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
          child: Column(children: [
            for (final day in days)
              Container(
                padding: const EdgeInsets.all(20),
                child: DayItem(
                    day: day,
                    onSelectDay: () {
                      _selectDay(context, day);
                    }),
              )
          ]),
        ));
  }
}
