import 'package:flutter/material.dart';

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
      child: const Center(child: Text("Let's start this week!")),
    );
  }
}
