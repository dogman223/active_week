import 'package:flutter/material.dart';

import '../list/days_list.dart';
import '../model/day.dart';

//Grid of day. Apearance of each section of day on week_screen.
class DayItem extends StatefulWidget {
  const DayItem({
    super.key,
    required this.day,
    required this.onSelectDay,
  });

  final Day day;
  final void Function() onSelectDay;

  @override
  State<DayItem> createState() => _DayItemState();
}

class _DayItemState extends State<DayItem> {
  //Method sets subtitle with name of day on item of day
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
    }
  }

  //Method sets subtitle with date on item of day
  setDate() {
    String date;
    switch (widget.day.title) {
      case 'Yesterday':
        return date = widget.day.value.toString();
      case 'Today':
        return date = widget.day.value.toString();
      case 'Tomorrow':
        return date = widget.day.value.toString();
      default:
        return date = '';
    }
  }

  //Widget builds column with day.
  Widget buildDayTitle(BuildContext context, Day day) {
    var dayTitle = Center(
      child: Text(
        days.indexOf(widget.day) < 3
            ? widget.day.title
            : widget.day.value.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );

    var weekdayTitle = Text(setWeekday());
    var date = Text(setDate());

    return Card(
        elevation: 30,
        shadowColor: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadiusDirectional.all(Radius.elliptical(10, 50))),
        child: SizedBox(
          width: 140,
          height: 50,
          child: Column(
            children: [dayTitle, date, weekdayTitle],
          ),
        ));
  }

  //Inkwell build options
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Theme.of(context).primaryColor,
        splashFactory: InkSparkle.splashFactory,
        borderRadius: const BorderRadius.all(Radius.elliptical(10, 50)),
        onTap: (widget.onSelectDay),
        child: Container(
          child: buildDayTitle(context, widget.day),
        ));
  }
}
