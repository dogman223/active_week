import 'package:flutter/material.dart';

import '/model/day.dart';

//Grid of day
class DayItem extends StatelessWidget {
  const DayItem({super.key, required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          child: Text(day.title),
        ));
  }
}
