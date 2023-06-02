import 'package:flutter/material.dart';
import '/day_screen/monday.dart';
import '../model/day.dart';

//Grid of day
class DayItem extends StatelessWidget {
  const DayItem({super.key, required this.day, required this.onSelectDay});

  final Day day;
  final void Function() onSelectDay;

  //Widget builds column with day
  Widget buildDayColumn(BuildContext context, Day title) {
    return Column(
      children: [
        Flexible(
          child: Container(
            height: 200,
            width: 90,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              day.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (onSelectDay),
        child: Container(
          child: buildDayColumn(context, day),
        ));
  }
}
