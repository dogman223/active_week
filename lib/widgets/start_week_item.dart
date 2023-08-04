import 'package:flutter/material.dart';

//Item of button in main menu
class StartWeekItem extends StatelessWidget {
  const StartWeekItem({
    super.key,
    required this.selectStartWeek,
  });

  final void Function() selectStartWeek;

  @override
  Widget build(context) {
    return InkWell(
      onTap: (selectStartWeek),
      child: const Center(
          child: Text(
        "Go to Activities!",
        style: TextStyle(color: Colors.white, fontSize: 30),
      )),
    );
  }
}
