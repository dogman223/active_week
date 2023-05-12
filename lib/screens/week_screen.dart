import 'package:flutter/material.dart';

//Visible main menu with view of days in week
class WeekScreen extends StatelessWidget {
  const WeekScreen({super.key});

  //Widget builds column with day
  Widget buildDayColumn(BuildContext context, String title) {
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
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
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
              buildDayColumn(context, 'Monday'),
              buildDayColumn(context, 'Tuesday'),
              buildDayColumn(context, 'Wenesday'),
              buildDayColumn(context, 'Thursday'),
              buildDayColumn(context, 'Friday'),
              buildDayColumn(context, 'Saturday'),
              buildDayColumn(context, 'Sunday'),
            ]));
  }
}
