import 'package:flutter/material.dart';

import '/list/days_list.dart';
import '/model/activity.dart';
import '/model/day.dart';
import '/widgets/day_item.dart';
import './day_activities_screen.dart';

//Visible main menu with view of days in week
class WeekScreen extends StatelessWidget {
  const WeekScreen({super.key});

  //Selecting day Function
  void _selectDay(
    BuildContext context,
  ) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DayActivitiesScreen(activities: [
              Activity('a1', 'Programming', days.first, Category.learning),
              Activity('a2', 'Gaming', days.first, Category.entertainment)
            ])));
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
                      _selectDay(context);
                    })
            ]));
  }
}
