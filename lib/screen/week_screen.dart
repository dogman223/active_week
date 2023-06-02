import 'package:flutter/material.dart';

import '../day_screen/friday.dart';
import '../day_screen/saturday.dart';
import '../day_screen/sunday.dart';
import '../day_screen/thursday.dart';
import '../day_screen/tuesday.dart';
import '../day_screen/wenesday.dart';
import '/list/days_list.dart';
import '/model/activity.dart';
import '/model/day.dart';
import '/widgets/day_item.dart';
import '/day_screen/monday.dart';

//Visible main menu with view of days in week
class WeekScreen extends StatelessWidget {
  WeekScreen({super.key});

  //Selecting day Function
  void _selectDay(BuildContext context, Day day) {
    switch (days.indexOf(day)) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MondayScreen(
                  activities: [],
                )));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TuesdayScreen(
                  activities: [],
                )));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WenesdayScreen(
                  activities: [],
                )));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ThursdayScreen(
                  activities: [],
                )));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FridayScreen(
                  activities: [],
                )));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SaturdayScreen(
                  activities: [],
                )));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SundayScreen(
                  activities: [],
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
        body: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 130,
                childAspectRatio: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1),
            children: [
              for (final day in days)
                DayItem(
                    day: day,
                    onSelectDay: () {
                      _selectDay(context, day);
                    })
            ]));
  }
}
