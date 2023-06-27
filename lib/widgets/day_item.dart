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
        elevation: 30,
        shadowColor: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadiusDirectional.all(Radius.elliptical(10, 50))),
        child: SizedBox(
          width: 120,
          height: 50,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 3, color: Theme.of(context).primaryColor),
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.elliptical(10, 50)),
            ),
            child: Center(
              child: Text(
                day.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
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
        onTap: (onSelectDay),
        child: Container(
          child: buildDay(context, day),
        ));
  }
}
