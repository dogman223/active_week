import 'package:flutter/material.dart';
import '../model/day.dart';

//Grid of day. Apearance of each section of day on week_screen.
class DayItem extends StatelessWidget {
  const DayItem({
    super.key,
    required this.day,
    required this.onSelectDay,
  });

  final Day day;
  final void Function() onSelectDay;
  //Widget builds column with day
  Widget buildDay(BuildContext context, Day title) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 3),
        borderRadius:
            const BorderRadiusDirectional.all(Radius.elliptical(70, 50)),
      ),
      child: Text(
        day.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (onSelectDay),
        child: Container(
          child: buildDay(context, day),
        ));
  }
}
