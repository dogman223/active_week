import 'package:flutter/material.dart';
import '/model/activity.dart';

//View of activities in a day
class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen(
      {super.key, required this.title, required this.activities});

  final String title;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(itemBuilder: (context, index) => Text(title)));
  }
}
